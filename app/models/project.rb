class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges
  has_many :comments
  has_many :users, through: :reviews
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :description, presence: true
  validates :funding_goal, numericality: {only_integer: true}
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end


  # def days_left
  #    end_date - Date.now  
  # end

end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
end

class User < ActiveRecord::Base
  
  has_many :commments
  has_many :projects, through: :comments
end

