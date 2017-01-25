class Admin::MediaController < Admin::BaseController
  before_action :set_media, only: [:edit, :update, :destroy]
  before_action :set_product, except: [:destroy]
  before_action :set_content, except: [:destroy]

  def new
    @media = Media.new(product_id: @product.id) if @product.present?
    @media ||= Media.new
  end
  
  def edit
  end

  def create
    @media = Media.new(media_params)

    if @media.save
      redirect_to admin_product_url(@product), notice: "#{@media.local_type.capitalize} content was successfully created"
    else
      # persist content if the form validation fails
      @content ||= Content.find(flashcard_params[:parent_id].to_i) if flashcard_params[:parent_id].present?
      render action: :new
    end
  end

  def update
    if @media.update(media_params)
      redirect_to admin_product_url(@product), notice: "#{@media.local_type.capitalize} content was successfully updated."
    else
      render action: :edit
    end
  end

  def destroy
  end

  private

  def set_media
    @media ||= Media.find(params[:id])
  end

  def set_product
    @product ||= Product.find(params[:product_id])
  end

  def set_content
    @content ||= Content.find(params[:content_id]) if params[:content_id].present?
  end

  def media_params
    params.require(:media).permit(:local_type, :title, :caption, :transcript, :duration, :thumbnail_url, :parent_id, :product_id)
  end

end
