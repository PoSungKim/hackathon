class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      #레스토랑 이름
      t.string :restaurant_name
      #레스토랑 지점 이름(서브웨이 용산아이파크몰점...)
      t.string :zizum
      
      #도로명 주소 기준 시도 시군구 도로명주소 건물번호1-건물번호2
      t.string :sido
      t.string :sigungu
      t.string :doromyeong
      t.integer :gunmul_bunho1
      t.integer :gunmul_bunho2

      t.string :phone_number

      #식당 전체 알레르기 정보
      t.integer :a1_maemil
      t.integer :a2_mil
      t.integer :a3_daedu
      t.integer :a4_hodu
      t.integer :a5_ddangkong
      t.integer :a6_peach
      t.integer :a7_tomato
      t.integer :a8_piggogi
      t.integer :a9_nanryu
      t.integer :a10_milk
      t.integer :a11_ddakgogi
      t.integer :a12_shoigogi
      t.integer :a13_saewoo
      t.integer :a14_godeungeoh
      t.integer :a15_honghap
      t.integer :a16_junbok
      t.integer :a17_gul
      t.integer :a18_jogaeryu
      t.integer :a19_gye
      t.integer :a20_ohjingeoh
      t.integer :a21_ahwangsan

      t.string :image
     
      t.timestamps
    end
  end
end
