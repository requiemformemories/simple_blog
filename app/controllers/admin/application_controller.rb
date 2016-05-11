class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with  name:"admin" , password: "0000"
  layout 'backend'
end
