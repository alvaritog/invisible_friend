# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

user = User.create(:email => 'list-creator-and-mail-sender@example.com', :password => 'user-mail-and-app-password', :password_confirmation => 'user-mail-and-app-password')
user = User.confirm_by_token(user.confirmation_token)

#TEST DATA
pl = PlayerList.create :name => 'Test list',
                  :players_attributes => [
                    {:name => "Player 1", :email => "player1@gnoxys.net"},
                    {:name => "Player 2", :email => "player2@gnoxys.net"},
                    {:name => "Player 3", :email => "player3@gnoxys.net"},
                    {:name => "Player 4", :email => "player4@gnoxys.net"}
                  ]

# Forbidden destinies to force a single result on tests
[['Player 1', 'Player 2'], ['Player 2', 'Player 3'], ['Player 3', 'Player 4'], ['Player 4', 'Player 1'] ].each do |group|
  group = group.collect{|name|pl.players.find_by_name(name)}
  group.count.times do |i|
    group.first.forbidden_destinies << group[1..-1]
    group << group.shift
  end
end

pl.user = user
pl.save!





