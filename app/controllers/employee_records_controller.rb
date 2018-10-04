class EmployeeRecordsController < ApplicationController
  
  def index
    @entry = EntryTime.all
    @off = OffTime.all

    render json: :make_objet, status: :ok
  end

  private

  def asing_dates
    dates_array = []

    @entry.each do |element|
      dates_array << element.created_at.to_s.split(' ')[0]
    end
    dates_array
  end

  def asing_entries
    entries_array = []

    @entry.each do |element|
      entries_array << element.recordEntry
    end
    entries_array
  end

  def asing_off
    offs_array = []

    @off.each do |element|
      offs_array << element.recordOff
    end
    offs_array
  end

  def make_objet
    obj = {}
    obj['dates'] = asing_dates
    obj['entries'] = asing_entries
    obj['off'] = asing_off

    obj
  end
end
