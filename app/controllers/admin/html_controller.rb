class Admin::HtmlController < ApplicationController

  def edit
    @html = Html.find(params[:id])
  end

  def new
    @html = Html.new(parent_id: params[:content_id])

  end


end
