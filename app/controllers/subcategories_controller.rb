class SubcategoriesController < ApplicationController
	before_action :set_subs_and_cats, only: [:index, :show]

  def index

  end

  def show
  	@subcategory = Subcategory.find(params[:id])
  end

  def set_subs_and_cats
  	@categories = Category.all
  	@subcategories = Subcategory.all
  end
end
