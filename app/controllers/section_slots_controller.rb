class SectionSlotsController < ApplicationController
  def sort
    params[:section_slot].each_with_index do |id, index|
      id = id.to_i #sanitization
      SectionSlot.update_all("position=#{index+1} WHERE id=#{id}")
    end

    ## TODO: It's cleaner to add one of the rows below, but this requires to manage conflicts with ajaxSuccess() in chosen.js.coffee

    # render nothing: true
    # head :ok
  end
end
