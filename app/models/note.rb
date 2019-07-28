class Note < ApplicationRecord
  belongs_to :user
  validates :city, presence: true, length: { minimum: 2 }
  validates :note, presence: true

  def self.weather(city)
    if !city.nil?
      weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{ENV['APPID']}&units=metric").body
      if JSON.parse(weather)['cod'] != '404'
        return JSON.parse(weather)['main']['temp_min']
      end
    end
    'no data'
  end

end
