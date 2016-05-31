class Battle < ActiveRecord::Base
	validates :topic, presence:true
	validates :created_by_id, presence:true, inclusion:{in:User.pluck(:id)}
	belongs_to :created_by, class_name:'User'
end