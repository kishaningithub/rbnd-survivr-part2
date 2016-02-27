class Game
  attr_reader :tribes
  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end
  def add_tribe(tribe)
    @tribes << tribe
  end
  def immunity_challenge
    @tribes[0]
  end
  def clear_tribes
    @tribes.clear
  end
  def merge(new_tribe_name)
    combined_members = @tribes.map {|tribe| tribe.members}.flatten
    Tribe.new(name:new_tribe_name, members: combined_members)
  end
  def individual_immunity_challenge
    self.immunity_challenge.members[0]
  end
end