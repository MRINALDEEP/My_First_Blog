class ArticlesController < ApplicationController
  before_action :set_params, only: [:edit,:show,:update,:destroy]
  before_action :require_user,except: [:index, :show]
  before_action :require_same_user,only: [:edit,:update,:destroy]
  def index
    @articles=Article.paginate(page: params[:page],per_page:5)
  end
 
  def new
    @article=Article.new
  end
  def create
   #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user=current_user
    
    if @article.save
      flash[:success] = "Article Successfully Created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def show
   
  end
  def edit
   
  end
  def update
    
    if @article.update(article_params)
      flash[:success]="Article was Succesfully Updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def destroy
    
    @article.destroy
    flash[:danger]="Article Succesfully Deleted"
    redirect_to articles_path
  end
  private
    def set_params
      @article=Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description) 
    end
    def require_same_user
      if current_user != @article.user
        flash[:danger]="You Can Only Edit Or Delete Your Own Article"
        redirect_to articles_path
      end
    end
        
   end 