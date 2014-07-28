#
#
class AutocompleteController < ApplicationController
  # Don't require login from the user for any of these
  skip_before_action :authenticate_user!
  
  #
  def complete 
    courses = Course.all
    classes = Array.new
    courses.each do |course|
      courseString = course.instructional_unit+ " " + course.course_number.to_s + ": " + course.name
      classes.push(courseString)
    end
  end
end