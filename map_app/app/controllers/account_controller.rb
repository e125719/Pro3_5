class AccountController < ApplicationController

  skip_before_filter :verify_authenticity_token 
  

  def create
  end

  def login_form
  end

  def input
    if Account.where(["user_id = ?", params[:user_id] ]).empty? then
      model_data=Account.new
      model_data.user_id = params[:user_id] 
      model_data.password = params[:password]
      model_data.save  
      #render :text => "アカウントを登録できました"
      redirect_to '/account/verify'
    else
      render :text => "そのアカウント名は既に存在しています"
    end
  end



  def login
    if Account.where(["user_id = ? and password = ?", params[:user_id],params[:password] ]).empty? then
      render :text => "ユーザーidもしくはpasswordが間違っています"
    else
      session[:uid] = params[:user_id]
    end 


  end


  def verify
  end 


end
