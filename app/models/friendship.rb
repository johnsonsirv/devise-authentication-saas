class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  scope :pending_requests, -> { where(confirmed: false) }
  scope :confirmed, -> { where(confirmed: true) }
  
  validate :is_self_irreflexive
  validates :user, presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }
  
  
  def self.confirm_friend_request_for(user, friend)
    friendship = where(user: user, friend: friend)
    .or(where(user: friend, friend: user))
    
    transaction do
      friendship.update(confirmed: true)
      user.friendships.create(friend: friendship.first.user, confirmed: true)
    end
  end
  
  def self.remove_friendship_between(user, friend)
    friendship = where(user: user, friend: friend)
    .or(where(user: friend, friend: user))
    
    friendship.destroy_all
  end
  
 
  
    private

    def is_self_irreflexive
      msg = "can't be friends with self"
      errors.add(:friendship_is_irreflexive!, msg) if user == friend
    end
end
