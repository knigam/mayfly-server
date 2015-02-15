class Grouping < ActiveRecord::Base
    belongs_to :group
    belongs_to :friendship
    validates_uniqueness_of :group_id, :scope => "friend_id"
end
