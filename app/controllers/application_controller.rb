class ApplicationController < ActionController::Base
  protect_from_forgery
  
  prawnto :prawn => { :left_margin => 40,
                      :right_margin => 40,
                      :top_margin => 40,
                      :bottom_margin => 40 }
end
