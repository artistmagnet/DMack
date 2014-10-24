class SectionSlotsController < ApplicationController
  def sort
    params[:section_slot].each_with_index do |id, index|
      id = id.to_i #sanitization
      SectionSlot.update_all("position=#{index+1} WHERE id=#{id}")
    end
    render nothing: true
  end
end
