class RotasController < ApplicationController
  before_action :set_rota, only: %i[ show edit update destroy ]

  # GET /rotas or /rotas.json
  def index
  end

  # GET /rotas/1 or /rotas/1.json
  def show
  end

  # GET /rotas/new
  def new
    @rota = Rota.new
  end

  # GET /rotas/1/edit
  def edit
  end

  # POST /rotas or /rotas.json
  def create
    @rota = Rota.new(rota_params)

    respond_to do |format|
      if @rota.save
        format.html { redirect_to rota_url(@rota), notice: "Rota was successfully created." }
        format.json { render :show, status: :created, location: @rota }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rotas/1 or /rotas/1.json
  def update
    respond_to do |format|
      if @rota.update(rota_params)
        format.html { redirect_to rota_url(@rota), notice: "Rota was successfully updated." }
        format.json { render :show, status: :ok, location: @rota }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rotas/1 or /rotas/1.json
  def destroy
    # @rota.destroy

    respond_to do |format|
      format.html { redirect_to rotas_url, notice: "Can't delete rotas" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rota
      @rota = Rota.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rota_params
      params.require(:rota).permit(:title, :description)
    end
end
