class CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post)
    end


    def edit
      @comment = Comment.find(params[:post_id])
      @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @comment = Comment.find(params[:post_id])
        if @comment.update(comment_params)
          redirect_to post_path(params[:id]), notice: 'Post was successfully updated.'
        else
          render :edit
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post), status: :see_other
    end
  
    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end
  end