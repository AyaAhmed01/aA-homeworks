class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |col|
      puts col 
      clear_screen
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter in line"
    sequence_length.times do |i|
      letter = gets.chomp
      if letter != seq[i][0]
        @game_over = true 
        return 
      end
    end
    system("cls")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Successful round! Here is the next sequence:"
    clear_screen
  end

  def game_over_message
    puts "Game over ): you made it #{sequence_length - 1} rounds!"
    clear_screen
  end

  def clear_screen
    sleep(0.75)
    system("clear")
  end

  def reset_game
    @sequence_length, @game_over, @seq = 1, false, []
  end
end

game = Simon.new
game.play 