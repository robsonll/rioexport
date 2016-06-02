class ReportsController < ApplicationController

  require 'prawn'
  attr_accessor :path


  PDF_OPTIONS = {
      :page_size   => "A4",
      :page_layout => :portrait,
      :margin      => [40, 75]
  }


# *********************************************************************************************
# * Relatorio de listagem de todas as vendas
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

# *********************************************************************************************
# * Relatorio de listagem de venda específica
# *********************************************************************************************

  def saleReport

    # Save and open pdf
    #filename = File.join(Rails.root, "app/report", "SalesList.pdf")
    #pdf.render_file filename
    #send_file filename, :filename => "SalesList.pdf", :type => "application/pdf"
    
    @sale = Sale.find(params[:id])

    # Open pdf
    send_data sale_pdf.render, :filename => "Sale.pdf", :type => "application/pdf"

  end

  def sale_pdf

   # d = DateTime.now
    
    Prawn::Document.new(PDF_OPTIONS) do |pdf|

      image_path ="#{Rails.root}/app/assets/images/cafe_saca1.jpg"

      data = [ [{:image => image_path, :image_height => 40, :image_width => 50 }, "RioExport"]]

      pdf.table(data, :cell_style =>{:size => 32,:text_color =>"000000"}) do
        cells.borders = []
      end  

      #pdf.stroke_horizontal_rule      

      pdf.move_down 20

      pdf.text I18n.localize Date.today, format: :data_completa, :size => 12, :align => :left, :style => :bold

      pdf.move_down 30

      pdf.text 'Tendo em vista os embarques ocorridos, estamos apresentando para seu acordo , os cálculos para emissão da Nota fiscal, como segue :'
      
      pdf.move_down 2
      
      pdf.text 'Dados para nota fiscal eletrônica :  nr   560'
      
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
# * Relatorio de listagem de venda para o fornecedor
# *********************************************************************************************

  def suplierSaleReport

    # Save and open pdf
    #filename = File.join(Rails.root, "app/report", "SalesList.pdf")
    #pdf.render_file filename
    #send_file filename, :filename => "SalesList.pdf", :type => "application/pdf"
    
    @sale = Sale.find(params[:id])

    # Open pdf
    send_data suplierSale_pdf.render, :filename => "SuplierSale.pdf", :type => "application/pdf"

  end

  def suplierSale_pdf

   # d = DateTime.now
    
    Prawn::Document.new(PDF_OPTIONS) do |pdf|

      image_path ="#{Rails.root}/app/assets/images/logo_rioexport.png"

      data = [ [{:image => image_path, :image_height => 120, :image_width => 480 }]]

      pdf.table(data, :cell_style =>{:size => 32,:text_color =>"000000"}) do
        cells.borders = []
      end  

      #pdf.stroke_horizontal_rule      

      pdf.move_down 20

      pdf.text I18n.localize Date.today, format: :data_completa, :size => 12, :align => :left, :style => :bold

      pdf.move_down 30

      pdf.text 'Tendo em vista os embarques ocorridos, estamos apresentando para seu acordo , os cálculos para emissão da Nota fiscal, como segue :'
      
      pdf.move_down 10
      
      pdf.text 'Dados para nota fiscal eletrônica :  nr   560'
      
      pdf.move_down 30
      
      pdf.text @sale.suplier.complete_name
      pdf.text @sale.suplier.address
      pdf.text 'CNPJ: ' + @sale.suplier.cnpj
      pdf.text 'Insc. Estadual: ' + @sale.suplier.inscr_est
      pdf.text 'Email: ' + @sale.suplier.email
      
      pdf.move_down 30
      
      pdf.text 'Comissão em dolar: ' + @sale.suplier_commission
      pdf.text 'Taxa de câmbio: '
      pdf.text 'Valor serviço em reais: '
      pdf.text 'IRRF - 1,5%: '
      pdf.text 'Valor líquido a receber: '

      pdf.move_down 30

      pdf.text 'Estando tudo correto, solicitamos que o depósito seja feito na conta:'
      
      pdf.move_down 10
      
      pdf.text 'Banco Bradesco S.A.'
      pdf.text 'Agência: 1452-4'
      pdf.text 'Conta Corrente: 25612-9'
    end

  end


end
