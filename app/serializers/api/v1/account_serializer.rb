class Api::V1::AccountSerializer < ActiveModel::Serializer
  attributes :id, :username, :crystals, :kills, :deaths, :kd, :lastLogin

  def kd
    calculate = (object.kills.to_f || 0) / (object.deaths.to_f || 1)
    kd = calculate.round(2) || 0
  end

  def kills
    object.kills || 0
  end

  def deaths
    object.deaths || 0
  end
end
