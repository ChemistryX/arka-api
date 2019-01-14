class Api::V1::PunishSerializer < ActiveModel::Serializer
  attributes :id, :punisher, :punished, :reason, :type, :duration, :expire, :date

  def punisher
    obj = object.punisher
    if obj == -2
      obj = 'Console'
    else
      account = Account.find_by_username(obj)
      obj
    end
  end

  def reason
    obj = object.reason

  end

  def type
    object.type.humanize
  end

  def duration
    obj = object.duration
    if obj == '-1'
      obj = 'Permanent'
    else
      format_duration(obj.to_i)
    end
  end

  def expire
    obj = object.expire
    if obj == '-2'
      obj = 'Expired'
    elsif obj == '-1'
      obj = 'No Expires'
    else
      (Time.now - obj.to_i)
    end
  end

  def format_duration(duration)
    orig = duration = duration / 1000

    days    = (duration / 1.day).to_i
    duration    -= days * 1.day
    hours   = (duration / 1.hour).to_i
    duration    -= hours * 1.hour
    minutes = (duration / 1.minute).to_i
    duration    -= minutes * 1.minute
    seconds = (duration / 1.second).to_i

    seconds = seconds.to_s + " second" + (seconds == 1 ? "" : "s")
    minutes = minutes.to_s + " minute" + (minutes == 1 ? "" : "s")
    hours   = hours.to_s   + " hour"   + (hours   == 1 ? "" : "s")
    days    = days.to_s    + " day"    + (days    == 1 ? "" : "s")

    if orig < 1.minute
      "#{seconds}"
    elsif orig < 1.hour
      "#{minutes} #{seconds}"
    elsif orig < 1.day
      "#{hours} #{minutes}"
    else
      "#{days} #{hours}"
    end
  end
end
