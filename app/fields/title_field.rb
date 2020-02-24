require "administrate/field/base"

class TitleField < Administrate::Field::Base
  def to_s
    data
  end
end
