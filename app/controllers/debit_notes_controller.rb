class DebitNotesController < ApplicationController
  before_action :set_debit_note, only: [:show, :edit, :update, :destroy]

  # GET /debit_notes
  # GET /debit_notes.json
  def index
    @debit_notes = DebitNote.all
  end

  # GET /debit_notes/1
  # GET /debit_notes/1.json
  def show
  end

  # GET /debit_notes/new
  def new
    @debit_note = DebitNote.new
    @customers = Customer.all
    
    @sales_selected = Sale.select("sales.id, customer_contract").joins(:fixation).where("debit_note_id = 0")
    @sales_not_selected = Sale.joins(:fixation).where("customer_id = 0 and debit_note_id is null")

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render :json => @sales }
    end
    
  end

  # GET /debit_notes/1/edit
  def edit
    @customers = Customer.all
    #@sales_selected = Sale.select("sales.id, customer_contract").joins(:fixation).where("debit_note_id = ?", params[:id])
    #@sales_not_selected = Sale.joins(:fixation).where("customer_id = ? and debit_note_id is null", @debit_note.customer_id)
  end
  

  # POST /debit_notes
  # POST /debit_notes.json
  def create
    @debit_note = DebitNote.new(debit_note_params)
    @customers = Customer.all

    respond_to do |format|
      if @debit_note.save
        
        Fixation.joins(:sale).where("sale_id in (?)", params[:sales_selected]).update_all(debit_note_id: @debit_note.id)
        
        format.html { redirect_to @debit_note, notice: 'Debit note was successfully created.' }
        format.json { render :show, status: :created, location: @debit_note }
      else
        format.html { render :new }
        format.json { render json: @debit_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debit_notes/1
  # PATCH/PUT /debit_notes/1.json
  def update
    #raise params.inspect
    respond_to do |format|
      if @debit_note.update(debit_note_params)
        
        Fixation.where("debit_note_id = ?", params[:id]).update_all(debit_note_id: nil)
        Fixation.joins(:sale).where("sale_id in (?)", params[:debit_note][:id]).update_all(debit_note_id: params[:id])
        
        format.html { redirect_to @debit_note, notice: 'Debit note was successfully updated.' }
        format.json { render :show, status: :ok, location: @debit_note }
      else
        format.html { render :edit }
        format.json { render json: @debit_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debit_notes/1
  # DELETE /debit_notes/1.json
  def destroy
    
    Fixation.where("debit_note_id = ?", params[:id]).update_all(debit_note_id: nil)
    @debit_note.destroy
    
    respond_to do |format|
      format.html { redirect_to debit_notes_url, notice: 'Debit note was successfully destroyed.' }
      format.json { head :no_content }
    end
    
  end

  def update_sales

    @sales = Sale.joins(:fixation).where("debit_note_id IS NULL AND customer_id = ?", params[:customer_id])

    respond_to do |format|
      format.js
      #format.json { render json: @sales }
    end
  end


# ****************************************************************************************************************

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debit_note
      
      @debit_note = DebitNote.find(params[:id])
      @sales = Sale.joins(:fixation).where("debit_note_id = ?", params[:id])

      @sales_selected = Sale.select("sales.id, customer_contract").joins(:fixation).where("debit_note_id = ?", params[:id])
      @sales_not_selected = Sale.joins(:fixation).where("customer_id = ? and debit_note_id is null", @debit_note.customer_id)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debit_note_params
      params.require(:debit_note).permit( :customer_id,
                                          :bank_info, 
                                          :total_ammount )
    end
end
