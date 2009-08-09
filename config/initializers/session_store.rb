# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails7_session',
  :secret      => 'df5f0c8e030f5b245988b251631efcffc75eaff4c08326c90084da687a8d51b3247a7c6f88c7a2cb2932b41ba88ee73d0f53dfa3aa2126ab2ef48f2afed43fc4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
