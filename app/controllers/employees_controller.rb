class EmployeesController < ApplicationController
  before_filter :authenticate_employee!
  layout 'admin'

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.pdf
      format.xml  { render :xml => @employee }
    end
  end
  
end