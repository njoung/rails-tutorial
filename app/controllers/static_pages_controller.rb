class StaticPagesController < ApplicationController
  include MicropostsHelper
  
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def test_hello
  end

  def contact
  end
end
