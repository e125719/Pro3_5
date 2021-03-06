require 'pp'
class MapController < ApplicationController

  def index
    @users = User.all.where(["userid=?",session[:uid]])
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|

      marker.lat user.latitude
      marker.lng user.longitude
      #marker.infowindow user.description
      marker.infowindow '<font size="1">'+user.title+'</font>'+'<br>'+user.description

      marker.json({title: user.title})
      marker.json({status: user.status})

    end

   @hash.each do | i |

     pp i
     print i.class
     if i[:status]=="good" then
       i[:picture]={:url=>"http://maps.google.co.jp/mapfiles/ms/icons/red-pushpin.png",:width=>36,:height=>36}
     elsif i[:status]=="bad" then
       i[:picture]={:url=>"http://maps.google.co.jp/mapfiles/ms/icons/blue-pushpin.png",:width=>36,:height=>36}
     end

   end

     print @hash.to_json
     print "\n"
     print @hash
     print "\n"
  end



end
