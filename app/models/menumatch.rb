class Menumatch < ApplicationRecord
    belongs_to :restaurant
    belongs_to :menu

    # @menus = Menu.all
    # @menus.each do |m|
    #     if !Menumatch.exists?(menu_name: m.menu_name)
    #         r_match = Restaurant.where(restaurant_name: m.restaurant_name)[0]
    #         if r_match.nil?
    #             Restaurant.new(restaurant_name = )
    #         else
    #             @new_match = Menumatch.new(menu_id: m.id, menu_name: m.menu_name, restaurant_id: r_match.id,restaurant_name: m.restaurant_name)
    #         end
            
    #     end
    # end


end

