class Photo < ActiveRecord::Base
  mount_uploader :poster, AvatarUploader
  attr_accessible :poster, :poster_cache, :remove_poster
end
