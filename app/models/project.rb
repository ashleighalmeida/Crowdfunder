class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges

  validates :title, presence: true
  validates :funding_goal, numericality: {only_integer: true}
  # validate :start_date_cannot_be_in_the_past

  # def start_date_cannot_be_in_the_past
  #   start_date.present? && start_date < Date.today
    
  # end
end
