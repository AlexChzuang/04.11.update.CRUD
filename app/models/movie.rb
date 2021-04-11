class Movie < ApplicationRecord
  has_many :vote_logs, dependent: :destroy
end
