class Skvsdovlmfd::ApplicationController < ApplicationController
  http_basic_authenticate_with name: "fumitsuki", password: "jp6m,4"
  layout 'backend'
end
