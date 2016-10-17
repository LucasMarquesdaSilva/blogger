module ArticlesHelper

  def articles_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

end
