class Game < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :flash
  do_not_validate_attachment_file_type :image
  do_not_validate_attachment_file_type :flash

end
