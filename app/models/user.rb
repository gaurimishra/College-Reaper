# The User class represents a user in the application, which is understood to mean a person seeking to generate a
# schedule. Devise uses this model to authenticate sessions as well, so it carries all the attributes necessary for
# all the included Devise modules.
#
# Attributes are stored as follows:
#
#   * +:uuid+ is a "universal" user id, typically some sort of student ID number
#   * +:rank+ is an indicator of class rank, left a little arbitrary, as an integer so comparisons are fast
#   * Attributes wich are required by Devise, organized by the module which requires them are:
#       * +:dabase_authenticatable+ module
#           * +:email+ is the user's email address, stored in plain text, but downcased
#           * +:encrypted_password+ is the peppered and hashed password for the user
#       * +:recoverable+ module
#           * +:reset_password_token+ holds the actual token a user must present to allow access to the reset form
#           * +:reset_password_sent_at+ tracks when the last reset token was sent to the user (via email)
#       * +:rememberable+ module
#           * +:remember_created_at+ records when the user was last "seen" for the purposes of maintaining the session
#       * +:trackable+ module
#           * +:sign_in_count+ counts the number of times the user has signed in
#           * +:current_sign_in_at+ records when the _currently active_ session was started
#           * +:last_sign_in_at+ notes when the _last_ session the user had was started
#           * +:current_sign_in_ip+ gives the IP address of the _currently active_ session
#           * +:last_sign_in_ip+ gives the IP address of the _last_ session the user had
#       * +:confirmable+ module
#           * +:confirmation_token+ the token that must be presented to consider the new email confirmed
#           * +:confirmed_at+ records when the user successfully confirmed their current email address
#           * +:confirmation_sent_at+ records when the user was sent the current confirmation token (via email)
#           * +:unconfirmed_email+ the new email, which has not yet been confirmed
#       * +:lockable+ module
#           * +:failed_attempts+ counts the number of failed sign ins that have occurred since the last successful one
#           * +:unlock_token+ the token that must be presented to re-enable the ability to sign in
#           * +:locked_at+ records when the account reached the maximum number of failures and was locked out
class User < ActiveRecord::Base
  # Include (all) default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable

  validates :uuid, uniqueness: true, presence: true

  has_many :preferences
  belongs_to :person
  has_many :completions
  has_many :courses, through: :completions
<<<<<<< HEAD
  
end
=======
  has_many :schedules
end
>>>>>>> upstream/master
