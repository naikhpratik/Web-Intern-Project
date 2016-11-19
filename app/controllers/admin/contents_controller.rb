class Admin::ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
    @search = Content.search do
      fulltext params[:content]
    end
    @contents = @search.results
    #@content_managers = @contents.pluck(:name) unless @contents.empty?
  end

  # def timerupdate
  #   @content.update_attributes(:time => params[:time])
  # end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @time = Content.where(:id=>params[:id]).pluck(:time)
    gon.time = @time

    #hr = params[:hr]
    @min=params[:min]
    #@totalmin= (hr * 60)+ @min
    @sec=params[:sec]
    @id = params[:id]
    gon.contentid = @id
    @backid=Content.where(:id=>params[:id]).pluck(:product_id)
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.json
  def create

    @content = Content.new(content_params)
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update

    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to admin_content_path(@content), notice: 'Content was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Content was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:product_id, :kind, :payload,:time)
      #params.require(:product).permit(:name,:id)
      #params.fetch(:product).permit(
        #managers: [],
        #contents_attributes: [:id, :product_id, :description, :name, :parent_id, :actable_type, :url, :_destroy])

    end
end
