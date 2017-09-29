class Child < ApplicationRecord
  mount_uploader:picture,PictureUploader

  # attr_accessor :remeber_token
  # had_secure
end
