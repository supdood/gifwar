class AddWinningCommentIdToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :winning_comment_id, :integer
  end
end
