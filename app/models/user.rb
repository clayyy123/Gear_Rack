class User < ApplicationRecord
    has_many :gears, dependent: :destroy
    
    has_secure_password
    validates :password, length: { in: 6..20 }

    validates :email, uniqueness: true
    validates :email, presence: true

    validates :name, presence: true

    validates :bio, length: { maximum: 250}



end
