ActiveAdmin.register User do

actions :all, :except => [:create, :edit] 
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :email, :dob, :gender, :subscription
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
 
  filter :email
  filter :first_name
  filter :last_name
  filter :created_at
  filter :dob
  filter :gender
  

  index :download_links => true do    
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :dob
    column :gender
    column 'Power Magnet' do |p| 
      p.subscription
    end   
    actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
      row :first_name
      row :last_name
      row :dob
      row :gender
      row 'Power Magnet' do |p| 
        p.subscription
      end   
    end
  end    
end
