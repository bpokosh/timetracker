class HelpController < ApplicationController
  before_filter :authenticate_employee!
  layout 'admin'
end
