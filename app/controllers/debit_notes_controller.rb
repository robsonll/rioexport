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
  end

  # GET /debit_notes/1/edit
  def edit
  end

  # POST /debit_notes
  # POST /debit_notes.json
  def create
    @debit_note = DebitNote.new(debit_note_params)

    respond_to do |format|
      if @debit_note.save
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
    respond_to do |format|
      if @debit_note.update(debit_note_params)
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
    @debit_note.destroy
    respond_to do |format|
      format.html { redirect_to debit_notes_url, notice: 'Debit note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debit_note
      @debit_note = DebitNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debit_note_params
      params.fetch(:debit_note, {})
    end
end
