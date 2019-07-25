class NotesController < ApplicationController
  include Http
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
    @note.weather = weather(note_params[:city])
    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  private
    def note_params
      params.require(:note).permit(:city, :note)
    end

    def weather(city)
      weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{ENV['APPID']}&units=metric").body
      if JSON.parse(weather)['cod'] != '404'
        return JSON.parse(weather)['main']['temp_min']
      end
      'no data'
    end
end