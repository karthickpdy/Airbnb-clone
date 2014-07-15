# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Airbnb-clone_session',
  :secret      => '0d9987981d54e5295b8f33c109c745fa286d6ba830be2542ab4bd288c2203ffaa0781664c1a8585f134b1edc23393b4257cf3559b66359b08795da6d52af70d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
