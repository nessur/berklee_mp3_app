# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_berklee_mp3_app_session',
  :secret      => 'a805de39760c6975ce10457bde080f5d33c8f2a828de69ca6d9d9d56802f78839415f828d48bcb4278b058ca35453632c3a5493cc8c3c3c212e69c2bceacddec'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
