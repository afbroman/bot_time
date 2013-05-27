require 'chronic'
require 'active_support/time'

class BotTime
  attr_reader :dates

  def initialize(date1, date2=nil)
    @dates = []

    d1 = Chronic.parse(date1).to_date

    if date2.nil?
      @dates << d1
    else
      d2 = Chronic.parse(date2).to_date
      while d1 <= d2
        @dates << d1
        d1 += 1.day
      end
    end
  end

  def length
    @dates.length
  end

  def to_str_br
    @dates.map {|d| d.strftime("%d/%m/%Y")}
  end

  def to_str_br_und
    @dates.map {|d| d.strftime("%d_%m_%Y")}
  end

  def to_safe_str_br
    to_str_br.map {|d| d.gsub('/','%2F')}
  end
end