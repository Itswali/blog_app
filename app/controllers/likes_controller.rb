class LikesController < ApplicationController
  def create
    like = Like.new(like_params)
    like.user = current_user
    like.post = Post.find(like_params[:post_id])

    unless Like.where(user: current_user, post: like.post).exists?
      like.save
      like.increment_post_likes_counter
    end

    redirect_to user_post_path(like.post.author_id, like.post_id)
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
