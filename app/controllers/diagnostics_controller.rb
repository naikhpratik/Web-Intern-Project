class DiagnosticsController < ApplicationController

  def healthcheck
    health = 'happy'

    render :text => health
  end

end
