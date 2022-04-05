# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def rsvps
    @user = Member.find_by(email: current_admin.email).id
    @event_id = params[:id]
    @attendance = Attendance.where(member_id: @user, event_id: @event_id).first
    if @attendance.nil?
      @attendance = Attendance.new(member_id: @user, event_id: @event_id, attended: 'false', rsvp: 'true')
      @attendance.save!
    end
    redirect_to('/events')
  end

  def unrsvps
    @user = Member.find_by(email: current_admin.email).id
    @event_id = params[:id]
    @attendance = Attendance.where(member_id: @user, event_id: @event_id).first
    if @attendance.nil?
      @attendance = Attendance.new(member_id: @user, event_id: @event_id, attended: 'false', rsvp: 'false')
      @attendance.save!
    else
      @attendance.destroy!
    end
    redirect_to('/events')
  end

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @user = Member.find_by(email: current_admin.email).id
    @event_id = params[:id]
    @attendance = Attendance.where(member_id: @user, event_id: @event_id).first
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully created.') }
        format.json { render(:show, status: :created, location: @event) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to(event_url(@event), notice: 'Event was successfully updated.') }
        format.json { render(:show, status: :ok, location: @event) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @event.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to(events_url, notice: 'Event was successfully destroyed.') }
      format.json { head(:no_content) }
    end
  end

  def start_time
    event.time
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :description, :location, :start_time, :end_time)
  end
end
