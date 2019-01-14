class Api::V1::RateSerializer < ActiveModel::Serializer
  attributes :map, :amazing, :good, :ok, :bad, :terrible

  # convert account ids to count
  # null safe
  def terrible
    object.terrible&.length.nil? ? 0 : object.terrible.length
  end

  def bad
    object.bad&.length.nil? ? 0 : object.bad.length
  end

  def ok
    object.ok&.length.nil? ? 0 : object.ok.length
  end

  def good
    object.good&.length.nil? ? 0 : object.good.length
  end

  def amazing
    object.amazing&.length.nil? ? 0 : object.amazing.length
  end
end
