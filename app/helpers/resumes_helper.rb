module ResumesHelper
	def education(e, cust=nil, repr=nil)
		slots_hash = Hash.new()
    if e.object.section_slots.present?
	    education=repr.present? ? e.object.section_slots.collect(&:section).last : cust.present? ? e.object.section_slots.collect(&:section).second : e.object.section_slots.collect(&:section).first
	    education.positions.collect{|p| slots_hash[p]=education.columns[education.positions.index(p)]} 
	  end
	  return slots_hash
	end

	def final_resume(e, cust)
		slots_hash = Hash.new()
    if e.section_slots.present?
	    education=cust.present? ? e.section_slots.collect(&:section).last : e.section_slots.collect(&:section).first
	    education.positions.collect{|p| slots_hash[p]=education.columns[education.positions.index(p)]}
	  end
	  return slots_hash
	end
end
