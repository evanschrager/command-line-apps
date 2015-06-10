def roll
  result = [rand(1..6),rand(1..6),rand(1..6)].sort!
end

def roll_valid?(roll)
  if roll == [4,5,6]
    true
  elsif roll == [1,2,3]
    true
  elsif roll[0] == roll[1] && roll[0] == roll[2]
    true
  elsif roll[0] == roll[1] && roll[0] != roll[2]
    true
  # elsif roll[0] == roll[2] && roll[0] != roll[1]
    # Unnecessary? Middle value cannot be different if element 0 and element 2 are equal...[1,3,1] can't happen..
    # [5,5,5] covered in previous conditional
    # true
  elsif roll[1] == roll[2] && roll[1] != roll[0]
    true
  else
    false
  end
end



def roll_value(roll)
  if roll == [4,5,6]
    # winning roll
    456456
  elsif roll == [1,2,3]
    #losing roll
    0
  elsif roll[0] == roll[1] && roll[0] == roll[2]
    # check to see what the triples are and assign arbitrary 'point' value
    if roll[0] == 1
      111
    elsif roll[0] == 2
      222
    elsif roll[0] == 3
      333
    elsif roll[0] == 4
      444
    elsif roll[0] == 5
      555
    elsif roll[0] == 6
      666
    end
  elsif roll[0] == roll[1] && roll[0] != roll[2]
    # example [1,1,6], [5,5,6], [1,1,2]
    if roll[2] == 1
      1
    elsif roll[2] == 2
      2
    elsif roll[2] == 3
      3
    elsif roll[2] == 4
      4
    elsif roll[2] == 5
      5
    elsif roll[2] == 6
      6
    end
  elsif roll[1] == roll[2] && roll[1] != roll[0]
    # example [1,6,6], [3,5,5], [2,4,4]
    if roll[0] == 1
      1
    elsif roll[0] == 2
      2
    elsif roll[0] == 3
      3
    elsif roll[0] == 4
      4
    elsif roll[0] == 5
      5
    elsif roll[0] == 6
      6
    end
  else
    #roll again? nil?
    nil
  end
end

def p1_turn
  puts "Player 1: Your turn! Please input 'roll' and hit enter!"
  @p1_roll = [2,3,4]
  while roll_valid?(@p1_roll) == false
    type = gets.strip.downcase
    if roll_valid?(@p1_roll) == true
      @p1_val = roll_value(@p1_roll)
      puts "Player 1 rolled #{@p1_roll}!"
    end
    @p1_roll = roll
    if roll_valid?(@p1_roll)
      @p1_val = roll_value(@p1_roll)
      puts "Player 1 rolled #{@p1_roll}!"
    else
      puts "Player 1 rolled #{@p1_roll}! Please roll again..." # NEED TO LOOP BACK TO ROLL IN THIS CASE
    end
  end
end

def p2_turn
  puts "Player 2: Your turn! Please input 'roll' and hit enter!"
  @p2_roll = [2,3,4]
  while roll_valid?(@p2_roll) == false
    type = gets.strip.downcase
    if roll_valid?(@p2_roll) == true
      @p2_val = roll_value(@p2_roll)
      puts "Player 2 rolled #{@p2_roll}!"
    end
    @p2_roll = roll
    if roll_valid?(@p2_roll)
      @p2_val = roll_value(@p2_roll)
      puts "Player 2 rolled #{@p2_roll}!"
    else
      puts "Player 2 rolled #{@p2_roll}! Please roll again..."
    end
  end
end

def winner?
  puts "Player 1 rolled #{@p1_roll}. Player 2 rolled #{@p2_roll}."
  sleep(3)
  if @p1_val > @p2_val
    puts "Player 1 Wins!"
    sleep(2)
    puts "Type 'play' to play again!"
  elsif @p2_val > @p1_val
    puts "Player 2 Wins!"
    sleep(2)
    puts "Type 'play' to play again!"
  elsif @p1_val == @p2_val
    puts "It's a push! You both keep your money..."
    sleep(2)
    puts "Type 'play' to play again!"
  end
end

def runner
  puts "Welcome to my underground Cee-Lo ring! Holla at me when you ready dawg... I support 'play', 'help' and 'exit'"
  input = nil
  while input != "exit"
    input = gets.strip.downcase
    if input == "exit"
      puts "See ya on da block anotha time, homie...watch yo back in the meantime..."
      break
    elsif input == "help"
      puts "Is this your first gangsta rodeo? I support 'play', 'help' and 'exit'"
    elsif input == "play"
      puts "Let the games begin! May the best gangsta win..."

      p1_turn
      p2_turn

      winner?
    else
      puts "That is not a valid command! I support 'play', 'help' and 'exit'"
    end
  end
end

runner