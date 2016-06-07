User.create!([
  { email: "jonathan.arnett@example.com", password: "password", full_name: "Jonathan Arnett" },
  { email: "austin.trout@example.com",    password: "password", full_name: "Austin Trout" },
  { email: "dimitry.raymond@example.com", password: "password", full_name: "Dimitry Raymond" },
  { email: "ethan.fetsko@example.com",    password: "password", full_name: "Ethan Fetsko" },
  { email: "george.milberger@example.com",password: "password", full_name: "George Milberger" },
])

battle = Battle.create!(topic: "Work Shenanigans", description: "Post-ironic selfies franzen, YOLO sriracha vice helvetica squid salvia tofu blog beard fanny pack +1.", created_by: User.all.sample)

comment = Comment.create!(user: User.all.sample, battle: battle, body: "http://www.gifbin.com/bin/012016/beer-on-speeding-tank-39-s-cannon.gif")
sub_comment = Comment.create!(user: User.all.sample, battle: battle, body: "Neat gif!", comment: comment)
Comment.create!(user: User.all.sample, battle: battle, body: "Cheers!", comment: sub_comment)

other_comment = Comment.create!(user: User.all.sample, battle: battle, body: "http://www.picgifs.com/movies-and-series/movies/indiana-jones/picgifs-indiana-jones-1667336.gif")
Comment.create!(user: User.all.sample, battle: battle, body: "I love this film!", comment: other_comment)

battle.update(winning_comment: comment)

Battle.create!(topic: "In a hurry", description: "Blog pinterest pitchfork cliche, chia plaid letterpress aesthetic keytar bicycle rights keffiyeh selvage church-key narwhal.", created_by: User.all.sample)
