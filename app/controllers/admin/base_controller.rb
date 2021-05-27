class Admin::BaseController < ApplicationController
  http_basic_authenticate_with username: ENV['USERNAME'], password: ENV['PASSWORD']
end
