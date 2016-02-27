class Tribe
  attr_reader :name, :members
  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    puts "Tribe #{@name} is in."
  end
  def tribal_council(options = {})
    immune = options[:immune]
    @members.select {|member| member != immune}.first
  end
  def to_s
    @name
  end
end