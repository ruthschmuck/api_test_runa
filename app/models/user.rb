class User < ApplicationRecord
  has_many :entry_times, dependent: :destroy
  has_many :off_times, dependent: :destroy

  has_secure_password

  validates :email,
            presence: true, uniqueness: true, 'valid_email_2/email': true

  validates_presence_of :password_digest, :name, :lastName, :phone, :docId,
                        :address, :admin

  enum admin: %w[true false]
end
