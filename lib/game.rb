class Game
  attr_reader :tribes
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end
  def add_tribe(tribe)
    @tribes << tribe
  end
  def immunity_challenge
    tribes_len = @tribes.size
    loosing_tribe = @tribes[rand(tribes_len)]
    puts "Tribe #{loosing_tribe} lost the challenge."
    loosing_tribe
  end
  def clear_tribes
    @tribes.clear
  end
  def merge(new_tribe_name)
    combined_members = @tribes.map {|tribe| tribe.members}.flatten
    Tribe.new(name:new_tribe_name, members: combined_members)
  end
  def individual_immunity_challenge
    immune_constestant = @tribes.first.members.shuffle.first
    puts "#{immune_constestant} won the individual immunity challenge and is safe from elimiation."
    immune_constestant
  end
end