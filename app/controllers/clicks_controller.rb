class ClicksController < ApplicationController

  def create
    link = Link.find_by_slug(params[:slug])
    if link
      click = Click.new(link: link)
      click.ip = request.remote_ip
      click.user_agent = request.user_agent
      click.date = Time.now
      click.save!
      redirect_to link.url
    else
      handle_not_found
    end
    
  end
end