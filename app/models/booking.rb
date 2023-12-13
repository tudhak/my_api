class Booking < ApplicationRecord
  belongs_to :listing

  after_create :request_cleanings
  before_destroy :destroy_missions

  def request_cleanings
    Mission.generate_cleanings(self)
  end
end
