class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user  # Assign the logged-in user
  
      if @comment.save
        redirect_to @post, notice: "Comment added successfully!"
      else
        redirect_to @post, alert: "Failed to add comment."
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  