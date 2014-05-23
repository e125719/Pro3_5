Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
  '103722699430.apps.googleusercontent.com', 
  'ropQbvFKe2Fy92Hjbp0iEWzK',
  {
    name: "google",
    #scope: "userinfo.profile",
    scope: "email,profile,plus.me",
    approval_prompt: 'auto',

    #redirect_uri: "http://192.168.33.10:3000/oauth2callback"

  }




  provider :facebook,
    '391271721010544',
    '20604747004df3ccf5feb95a9ca47c17',
    display: 'popup'




end

