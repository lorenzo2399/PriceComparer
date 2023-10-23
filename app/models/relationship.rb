class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validate :not_yourself

  def not_yourself
  if followed_id == follower_id
    errors.add(:followed_id, "you can't followe")
  end
end

end
