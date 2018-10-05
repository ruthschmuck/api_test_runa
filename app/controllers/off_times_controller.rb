class OffTimesController < ApplicationController
  before_action :set_off, only: %i[show update destroy]

  def index
    @offs = current_user.off_times
    json_response(@offs)
  end

  def show
    json_response(@off)
  end

  def create
    @off = current_user.off_times.create!(off_params)
    json_response(@off, :created)
  end

  def update
    @off.update(off_params)
    head :no_content
  end

  def destroy
    @off.destroy
    head :no_content
  end

  private

  def off_params
    params.permit(:recordOff)
  end

  def set_off
    @off = OffTime.find(params[:id])
  end
end
