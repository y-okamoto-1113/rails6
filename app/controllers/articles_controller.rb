class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(created_at: :desc)
    # IndexでActionTextを使ったデータ（今回はbodyカラムに入ってる）を表示する場合にEachを使うと「N+1問題」が起きる。
    # なぜなら、ActionTextを使ったTextは別テーブルに保存され、ドラッグ&ドロップで入れた画像はActiveStorageに保存されるからである。
    
    @articles = Article.order(created_at: :desc).with_rich_text_body
  end

  def show
  end
  
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path, notice: "作成できた！"
    else
      render :new, alert: "作成失敗！！！"
    end
  end

  def update
    if @article.update(article_params)
      redirect_to root_path, notice: "更新できた！"
    else
      render :edit, alert: "更新失敗！！！"
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path, notice: "削除成功！"
    else
      render :edit, alert: "削除失敗！！！"
    end
  end

  private
    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end



end
