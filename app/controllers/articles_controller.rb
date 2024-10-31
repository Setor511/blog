class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    # params = {id: 1}
    @article = Article.find(params[:id])
  end

  # muestra el formulario
  def new
      @article = Article.new
  end

  # toma los params ya filtrados y crea el artículo: si se crea correctamente, lo muestro, si falla, muestro los errores en el mismo new
  def create
      @article = Article.new(articles_params)
      if @article.save
        redirect_to @article
      else
        render :new, status: :unprocessable_entity
      end
   end

  private
    def articles_params
      params.require(:article).permit(:title, :body)
    end
end
