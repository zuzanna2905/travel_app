class NotesController < ApplicationController
  include Http
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.where(user_id: current_user)
  end

  def new
    @note = Note.new
  end

  def show
  end

  def create
    @note = current_user.notes.build(note_params)
    @note.weather = Note.weather(note_params[:city])
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private
    def note_params
      params.require(:note).permit(:city, :note)
    end

    def set_note
      @note = Note.find(params[:id])
    end

end