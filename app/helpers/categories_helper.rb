module CategoriesHelper
  def category_index
    @categories = Category.all
  end
end
