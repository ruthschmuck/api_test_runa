class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true

  validates_presence_of :password_digest, :name, :lastName, :phone, :docId,
                        :address, :admin
end
