class GramsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @gram = Gram.new
    
  end

  def edit
    @gram = Gram.find_by_id(params[:id])
      if @gram.blank?
        render text: 'Not found', status: :not_found
      end
    end

  def show 
    @gram = Gram.find_by_id(params[:id])
    if @gram.blank?
      render text: 'Not Found :(', status: :not_found
    end
  end

  def destroy
    @gram = Gram.find_by_id(params[:id])
    if @gram.blank?
      render text: 'Not found', status: :not_found
    else
    @gram.destroy
    redirect_to root_path
  end
end

  def create
    @gram = current_user.grams.create(gram_params)
    if @gram.valid?
     redirect_to root_path
    else render :new, status: :unprocessable_entity
   end
 end


  def gram_params
    params.require(:gram).permit(:message)
  end

end

