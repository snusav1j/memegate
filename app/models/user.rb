class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_secure_password
  ROLE_CEO = 'ceo'
  ROLE_DIRECTOR = 'director'
  ROLE_USER = 'user'
  ROLE_DEVELOPER = 'dev'
  DEV_ROLES = [ROLE_CEO, ROLE_DIRECTOR, ROLE_USER, ROLE_DEVELOPER]
  CEO_ROLES = [ROLE_CEO, ROLE_DIRECTOR, ROLE_USER]
  DIRECTOR_ROLES = [ROLE_DIRECTOR, ROLE_USER]

  def self.get_user_coins(user_id)
    UserCoin.where(user_id: user_id)
  end

  def have_super_permission?
    self.role == ROLE_DIRECTOR || self.role == ROLE_CEO || self.role == ROLE_DEVELOPER
  end

  def director?
    self.role == ROLE_DIRECTOR
  end

  def ceo?
    self.role == ROLE_CEO
  end

  def dev?
    self.role == ROLE_DEVELOPER
  end


  def fullname
    if self.firstname.present? && self.lastname.present?
      if self.firstname == self.lastname
        "#{self.firstname}"
      else
        "#{self.firstname} #{self.lastname}"
      end
    elsif self.lastname.present?
      "#{self.lastname}"
    elsif self.firstname.present?
      "#{self.firstname}"
    else
      "noname"
    end
  end
  
  def short_name
    if self.firstname.present?
      "#{self.firstname}"
    else
      "noname"
    end
  end

end
