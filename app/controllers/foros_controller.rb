class ForosController < ApplicationController
  before_action :set_foro, only: [:show, :edit, :update, :destroy]

  # GET /foros
  # GET /foros.json
  def index
    @foros = Foro.all
  end

  # GET /foros/1
  # GET /foros/1.json
  def show
    @comentarios = Comentario.where(foro_id: @foro).order('created_at DESC')
  end

  # GET /foros/new
  def new
    @foro = Foro.new
  end

  # GET /foros/1/edit
  def edit
  end

  # POST /foros
  # POST /foros.json
  def create
    @foro = Foro.new(foro_params)

    respond_to do |format|
      if @foro.save
        format.html { redirect_to @foro, notice: 'Foro was successfully created.' }
        format.json { render :show, status: :created, location: @foro }
      else
        format.html { render :new }
        format.json { render json: @foro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foros/1
  # PATCH/PUT /foros/1.json
  def update
    respond_to do |format|
      if @foro.update(foro_params)
        format.html { redirect_to @foro, notice: 'Foro was successfully updated.' }
        format.json { render :show, status: :ok, location: @foro }
      else
        format.html { render :edit }
        format.json { render json: @foro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foros/1
  # DELETE /foros/1.json
  def destroy
    @foro.destroy
    respond_to do |format|
      format.html { redirect_to foros_url, notice: 'Foro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foro
      @foro = Foro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foro_params
      params.require(:foro).permit(:title, :content)
    end
end
