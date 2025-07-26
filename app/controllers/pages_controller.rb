class PagesController < ApplicationController
  def home
  @featured_posts = Post.order("RANDOM()").limit(3)
end

end
