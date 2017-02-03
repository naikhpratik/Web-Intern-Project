class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: [:edit, :update, :destroy]
  before_action :set_product, except: [:destroy]
  before_action :set_content, except: [:destroy]

  def new
    @quiz = Quiz.new(product_id: @product.id) if @product.present?
    @quiz ||= Quiz.new
  end
  
  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      redirect_to admin_product_url(@product), notice: 'Quiz was successfully created'
    else
      # persist content if the form validation fails
      @content ||= Content.find(quiz_params[:parent_id].to_i) if quiz_params[:parent_id].present?
      render action: :new
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_product_url(@product), notice: 'Quiz was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
  end

  private

  def set_quiz
    @quiz ||= Quiz.find(params[:id])
  end

  def set_product
    @product ||= Product.find(params[:product_id])
  end

  def set_content
    @content ||= Content.find(params[:content_id]) if params[:content_id].present?
  end

  def quiz_params
    params.require(:quiz).permit(:title, :q_type, :time, :parent_id, :product_id, question_attributes: [:id, :hint, :explanation, :_destroy])
  end

end
