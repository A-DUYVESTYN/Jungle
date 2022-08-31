class Admin::DashboardController < Admin::BaseController


  def show
    @products_count = Product.count
    @categories_count = Category.count
  end

end
