class Ownership < ApplicationRecord
  belongs_to :plant
  belongs_to :location

  validates :last_watering_date, presence: true
  validates :watering_frequency, presence: true
<<<<<<< HEAD
  validates :watering_frequency, inclusion: { in: (0..10), message: "%{value} is not a valid rating, it has to be between 0 and 10" }
=======
>>>>>>> f74be2211bb1d72bd8fe7ad5446f9b7cec83267f
end
