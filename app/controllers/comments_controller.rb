class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    # Crear el comentario asociado al usuario logueado
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    # @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
    private

    def comment_params
     params.require(:comment).permit(:commenter, :body)
    end
end