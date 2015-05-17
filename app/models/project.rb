class Project < ActiveRecord::Base
  belongs_to(:founder, {class_name: "User", foreign_key: :founder_id})
  has_many :rewards
  has_many :pledges
  has_many :comments
  has_many :backers, through: :pledges

  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  validates :title, :description, presence: true
  validates :funding_goal, numericality: {only_integer: true}
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def amount_pledged
    total_raised = pledges.where(project_id: id)
    if total_raised 
      total_raised.sum(:amount)
    else 0
    end 
  end

  def status(user)
    if user == founder
      "Founded"
    elsif backers.exists?(user.id)
      "Backed"
    else
      "Back this"
    end
  end

  # def pledges_by_user
  #    pledged_so_far = pledges.where(project_id: id) 
  #    if @logged_in?  
  #     pledged_so_far
  #   else 0
  #   end
  # end

end


