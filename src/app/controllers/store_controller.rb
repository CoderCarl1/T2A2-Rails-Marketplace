class StoreController < ApplicationController
  before_action :authenticate_user! , only: [:show, :new, :edit, :create, :update, :destroy]
  before_action :find_tattoo, only: [:show, :edit, :update, :destroy]
  before_action :authorise, only: [:edit, :update, :destroy]

  def index
    @tattoos = Tattoo.all
  end
  def show
    @tattoo = Tattoo.find(params[:id])
  end

  def new
    @tattoo = Tattoo.new
  end

  def edit
  end

  def create
    @tattoo = Tattoo.new(tattoo_params)
    @tattoo.user = current_user
    @tattoo.image.attach(tattoo_params[:image])

    respond_to do |format|
      if @tattoo.save
        format.html { redirect_to @tattoo, notice: 'Success! Your tattoo was created.' }
        format.json { render :show, status: :created, location: @tattoo }
      else
        format.html { render :new }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tattoo.update(tattoo_params)
        @tattoo.image.attach(tattoo_params[:image])
        format.html { redirect_to @tattoo, notice: 'Your tattoo has been successfully updated.' }
        format.json { render :show, status: :ok, location: @tattoo }
      else
        format.html { render :edit }
        format.json { render json: @tattoo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tattoo.destroy
    respond_to do |format|
      format.html { redirect_to tattoos_url, notice: 'The tattoo has been deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def find_tattoo
    @tattoo = Tattoo.find(params[:id])
  end

  def authorise
    return if @tattoo.can_edit?(current_user)

      flash[:alert] = "You are not authorised to perform that action!"  
      redirect_to root_path
  end

  def tattoo_params
    params.require(:tattoo).permit(:content, :image)
  end

end
