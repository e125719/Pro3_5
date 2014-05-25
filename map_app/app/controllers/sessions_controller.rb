# -*- coding: utf-8 -*-

require 'pp'

class SessionsController < ApplicationController


  def create

    auth = request.env["omniauth.auth"]

    session[:uid] = auth['uid']
    session[:name] = auth['info']['name']
    session[:email] = auth['info']['email']
    session[:image]=auth['info']['image']
    session[:fb_page]=auth['info']['urls']['Facebook']   
#    session[:access_pass]=


    pp auth

    redirect_to '/sessions/verify'
    #redirect_to '/map/index' 

  end

  
  def verify

    print session[:uid] 
    print session[:name] 
    print session[:email] 
    print session[:image]
    print session[:fb_page]

  end





  def destroy
    reset_session
  end



end
