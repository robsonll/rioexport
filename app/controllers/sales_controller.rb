class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy, :saleReport]

  require 'prawn'
  attr_accessor :path


  PDF_OPTIONS = {
      :page_size   => "A4",
      :page_layout => :landscape,
      :margin      => [40, 75]
  }


  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @sale.build_shipping
    @sale.build_fixation
    @supliers = Suplier.all
    @customers = Customer.all
  end

  # GET /sales/1/edit
  def edit
    #@sale = Sale.find(params[:id]) 
    @sale.build_shipping if @sale.shipping.nil?
    @sale.build_fixation if @sale.fixation.nil?
  end

  # POST /sales
  # POST /sales.json
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

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
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

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: t("activerecord.controller_msg.sale.destroyed", :default => 'Sale was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

# *********************************************************************************************
# * Relatorio Prawn
# *********************************************************************************************

  def allSalesReport

    # Save and open pdf
    #filename = File.join(Rails.root, "app/report", "SalesList.pdf")
    #pdf.render_file filename
    #send_file filename, :filename => "SalesList.pdf", :type => "application/pdf"

    # Open pdf
    send_data allSales_pdf.render, :filename => "SalesList.pdf", :type => "application/pdf"

  end

  def allSales_pdf

    Prawn::Document.new(PDF_OPTIONS) do |pdf|

      image_path ="#{Rails.root}/app/assets/images/cafe_saca1.jpg"

      data = [ [{:image => image_path, :image_height => 40, :image_width => 50 }, "RioExport"]]

      pdf.table(data, :cell_style =>{:size => 22,:text_color =>"346842"}) do
        cells.borders = []
      end  

      pdf.stroke_horizontal_rule      

      pdf.move_down 20
      pdf.text "Listagem de Vendas", :size => 12, :align => :left, :style => :bold

      pdf.table allSales_rows do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.column_widths = [40, 300, 200]
      end

    end

  end

  def allSales_rows
    @sales = Sale.all

    [['#', 'Name']] +
      @sales.map do |sale|
      [sale.id, sale.suplier_id]
    end
  end  


  def saleReport

    # Save and open pdf
    #filename = File.join(Rails.root, "app/report", "SalesList.pdf")
    #pdf.render_file filename
    #send_file filename, :filename => "SalesList.pdf", :type => "application/pdf"

    # Open pdf
    send_data sale_pdf.render, :filename => "Sale.pdf", :type => "application/pdf"

  end

  def sale_pdf

    Prawn::Document.new(PDF_OPTIONS) do |pdf|

      image_path ="#{Rails.root}/app/assets/images/cafe_saca1.jpg"

      data = [ [{:image => image_path, :image_height => 40, :image_width => 50 }, "RioExport"]]

      pdf.table(data, :cell_style =>{:size => 22,:text_color =>"346842"}) do
        cells.borders = []
      end  

      pdf.stroke_horizontal_rule      

      pdf.move_down 20
      pdf.text "Venda Unica", :size => 12, :align => :left, :style => :bold

      pdf.move_down 30

      data = [ 
                ["Buyer:", @sale.customer.name],
                ["Seller:", @sale.suplier.name],
                ["Shipping Date:", @sale.shipping_date],
                ["Price:", @sale.price]
              ]

      pdf.table(data, :cell_style =>{:size => 22,:text_color =>"346842"}) do
        cells.borders = []
      end  

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
                                    :shipping_company, 
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
