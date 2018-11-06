module DeviseGoogleAuthenticator
  class Engine < ::Rails::Engine # :nodoc:  ActionDispatch::Callbacks.to_prepare
      ActiveSupport::Reloader.to_prepare do
      DeviseGoogleAuthenticator::Patches.apply
    end

  end
end
