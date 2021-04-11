class VoteLog < ApplicationRecord
  belongs_to :movie, counter_cache: true
end
