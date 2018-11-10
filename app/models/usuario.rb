class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :timeoutable, :expirable,
         :password_expirable, :secure_validatable, :password_archivable, :session_limitable

    validate :password_complexity

    validates :email, :email => true

    def password_complexity
    	if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\W])/)
      		errors.add :password, "debe incluir al menos una letra minúscula, una letra mayúscula, un número y un símbolo"
    	end
  	end
end
