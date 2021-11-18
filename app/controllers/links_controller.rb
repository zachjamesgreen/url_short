class LinksController < ApplicationController
  # before_filter :authenticate_user!

  def new
    @link = Link.new
  end

  # def edit
  #   @link = Link.find(params[:id])
  # end

  def create
    @link = Link.new(url: params[:link][:url])
    @link.user = @current_user
    @link.slug = SecureRandom.urlsafe_base64(4)

    if @link.save
      get_title
      redirect_to link_path(@link)
    else
      flash[:error] = @link.errors.full_messages.join(", ")
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  # def update
  #   @link = Link.find(params[:id])

  #   if @link.update(link_params)
  #     redirect_to @link
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @link = Link.find(params[:id])
  #   @link.destroy
  # end

  private 

  def get_title
    begin
      conn = Faraday.new do |f|
        f.response :follow_redirects
      end
      response = conn.get(@link.url)
      @link.update(title: Nokogiri::HTML(response.body).title)
    rescue => e
      @link.update(title: "Unable to get title")
    end

  end

end