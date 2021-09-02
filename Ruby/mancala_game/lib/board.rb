class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2   # store cup of name1 is 6, and of name2 is 13
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups = Array.new(14){[]}
    cups.each_with_index do |cup, i|
      next if i == 6 || i == 13 
      4.times {cup << :stone}
    end
    cups 
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 13)
    raise "Starting cup is empty" if cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    @current_store = (current_player_name == @name1 ? 6 : 13)
    stones = cups[start_pos].length
    cups[start_pos] = []
    while stones > 0
      start_pos += 1
      start_pos %= 14
      next if @current_store == 13 && start_pos == 6 || @current_store == 6 && start_pos == 13 
      cups[start_pos] << :stone 
      stones -= 1
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == @current_store
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all?{|cup| cup.empty?}  ||  cups[7..12].all?{|cup| cup.empty?}
    false 
  end

  def winner
    points1 = cups[6].length
    points2 = cups[13].length 
    return :draw if points1 == points2 
    (points1 > points2 ? @name1 : @name2)
  end
end
