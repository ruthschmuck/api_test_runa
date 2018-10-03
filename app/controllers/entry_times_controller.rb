class EntryTimesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  def index
    @entries = EntryTime.all
    json_response(@entries)
  end

  def show
    json_response(@entry)
  end

  def create
    user = User.first
    @entry = user.entry_times.create!(entry_params)
    json_response(@entry, :created)
  end

  def update
    @entry.update(entry_params)
    head :no_content
  end

  def destroy
    @entry.destroy
    head :no_content
  end

  private

  def entry_params
    params.permit(:recordEntry)
  end

  def set_entry
    @entry = EntryTime.find(params[:id])
  end
end
