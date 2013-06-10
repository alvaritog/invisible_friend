class Player < ActiveRecord::Base

  attr_accessible :email, :name, :forbidden_destinies, :forbidden_destiny_ids

  belongs_to :player_list

  has_one :assignment_to, :class_name => "Assignment", :foreign_key => 'origin_id', :dependent => :destroy
  has_one :assignment_from, :class_name => "Assignment", :foreign_key => 'destiny_id', :dependent => :destroy

  has_and_belongs_to_many :forbidden_destinies, :class_name => Player, :join_table => "forbidden_destinies", 
                         :association_foreign_key => "destiny_id", :foreign_key => "origin_id"

  has_and_belongs_to_many :forbidden_origins, :class_name => Player, :join_table => "forbidden_destinies", 
                         :association_foreign_key => "origin_id", :foreign_key => "destiny_id"

  def destiny 
    assignment_to.nil? ? nil : assignment_to.destiny
  end

  def players_in_list
    player_list.players - [self]
  end

end
