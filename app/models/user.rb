class User < ActiveRecord::Base
	authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

	validates :email, uniqueness: true


 
  has_many :projects, {foreign_key: :founder_id}
  has_many :projects, through: :pledges, class_name: 'Project' 
  has_many :pledges,  {foreign_key: :backer_id}

  has_many :rewards, through: :projects






end
