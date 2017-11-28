class SalexcommsController < ApplicationController
  before_action :set_salexcomm, only: [:show, :edit, :update, :destroy]

  # GET /salexcomms
  # GET /salexcomms.json
  def index
    @salexcomms = Salexcomm.all
  end

  # GET /salexcomms/1
  # GET /salexcomms/1.json
  def show
  end

  # GET /salexcomms/new
  def new
    @salexcomm = Salexcomm.new
  end

  # GET /salexcomms/1/edit
  def edit
  end

  # POST /salexcomms
  # POST /salexcomms.json
  def create
    @salexcomm = Salexcomm.new(salexcomm_params)

    respond_to do |format|
      if @salexcomm.save
        format.html { redirect_to @salexcomm, notice: 'Salexcomm was successfully created.' }
        format.json { render :show, status: :created, location: @salexcomm }
      else
        format.html { render :new }
        format.json { render json: @salexcomm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salexcomms/1
  # PATCH/PUT /salexcomms/1.json
  def update
    respond_to do |format|
      if @salexcomm.update(salexcomm_params)
        format.html { redirect_to @salexcomm, notice: 'Salexcomm was successfully updated.' }
        format.json { render :show, status: :ok, location: @salexcomm }
      else
        format.html { render :edit }
        format.json { render json: @salexcomm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salexcomms/1
  # DELETE /salexcomms/1.json
  def destroy
    @salexcomm.destroy
    respond_to do |format|
      format.html { redirect_to salexcomms_url, notice: 'Salexcomm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salexcomm
      @salexcomm = Salexcomm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salexcomm_params
      params.require(:salexcomm).permit(:quanxcomm, :subtotal)
    end
end
