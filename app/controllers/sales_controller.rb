class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  def create

    @sale = Sale.new(sale_params)
    @sale.save!
    redirect_to sales_path
  end
  def done
    @sales = Sale.all
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
