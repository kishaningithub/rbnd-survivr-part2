class Jury
  attr_accessor :members
  def initialize()
    @members = []
  end
  def add_member(member)
    puts "#{member} is member #{members.size + 1} of jury."
    @members << member
  end
  def cast_votes(finalists)
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    @members.each do |member|
      selected_finalist = finalists[rand(2)]
      votes[selected_finalist] = votes[selected_finalist] + 1
      puts "#{member} cast their vote for #{selected_finalist}."
    end
    votes
  end
  def report_votes(votes)
    votes.each { |k,v| puts "#{k} received #{v} votes."}
    puts ""
  end
  def announce_winner(final_votes)
    max_votes = 0
    winner = NIL
    final_votes.each do |k,v|
      if v > max_votes then
        winner = k
        max_votes = v
      end 
    end
    puts "The winner is #{winner}!"
    winner
  end
end