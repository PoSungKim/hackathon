class Restaurant < ApplicationRecord
    mount_uploader :image, S3Uploader
    has_many :allergies

    validates :restaurant_name, :uniqueness => true

    r = Restaurant.new
    r.restaurant_name = "서브웨이"
    r.save
    
    r = Restaurant.new
    r.restaurant_name = "맘스터치"
    r.save

    r = Restaurant.new
    r.restaurant_name = "한솥"
    r.save
end
