class EntryTimesController < ApplicationController
  before_action :set_entry, only: %i[show update destroy]

  def index
    @entries = current_user.entry_times.all
    json_response(@entries)
  end

  def show
    if is_admin?
      json_response(@entry)
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def create
    if is_admin?
      @entry = current_user.entry_times.create!(entry_params)
      json_response(@entry, :created)
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def update
    if is_admin?
      @entry.update(entry_params)
      head :no_content
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def destroy
    if is_admin?
      @entry.destroy
      head :no_content
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  private

  def entry_params
    params.permit(:recordEntry)
  end

  def set_entry
    @entry = EntryTime.find(params[:id])
  end
end
