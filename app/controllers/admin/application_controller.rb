class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with  Settings.http_basic_auth.to_h
  layout 'backend'
end
