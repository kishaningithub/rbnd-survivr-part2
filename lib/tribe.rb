class Tribe
  attr_reader :name, :members
  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{@name} is in with mates #{@members.join(", ").strip}."
  end
  def tribal_council(options = {})
    immune = options[:immune]
    eliminated_contestant = @members.select {|member| member != immune}.shuffle.first
    @members.delete_if { |member| member == eliminated_contestant }
    puts "#{eliminated_contestant} was voted off the island."
    puts "The remaining tribe mates in #{@name} are #{@members.join(", ").strip}."
    eliminated_contestant
  end
  def to_s
    @name
  end
end