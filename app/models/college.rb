# The College class represents the entity college in a university (eg. the College of Engineering, College of Arts and Sciences, etc.).
#
# Attributes are stored as follows:
#
#   * +:name+ is stored as string and represents the name of the college

class College < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :course_groups
end
