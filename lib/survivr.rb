require 'colorizr'

require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def put_new_lines(no_of_newlines)
  no_of_newlines.times do
    puts ""
  end
end
def begin_phase(phase_name, no_of_challenges, &block)
  if block
    put_new_lines(2)
    puts "Let phase #{phase_name} begin.".blue
    no_of_challenges.times do |i|
      puts "Round #{i+1}".yellow
      block.call
      put_new_lines(1)
    end
  end
  no_of_challenges
end

def phase_one
  begin_phase("one", 8) do 
    loosing_tribe = @borneo.immunity_challenge
    loosing_tribe.tribal_council
  end
end

def phase_two
  @borneo.clear_tribes
  @borneo.add_tribe(@merge_tribe)
  begin_phase("two", 3) do
    immune = @borneo.individual_immunity_challenge
    @merge_tribe.tribal_council(immune: immune)
  end
end

def phase_three
  begin_phase("three", 7) do
    immune = @borneo.individual_immunity_challenge
    jury_member = @merge_tribe.tribal_council(immune: immune)
    @jury.add_member(jury_member)
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
