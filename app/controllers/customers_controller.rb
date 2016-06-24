class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  require 'prawn'
  attr_accessor :path


  PDF_OPTIONS = {
      :page_size   => "A4",
      :page_layout => :landscape,
      # :background  => "public/images/cert_bg.png",
      :margin      => [40, 75]
  }


  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: t("activerecord.controller_msg.customer.created", :default => 'Customer was successfully created.') }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: t("activerecord.controller_msg.customer.updated", :default => 'Customer was successfully updated.') }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: t("activerecord.controller_msg.customer.destroyed", :default => 'Customer was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

# *********************************************************************************************
# * Relatorio Prawn
# *********************************************************************************************

  def allCustomersReport

    # Save and open pdf
    #filename = File.join(Rails.root, "app/report", "CustomersList.pdf")
    #pdf.render_file filename
    #send_file filename, :filename => "CustomersList.pdf", :type => "application/pdf"

    # Open pdf
    send_data allCustomers_pdf.render, :filename => "CustomersList.pdf", :type => "application/pdf"

  end

  def allCustomers_pdf

    Prawn::Document.new(PDF_OPTIONS) do |pdf|

      image_path ="#{Rails.root}/app/assets/images/cafe_saca1.jpg"

      data = [ [{:image => image_path, :image_height => 40, :image_width => 50 }, "RioExport"]]

      pdf.table(data, :cell_style =>{:size => 22,:text_color =>"346842"}) do
        cells.borders = []
      end  

      pdf.stroke_horizontal_rule      

      pdf.move_down 20
      pdf.text "Listagem de Clientes", :size => 12, :align => :left, :style => :bold

      pdf.table allClients_rows do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD', 'FFFFFF']
        self.column_widths = [40, 300, 200]
      end

    end

  end

  def allClients_rows
    @customers = Customer.all

    [['#', 'Name']] +
      @customers.map do |customer|
      [customer.id, customer.name]
    end
  end  

# *********************************************************************************************


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :complete_name, :email, :address, :state, :country)
    end

    # Metodos para utilização do Prawn



end
