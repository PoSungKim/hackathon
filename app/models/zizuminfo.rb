class Zizuminfo < ApplicationRecord
    mount_uploader :image, S3Uploader
    
    belongs_to :restaurant
end
