class TimeEntriesController < ApplicationController
  before_filter :authenticate_employee!
  layout 'admin'
  
  def start
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.start_time = Time.now
    @time_entry.end_time = nil
    @time_entry.save
    redirect_to time_entries_path
  end
  
  def stop
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.completed_at = Time.now
    @time_entry.end_time = Time.now
    @time_entry.duration += (@time_entry.end_time - @time_entry.start_time) / 60
    @time_entry.start_time = nil
    @time_entry.save
    redirect_to time_entries_path
  end

  # GET /time_entries
  # GET /time_entries.xml
  def index
    @time_entries = TimeEntry.all
    @time_entry = TimeEntry.new
    @time_entry.employee = current_employee

    respond_to do |format|
      format.html # index.html.erb
      format.csv do
        require 'csv'
        @output = ""
        CSV(@output) do |csv|
          csv << [ 'Company', 'Project', 'Employee', 'Duration', 'Start Time', 'End Time']
          @time_entries.each do |entry|
            csv << [ entry.project.customer.company, entry.project.name, entry.employee.email, entry.duration, entry.start_time, entry.end_time ]
          end
        end
      end
      format.xml  { render :xml => @time_entries }
    end
  end

  # GET /time_entries/1
  # GET /time_entries/1.xml
  def show
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_entry }
    end
  end

  # GET /time_entries/new
  # GET /time_entries/new.xml
  def new
    @time_entry = TimeEntry.new
    @time_entry.employee = current_employee

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_entry }
    end
  end

  # GET /time_entries/1/edit
  def edit
    @time_entry = TimeEntry.find(params[:id])
  end

  # POST /time_entries
  # POST /time_entries.xml
  def create
    @time_entry = TimeEntry.new(params[:time_entry])

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to(time_entries_url, :notice => 'Time entry was successfully created.') }
        format.xml  { render :xml => @time_entry, :status => :created, :location => @time_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_entries/1
  # PUT /time_entries/1.xml
  def update
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      if @time_entry.update_attributes(params[:time_entry])
        format.html { redirect_to(@time_entry, :notice => 'Time entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.xml
  def destroy
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.destroy

    respond_to do |format|
      format.html { redirect_to(time_entries_url) }
      format.xml  { head :ok }
    end
  end
end
