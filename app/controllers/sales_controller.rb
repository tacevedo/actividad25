class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  def create
    sale_params[:value] = sale_params[:value].to_f * (sale_params[:discount].to_f/100)
    @sale = Sale.new(sale_params)
    @sale.save!
    redirect_to sales_path
  end
  def done
    @sales = Sale.all
  end

  private

  def sale_params
    params.require(:sale).permit(:detail, :category, :value, :discount, :tax, :total)
  end
end
