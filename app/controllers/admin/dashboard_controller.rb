class Admin::DashboardController < ApplicationController
  def show
    @num_of_products = count_products
    @num_of_categories = count_categories
  end

  def count_products
    Product.count
  end

  def count_categories
    Product.select(:category_id).distinct.count
  end
end
