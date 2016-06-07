class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :created_battles, foreign_key: 'created_by_id', class_name: 'Battle'
  has_many :participated_battles, -> { distinct }, through: :comments, foreign_key: 'battle_id', source: :battle

  def self.current_winner
    Battle.last.winning_user
  end

  def battles_won
    Battle.joins(:winning_user).where('comments.user_id = ?', self.id)
  end
end
