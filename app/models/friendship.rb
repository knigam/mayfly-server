class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, :class_name => 'User'
    has_many :groupings, :dependent => :destroy
    has_many :groups, :through => :groupings
    validates_uniqueness_of :user_id, :scope => "friend_id"
    validates :user_id, :friend_id, :presence => true
    validate :cant_friend_self

    def cant_friend_self
        if user_id == friend_id
            errors.add(:friend_id, "can't add self as friend")
        end
    end
end
