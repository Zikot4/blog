class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post
	before_action :find_comment, only: [:destroy,:edit,:show,:update,:comment_owmer]
	before_action :comment_owmer, only: [:edit,:destroy]

	def show
	end

	def create
		@comment = @commentable.comments.new comment_params
		@comment.user_id = current_user.id
		@comment.save
		redirect_to @commentable, notice: "Your comment was successful posted."
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:body,:file))
			if params[:commit] == "update without file"
				@comment.file = nil
				@comment.save
			end
			redirect_to post_path(@post), notice: "Comment was successfully updated."
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to post_path(@post), notice: "Comment was successfully destroyed."
	end

private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def find_comment
		@comment = @post.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:body,:file)
	end

	def comment_owmer
		unless  current_user.id == @comment.user_id
			redirect_to "/404.html"
		end
	end

end
