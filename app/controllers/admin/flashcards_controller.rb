class Admin::FlashcardsController < Admin::BaseController
  before_action :set_flashcard, only: [:preview, :edit, :update, :destroy]
  before_action :set_product, except: [:destroy]
  before_action :set_content, except: [:destroy]

  def show
  end

  def new
    @flashcard = Flashcard.new(product_id: @product.id) if @product.present?
    @flashcard ||= Flashcard.new
  end
  
  def edit
  end

  def create
    @flashcard = Flashcard.new(flashcard_params)

    if @flashcard.save
      redirect_to admin_product_flashcard_url(@product, @flashcard), notice: 'Flashcard Content was successfully created'
    else
      render action: :new
    end
  end

  def update
    if @flashcard.update(flashcard_params)
      redirect_to admin_product_flashcard_url(@product, @flashcard), notice: 'Flashcard Content was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
  end

  private

  def set_flashcard
    @flashcard ||= Flashcard.find(params[:id])
  end

  def set_product
    @product ||= Product.find(params[:product_id])
  end

  def set_content
    @content ||= Content.find(params[:content_id]) if params[:content_id].present?
  end

  def flashcard_params
    params.require(:flashcard).permit(:title, :parent_id, :product_id, flashcard_items_attributes: [:id, :front, :back, :_destroy])
  end

end
