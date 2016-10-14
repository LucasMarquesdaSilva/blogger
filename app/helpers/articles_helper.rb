module ArticlesHelper

  def articles_params
    params.require(:article).permit(:title, :body)
  end
  
end
