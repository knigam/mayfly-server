class Invite < ActiveRecord::Base
    belongs_to :user
    belongs_to :event
    validates_uniqueness_of :user_id, :scope => "event_id"
#    validate :under_max 

    def under_max
        if attending && event.max != -1 && event.invites.where(attending: true).count >= @invite.event.max
            errors.add(:event_id, 'Event max limit reached')
        end
    end
end
