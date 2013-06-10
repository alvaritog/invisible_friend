class Assignment < ActiveRecord::Base
  attr_accessible :player_list, :origin_id, :origin, :destiny

  belongs_to :player_list

  belongs_to :origin, :class_name => 'Player'
  belongs_to :destiny, :class_name => 'Player'

end
