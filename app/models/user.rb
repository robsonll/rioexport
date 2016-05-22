class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :mniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  #attr_accessible :email, :password, :password_confirmation
  
  
  #validates_presence_of     :password
  #validates_confirmation_of :password
  #validates_presence_of     :password, if: :password_required?
  #validates_confirmation_of :password, if: :password_required?
  #validates_length_of       :password, within: password_length, allow_blank: false
  
  validates_presence_of   :email, if: :email_required?
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: email_regexp, allow_blank: true, if: :email_changed?

  validates_presence_of   :name

end
