# encoding: UTF-8
class MobileController < ApplicationController

  skip_before_filter :verify_authenticity_token ,:only=>[:input]

  def post
  end


  def input


    if Account.where(["user_id = ? and password= ? ", params[:userid],params[:password] ]).empty? then
      render :text => "ユーザーIDとPasswordが間違っています"

    else 
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

end
