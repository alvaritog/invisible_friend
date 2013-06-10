class PlayerList < ActiveRecord::Base
  attr_accessible :name, :players_attributes

  belongs_to :user

  has_many :players
  accepts_nested_attributes_for :players, :allow_destroy => true

  has_many :assignments

#  attr_accessor :shuffled_players

  def clear_assignments
    assignments.each{|a|a.destroy}
  end

  def raffle
    clear_assignments
    build_temp_assignments.each{|a| a.save}
  end

  def send_raffle_results
    players.each{|player| PlayerMailer.raffle_results_email(player).deliver}
  end

  def build_temp_assignments
    temp_assignments = []
    if !players.empty?
      while (!valid_assignments? temp_assignments)
        temp_assignments = []
        shuffled_players = players.dup.shuffle
        temp_assignments = players.collect{|p| Assignment.new( :player_list => self, :origin => p, :destiny => shuffled_players[players.index(p)])} 
#puts "ASSIGMENTS: #{temp_assignments.collect{|a|[a.origin.name,a.destiny.name]}.inspect}"
      end
    end
    temp_assignments
  end

  def valid_assignments?(list=self.assignments.all)
    !list.empty? &&
#    (assignments.count = players.count)
    list.detect{|a| a.origin == a.destiny }.nil? &&
    list.detect{|a| a.origin.forbidden_destinies.include? a.destiny }.nil?
  end

end
