class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  def index
    @businesses = Business.filter(params[:filter])
    @categories = @businesses.select(:category).distinct
    @subcategories = @businesses.select(:subcategory).distinct

    @filter_all = @categories.length > 1
    @filter_cat = @filter_all ^ (@subcategories.length > 1)
    @filter_subcat = @subcategories.length == 1
  end

  # GET /businesses/1
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
    @subcat_options = Business.all_subcats
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business, notice: 'Business was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      redirect_to @business, notice: 'Business was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /businesses/1
  def destroy
    @business.destroy
    redirect_to businesses_url, notice: 'Business was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
      params.require(:business).permit(:filter, :value, :attribute, :category, :subcategory, :name, :phone, :phone_ext, :email, :address, :street, :unit, :city, :state, :zip_code, :website, :about, :women, :minority, :black, :su_open, :su_close, :mo_open, :mo_close, :tu_open, :tu_close, :we_open, :we_close, :th_open, :th_close, :fr_open, :fr_close, :sa_open, :sa_close, {service_ids: []})
    end
end
