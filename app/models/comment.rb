class Comment < ActiveRecord::Base
	validates :user_id, presence:true, inclusion:{in:User.pluck(:id)}
	validates :battle_id, presence:true, inclusion:{in:Battle.pluck(:id)}

  belongs_to :battle
  belongs_to :comment
  belongs_to :user

  has_many :comments
end
