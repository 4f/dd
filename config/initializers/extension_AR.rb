class ActiveRecord::Base
  # write ur common base code here
  def url_to_edit
    request.original_fullpath + '/edit'
  end
end