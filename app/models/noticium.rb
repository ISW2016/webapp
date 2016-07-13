class Noticium < ActiveRecord::Base
	has_attached_file :imagen, 
					:url  => "/assets/posts/:id/:style/:basename.:extension",
                  	:path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
	
	validates_attachment_presence :imagen
	validates_attachment_size :imagen, :less_than => 30.megabytes
	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/

end
