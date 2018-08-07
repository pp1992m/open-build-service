# TODO: Please overwrite this comment with something explaining the controller target
class AnnouncementsController < ApplicationController
  #### Includes and extends

  #### Constants

  #### Self config

  #### Callbacks macros: before_action, after_action, etc.
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  # Pundit authorization policies control
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

  #### CRUD actions

  # GET /announcements
  def index
    @announcements = policy_scope(Announcement)
  end

  # GET /announcements/1
  def show
    if @announcement.present?
      authorize @announcement
    else
      skip_authorization
    end
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
    authorize @announcement
  end

  # GET /announcements/1/edit
  def edit
    authorize @announcement
  end

  # POST /announcements
  def create
    @announcement = Announcement.new(announcement_params)
    authorize @announcement
    if @announcement.save
      redirect_to @announcement, notice: 'Announcement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /announcements/1
  def update
    authorize @announcement
    if @announcement.update(announcement_params)
      redirect_to @announcement, notice: 'Announcement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /announcements/1
  def destroy
    authorize @announcement
    @announcement.destroy
    redirect_to announcements_url, notice: 'Announcement was successfully destroyed.'
  end

  #### Non CRUD actions

  #### Non actions methods
  # Use hide_action if they are not private

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end
end
