namespace :resume do
  desc "Adds an education table and its section slot to resumes without it"
  task add_education: :environment do
    unaffected_ids = SectionSlot.select(:resume_id).distinct
    targets = Resume.where('id not in (?)', unaffected_ids)
    puts "Adding an Education section to #{targets.length} resumes"
    targets.each do |resume|
      table = EducationTable.create(title: 'Education', columns: '{School,City,State,Country,Degree,Year}', positions: '{1,2,3,4,5,6}')
      SectionSlot.create(section_id: table.id, section_type: 'Rtable', resume_id: resume.id, position: 1)
    end

    # Check
    unaffected_ids = SectionSlot.select(:resume_id).distinct
    targets = Resume.where('id not in (?)', unaffected_ids)
    puts "..#{targets.length} resumes remain uneducated"
    puts "#{targets.empty? ? '' : 'NOT '}Done"
  end

end
