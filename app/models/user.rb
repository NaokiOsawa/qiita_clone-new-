# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :account, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :articles
  has_many :comments
  has_many :article_likes
end
