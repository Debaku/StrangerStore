class CommodotiesController < ApplicationController
  before_action :set_commodoty, only: [:show, :edit, :update, :destroy]

  # GET /commodoties
  # GET /commodoties.json
  def index
    @commodoties = Commodoty.all
  end

  # GET /commodoties/1
  # GET /commodoties/1.json
  def show
  end

  # GET /commodoties/new
  def new
    @commodoty = Commodoty.new
  end

  # GET /commodoties/1/edit
  def edit
  end

  # POST /commodoties
  # POST /commodoties.json
  def create
    @commodoty = Commodoty.new(commodoty_params)

    respond_to do |format|
      if @commodoty.save
        format.html { redirect_to @commodoty, notice: 'Commodoty was successfully created.' }
        format.json { render :show, status: :created, location: @commodoty }
      else
        format.html { render :new }
        format.json { render json: @commodoty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commodoties/1
  # PATCH/PUT /commodoties/1.json
  def update
    respond_to do |format|
      if @commodoty.update(commodoty_params)
        format.html { redirect_to @commodoty, notice: 'Commodoty was successfully updated.' }
        format.json { render :show, status: :ok, location: @commodoty }
      else
        format.html { render :edit }
        format.json { render json: @commodoty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commodoties/1
  # DELETE /commodoties/1.json
  def destroy
    @commodoty.destroy
    respond_to do |format|
      format.html { redirect_to commodoties_url, notice: 'Commodoty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commodoty
      @commodoty = Commodoty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commodoty_params
      params.require(:commodoty).permit(:name, :description, :cost, :price, :quantity, :quantitySold)
    end
end
