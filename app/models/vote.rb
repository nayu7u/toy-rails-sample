class Vote < ApplicationRecord
  after_update_commit -> { broadcast_replace_to("home-vote", target: "vote_#{self.id}", partial: "home/vote") }
end
