class Student < ApplicationRecord
  has_and_belongs_to_many :signatures
  has_many :gifts
  # belongs_to :signature, optional: true

  def self.to_csv
    attributes = %w{name email phone address city zip}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |student|
        csv << attributes.map{ |attr| student.send(attr) }
      end
    end
  end

  def name
    "#{first_name} #{last_name}"
  end
end
