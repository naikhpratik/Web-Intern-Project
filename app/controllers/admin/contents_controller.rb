class Admin::ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
    # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end

  def import
     rowarray = Hash.new
     values=Array.new
     spreadsheet = Content.open_spreadsheet(params[:file])
     header = spreadsheet.row(1)
     (2..spreadsheet.last_row).each do |i|
       rowarray = Hash[[header, spreadsheet.row(i)].transpose]
        #@rowarray = rowarray
        values << rowarray

     end
     session[:rowarray] = rowarray
     session[:array] = values
       redirect_to :back, notice: "Records imported."
  end
  # def timerupdate
  #   @content.update_attributes(:time => params[:time])
  # end

  # GET /contents/1
  # GET /contents/1.json
  def show
    time()
    @id = params[:id]
    gon.contentid = @id
    @backid=Content.where(:id=>params[:id]).pluck(:product_id)

    if(params[:min])
      session[:min] = params[:min]
      session[:sec] = params[:sec]

      @content1 = Content.where(:id=>params[:content_id])
      @usercontent = UserContent.find_by(contents_id: params[:content_id],user_id: current_user.id)
      #@test = UserContent.where(:contents_id=>params[:content1_id])
        if(@usercontent)
          @usercontent.update_attributes(:stoptime=>@min)
          respond_to do |format|
            format.html { redirect_to admin_product_path(@content1.pluck(:product_id).first), notice: 'You have Successfully show Finished the Test' }
          end
        end
    end
  end

  def update_content_position
    if content_params[:content_id].to_i > 0
      content = Content.find(content_params[:content_id])
      content.row_order_position = content_params[:row_order_position]
      puts content.inspect
      puts content.inspect if content.save
    end

    render nothing: true
  end

def time
  @usercontent = UserContent.find_by(contents_id: params[:id],user_id: current_user.id)
  if(@usercontent)
    @time = @usercontent.stoptime
    gon.time = @time
  else
    @time = Content.where(:id=>params[:id]).pluck(:time)
    gon.time = @time
  end
  @min=params[:min]
  @sec=params[:sec]
  #@content.update_attributes(:colour => newcolour)
end

def stats

end

  def usercontentssave
  #@usercontent = UserContent.new(content_params)
     @time = Content.where(:id=>params[:id]).pluck(:time)
     @id=Content.where(:id=>params[:id]).pluck(:time).first
     @content1 = Content.where(:id=>params[:content_id])
    UserContent.find_or_create_by({ contents_id: @content1.pluck(:id).first,  user_id: current_user.id, starttime: @content1.pluck(:time).first}) unless current_user.blank?
  end
    #byebug

  def usercontentsupdate

    @min=session[:min]
    @sec=session[:sec]

    @content1 = Content.where(:id=>params[:content_id])
    @usercontent = UserContent.find_by(contents_id: params[:content_id],user_id: current_user.id)
    @test = UserContent.where(:contents_id=>params[:content1_id])
    if(@usercontent)
      @usercontent.update_attributes(:stoptime=>@min)
    respond_to do |format|
      format.html { redirect_to admin_product_path(@content1.pluck(:product_id).first), notice: 'You have update Successfully Finished the Test' }
    end
  end
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
      params.require(:content).permit(:content_id, :product_id, :kind, :payload, :time, :row_order_position)
      #params.require(:user_contents).permit(:contents_id,:user_id,:starttime,:stoptime)
      #params.require(:product).permit(:name,:id)
      #params.fetch(:product).permit(
        #managers: [],
        #contents_attributes: [:id, :product_id, :description, :name, :parent_id, :actable_type, :url, :_destroy])

    end
end
