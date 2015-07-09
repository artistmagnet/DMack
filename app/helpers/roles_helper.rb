module RolesHelper
	def get_values(action,role)
		if action.eql?("new") 
		 	path,format,url_method,url_type = create_role_path,'js','POST',true
		else
		 	path,format,url_method,url_type = role_path(role),'js','PUT',false
		end
    end	
end
