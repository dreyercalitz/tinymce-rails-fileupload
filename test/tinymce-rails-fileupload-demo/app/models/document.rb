class Document < ActiveRecord::Base
  has_attached_file :file
  # Explicitly do not validate
  do_not_validate_attachment_file_type :file
end
