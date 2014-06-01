# encoding: UTF-8
class MobileController < ApplicationController

  skip_before_filter :verify_authenticity_token ,:only=>[:input,:search]

  def post
  end


  def input
    if Account.where(["user_id = ? and password= ? ", params[:userid],params[:password] ]).empty? then
      render :text => "ユーザーIDとPasswordが間違っています"

    else 
      
      #同じ経度、緯度がテーブルに存在しないかをチェック
      if !User.where(["userid = ? and latitude = ? and longitude = ? ", params[:userid],params[:latitude],params[:longitude] ]).empty? then
        User.delete(User.where(["userid = ? and latitude = ? and longitude = ? ", params[:userid],params[:latitude],params[:longitude] ]))
      end


      model_data=User.new
      model_data.userid = params[:userid] 
      #model_data.password = params[:password] 
      model_data.latitude = params[:latitude]
      model_data.longitude = params[:longitude]
      model_data.title = params[:title]
      model_data.status = params[:status]
      model_data.description = params[:description]
      model_data.save
      #render :text => "データを入力しました"
      redirect_to '/mobile/verify'
    end
  end


  def verify
  end



  def search_form
  end 



  def search
    #GooglePlaceの場所の検索条件
    place_info={
      "any" => [],
      "school" => ['school','university'],
      "pleasure" => ['amusement_park','aquarium','zoo','bowling_alley','museum','campground','spa','movie_theater'],
      "park" => ['park'],
      "bar" => ['bar'],
      "cafe" => ['cafe'],
      "store" => ['electronics_store','florist','furniture_store','liquor_store','shoe_store','bakery','bicycle_store','book_store','movie_rental'],
      "hotel" => ['lodging'], 
      "facility" => ['establishment','gym','library'],
      "restaurant" => ['restaurant','food'],
      "shopping" => ['convenience_store','grocery_or_supermarket','shopping_mall','clothing_store','department_store'],
      "medical" => ['hospital','veterinary_care','doctor','dentist'],
      "traffic" => ['airport','bus_station','subway_station','taxi_stand','train_station'],
      "others" => [],
    }

    #その他の設定
    exclude_list=[]
    place_info.each do | i |
      exclude_list=exclude_list+i[1] 
    end
    place_info["others"]=exclude_list
    #ここまで


    @client = GooglePlaces::Client.new("AIzaSyDGznvtP85H0LSGhS_Moln98xa-K-v7RAQ")

    if params[:type]=="others" then
      @spots_list=@client.spots(params[:latitude],params[:longitude],:exclude => exclude_list ,:language => 'jp')
    else
      @spots_list=@client.spots(params[:latitude],params[:longitude],:types => place_info[params[:type]],:language => 'jp')
    end 




    for i in @spots_list do
      print i[:name]
      print "\n"
    end


  end






end
