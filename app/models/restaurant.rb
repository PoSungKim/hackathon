class Restaurant < ApplicationRecord
    mount_uploader :image, S3Uploader
    has_many :allergies

    validates :restaurant_name, :uniqueness => true
end
