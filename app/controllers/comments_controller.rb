class CommentsController < ApplicationController
  def index

  end

  def create
    @comment = Comment.create(comment_params)
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
