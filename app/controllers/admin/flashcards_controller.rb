class Admin::FlashcardsController < Admin::BaseController
  before_action :set_flashcard, only: [:show, :edit, :update, :destroy]
  before_action :set_product, except: [:destroy]
  before_action :set_content, except: [:destroy]

  def show
    @flashcard_items = @flashcard.items.rank(:row_order)
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
      # persist content if the form validation fails
      @content ||= Content.find(flashcard_params[:parent_id].to_i) if flashcard_params[:parent_id].present?
      
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

  def update_flashcard_item_position
    # TODO: Not cool, do something about the following 2 lines of code.
    flashcard_item = flashcard_params[:flashcard_items_attributes].first if flashcard_params[:flashcard_items_attributes].present?
    flashcard_item = flashcard_item[1] if flashcard_item.present?

    if flashcard_item.present? && flashcard_item[:id].to_i > 0
      fitem = FlashcardItem.find(flashcard_item[:id])
      fitem.row_order_position = flashcard_item[:row_order_position]
      fitem.save
    end

    render nothing: true
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
    params.require(:flashcard).permit(:title, :parent_id, :product_id, flashcard_items_attributes: [:id, :front, :back, :row_order_position, :_destroy])
  end

end
