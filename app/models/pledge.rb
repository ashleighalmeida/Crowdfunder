class Pledge < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :reward
end

# if I pledge for a project, then I will get a reward as well