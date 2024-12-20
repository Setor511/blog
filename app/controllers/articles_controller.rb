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
    @article = Article.new(article_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(articles_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, status: :see_other
  end

  private
    def articles_params
      params.require(:article).permit(:title, :body)
    end
end
