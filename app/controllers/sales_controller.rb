class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :saleReport]


  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
    @sale.build_shipping
    @sale.build_fixation
    @supliers = Suplier.all
    @customers = Customer.all
  end

  def edit
    @sale.build_shipping if @sale.shipping.nil?
    @sale.build_fixation if @sale.fixation.nil?
  end

  def create
    @sale = Sale.new(sale_params)
    @supliers = Suplier.all
    @customers = Customer.all

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: t("activerecord.controller_msg.sale.created", :default => 'Sale was successfully created.') }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: t("activerecord.controller_msg.sale.updated", :default => 'Sale was successfully updated.') }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: t("activerecord.controller_msg.sale.destroyed", :default => 'Sale was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  
# *********************************************************************************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
      @supliers = Suplier.all
      @customers = Customer.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit( :rioexport_contract, 
                                    :suplier_contract, 
                                    :customer_contract, 
                                    :bags_qty, 
                                    :shipping_date, 
                                    :shipping_co_id,
                                    :price, 
                                    :payment_type,
                                    :product_type, 
                                    :customer_commission,
                                    :suplier_commission,
                                    :suplier_id, 
                                    :customer_id,
                                    shipping_attributes: [:id, 
                                                          :destination,
                                                          :shipping_line,
                                                          :daparture_terminal,
                                                          :arriving_terminal,
                                                          :special_conditions,
                                                          :documents],
                                    fixation_attributes: [:id, 
                                                          :fixed_lot,
                                                          :average_price,
                                                          :defferential,
                                                          :final_price]
                                  )
    end

end
