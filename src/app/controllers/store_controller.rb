class StoreController < ApplicationController
  # before_action :authenticate_user!

  def index
    @tattoos = Tattoo.all
  end
  def show
  end
  def create
    @tattoo = Tattoo.new(tattoo_params)
    @tattoo.user = current_user
    # @tattoo.image.attach(tattoo_params[:image])
  end
  def edit
  end
  def destroy
  end

  def tattoo_params
    params.require(:tattoo).permit(:content, :image)
  end

end
