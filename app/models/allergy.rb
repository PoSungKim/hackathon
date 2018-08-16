require 'open-uri'
require 'nokogiri'

class Allergy < ApplicationRecord
    mount_uploader :image, S3Uploader

    validates :menu_name, :uniqueness => true

    def self.Subway
        #서브웨이
        url = "http://subway.co.kr/sandwichAllergy"
        data = Nokogiri::HTML(open(url))
        rows = data.css('tbody tr')

        rows.each do |r|
            m_name = r.css('th').text
            
            if Allergy.where(menu_name: m_name)[0].nil?
                a_info = Allergy.new
            else
                a_info = Allergy.where(menu_name: m_name)[0]
            end

            a_info.restaurant_id = 1
            a_info.restaurant_name = "서브웨이"

            #메뉴 이름
            a_info.menu_name = m_name
            #계란 / 생선 / 우유,락토스 / 땅콩 / 참깨 / 조개류 / 대두,콩 / 견과류 / 밀,글루텐 / 아황산류 / 아질산염,질산염
            
            
            #계란 9
            a = r.css(':nth-child(2)')
            if a.css('span').empty?
                a_info.a9_nanryu = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a9_nanryu =1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a9_nanryu =2
            end

            #생선. 우리 표에 없음
            # a = r.css(':nth-child(3)')
            # if a.css('span').empty?             
            # elsif a.css('span').attr('class').text == "a01"
            # elsif a.css('span').attr('class').text == "a02"
            # end

            #우유,락토스 10
            a = r.css(':nth-child(4)')
           
            if a.css('span').empty?
                a_info.a10_milk = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a10_milk = 1   
            elsif a.css('span').attr('class').text == "a02"
                a_info.a10_milk = 2
            end

            #땅콩 5
            a = r.css(':nth-child(5)')
            if a.css('span').empty?
                a_info.a5_ddangkong = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a5_ddangkong = 1   
            elsif a.css('span').attr('class').text == "a02"
                a_info.a5_ddangkong = 2
            end

            #참깨 5  테이블 상에 존재하지 않음
            # a = r.css(':nth-child(6)')
            # if a.css('span').empty?
            #     a_info.a5_ddangkong = 0
            # elsif a.css('span').attr('class').text == "a01"
            #     a_info.a5_ddangkong = 1   
            # elsif a.css('span').attr('class').text == "a02"
            #     a_info.a5_ddangkong = 2
            # end

            #조개 18
            a = r.css(':nth-child(7)')
            if a.css('span').empty?
                a_info.a18_jogaeryu = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a18_jogaeryu = 1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a18_jogaeryu = 2
            end

            #대두,콩 3
            a = r.css(':nth-child(8)')
            if a.css('span').empty?
                a_info.a3_daedu = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a3_daedu = 1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a3_daedu = 2
            end

            #견과류 (호두 4)
            a = r.css(':nth-child(9)')
            if a.css('span').empty?
                a_info.a4_hodu = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a4_hodu = 1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a4_hodu = 2
            end


            #밀 2
            a = r.css(':nth-child(10)')
            if a.css('span').empty?
                a_info.a2_mil = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a2_mil = 1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a2_mil = 2
            end

            #아황산류 21
            a = r.css(':nth-child(11)')
            if a.css('span').empty?
                a_info.a21_ahwangsan = 0
            elsif a.css('span').attr('class').text == "a01"
                a_info.a21_ahwangsan = 1
            elsif a.css('span').attr('class').text == "a02"
                a_info.a21_ahwangsan = 2
            end
     
            #미제공 항목
            a_info.a1_maemil = -1
            a_info.a6_peach = -1
            a_info.a7_tomato = -1
            a_info.a8_piggogi = -1
            a_info.a11_ddakgogi = -1
            a_info.a12_shoigogi = -1
            a_info.a13_saewoo = -1
            a_info.a14_godeungeoh = -1
            a_info.a15_honghap = -1
            a_info.a16_junbok = -1
            a_info.a17_gul = -1
            a_info.a19_gye = -1
            a_info.a20_ohjingeoh = -1

            a_info.save
        end
    end

    def self.Momstouch
        url = "http://momstouch.co.kr/ale.html"
        data = Nokogiri::HTML(open(url))
        rows = data.css('.table_allergy tbody tr')

        rows.each do |r|
            m_name = r.css(':nth-child(1)').text
            
            if Allergy.where(menu_name: m_name)[0].nil?
                a_info = Allergy.new
            else
                a_info = Allergy.where(menu_name: m_name)[0]
            end

            a_info.restaurant_id = 2
            a_info.restaurant_name = "맘스터치"

            #메뉴 이름
            a_info.menu_name = m_name

            #메밀 1
            a = r.css(':nth-child(4)').text

            if a == "○"
                a_info.a1_maemil = 1
            elsif a == "·"
                a_info.a1_maemil = 0
            end

            #밀 2
            a = r.css(':nth-child(7)').text

            if a == "○"
                a_info.a2_mil = 1
            elsif a == "·"
                a_info.a2_mil = 0
            end
            #대두 3
            a = r.css(':nth-child(6)').text

            if a == "○"
                a_info.a3_daedu = 1
            elsif a == "·"
                a_info.a3_daedu = 0
            end
            #호두 4
            a = r.css(':nth-child(15)').text

            if a == "○"
                a_info.a4_hodu= 1
            elsif a == "·"
                a_info.a4_hodu = 0
            end
            #땅콩 5
            a = r.css(':nth-child(5)').text

            if a == "○"
                a_info.a5_ddangkong = 1
            elsif a == "·"
                a_info.a5_ddangkong = 0
            end

            #복숭아	6
            a = r.css(':nth-child(12)').text

            if a == "○"
                a_info.a6_peach = 1
            elsif a == "·"
                a_info.a6_peach = 0
            end

            #토마토	7
            a = r.css(':nth-child(13)').text

            if a == "○"
                a_info.a7_tomato = 1
            elsif a == "·"
                a_info.a7_tomato = 0
            end
            #돼지고기 8
            a = r.css(':nth-child(11)').text

            if a == "○"
                a_info.a8_piggogi = 1
            elsif a == "·"
                a_info.a8_piggogi = 0
            end

            #난류 9
            a = r.css(':nth-child(2)').text

            if a == "○"
                a_info.a9_nanryu = 1
            elsif a == "·"
                a_info.a9_nanryu = 0
            end

            #우유 10	
            a = r.css(':nth-child(3)').text

            if a == "○"
                a_info.a10_milk = 1
            elsif a == "·"
                a_info.a10_milk = 0
            end
            #닭고기	11
            a = r.css(':nth-child(16)').text

            if a == "○"
                a_info.a11_ddakgogi = 1
            elsif a == "·"
                a_info.a11_ddakgogi = 0
            end
            #쇠고기	12
            a = r.css(':nth-child(17)').text

            if a == "○"
                a_info.a12_shoigogi = 1
            elsif a == "·"
                a_info.a12_shoigogi = 0
            end
            #새우 13
            a = r.css(':nth-child(10)').text

            if a == "○"
                a_info.a13_saewoo = 1
            elsif a == "·"
                a_info.a13_saewoo = 0
            end
            #고등어	14
            a = r.css(':nth-child(8)').text

            if a == "○"
                a_info.a14_godeungeoh = 1
            elsif a == "·"
                a_info.a14_godeungeoh = 0
            end
            #조개류 18
            a = r.css(':nth-child(19)').text

            if a == "○"
                a_info.a18_jogaeryu = 1
            elsif a == "·"
                a_info.a18_jogaeryu = 0
            end
            #게 19
            a = r.css(':nth-child(9)').text

            if a == "○"
                a_info.a19_gye = 1
            elsif a == "·"
                a_info.a19_gye = 0
            end
            #오징어	20          
            a = r.css(':nth-child(18)').text

            if a == "○"
                a_info.a20_ohjingeoh = 1
            elsif a == "·"
                a_info.a20_ohjingeoh = 0
            end
            #아황산류* 21	            
            a = r.css(':nth-child(14)').text

            if a == "○"
                a_info.a21_ahwangsan = 1
            elsif a == "·"
                a_info.a21_ahwangsan = 0
            end
            
            #제공하지 않음
            a_info.a15_honghap = -1
            a_info.a16_junbok  = -1
            a_info.a17_gul  = -1
            
            a_info.save
        end
        
    end

    # def self.Baskinrobbins
    #     for pageNum in range (1,4)
    #         url = "https://www.baskinrobbins.co.kr/menu/nutrition_new.php?Page="+pageNum+"&ScProd=&ScNutri=&ScAmount="
    #         data = Nokogiri::HTML(open(url))
    #         rows = data.css('.table_allergy tbody tr')

    #         rows.each do |r|
    #             m_name = r.css(':nth-child(1)').text
    #         end
    #     end
    # end

    # def self.DunkinDonuts
    #     for pageNum in range (1,9)
    #         url = "https://www.dunkindonuts.co.kr/info/nutrient.php?Page="+ pageNum +"&searchword=&skey=&sdic="
    #         data = Nokogiri::HTML(open(url))
    #         rows = data.css('.table_allergy tbody tr')

    #         rows.each do |r|
    #             m_name = r.css(':nth-child(1)').text
    #         end
    #     end
    # end

    # def self.PizzanaraCG
       
    #     url = "http://pncg.co.kr/nutrition/main.html"
    #     data = Nokogiri::HTML(open(url))
    #     rows = data.css('.table_allergy tbody tr')

    #     rows.each do |r|
    #         m_name = r.css(':nth-child(1)').text
    #     end
    
    # end

    # def self.PizzaEttang
       
    #     url = "https://m.pizzaetang.com/menu/nutrient.html"
    #     data = Nokogiri::HTML(open(url))
    #     rows = data.css('.table_allergy tbody tr')

    #     rows.each do |r|
    #         m_name = r.css(':nth-child(1)').text
    #     end
        
    # end

    # def self.PizzaAlvolo
       
    #     url = "https://m.pizzaalvolo.co.kr/menu/menu_sideView.asp?class_id=40&cate_id=02&base_id=4055"
    #     data = Nokogiri::HTML(open(url))
    #     rows = data.css('.table_allergy tbody tr')

    #     rows.each do |r|
    #         m_name = r.css(':nth-child(1)').text
    #     end
        
    # end

    # def self.CoffeeBean
       
    #     url = "http://www.coffeebeankorea.com/menu/list.asp?category=4"
    #     data = Nokogiri::HTML(open(url))
    #     rows = data.css('.table_allergy tbody tr')

    #     rows.each do |r|
    #         m_name = r.css(':nth-child(1)').text
    #     end
        
    # end

    #담김쌈http://www.damgimssam.com/?page_id=1420

    #####################################################################
    if !Allergy.exists?(restaurant_name: "서브웨이") 
        self.Subway
    end

    if !Allergy.exists?(restaurant_name: "맘스터치") 
        self.Momstouch
    end


end
