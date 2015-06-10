# WAR!

# This is used to tell users how many turns the game lasted
@num_turn = 0

# Define a scoring hash, I see you cringing already
@score = {
  "2 of Spades" => 2,"2 of Hearts" => 2,"2 of Clubs" => 2,"2 of Diamonds" => 2, "3 of Spades" => 3,"3 of Hearts" => 3,"3 of Clubs" => 3,"3 of Diamonds" => 3,
  "4 of Spades" => 4,"4 of Hearts" => 4,"4 of Clubs" => 4,"4 of Diamonds" => 4,"5 of Spades" => 5,"5 of Hearts" => 5,"5 of Clubs" => 5,"5 of Diamonds" => 5,
  "6 of Spades" => 6,"6 of Hearts" => 6,"6 of Clubs" => 6,"6 of Diamonds" => 6,"7 of Spades" => 7,"7 of Hearts" => 7,"7 of Clubs" => 7,"7 of Diamonds" => 7,
  "8 of Spades" => 8,"8 of Hearts" => 8,"8 of Clubs" => 8,"8 of Diamonds" => 8,"9 of Spades" => 9,"9 of Hearts" => 9,"9 of Clubs" => 9,"9 of Diamonds" => 9,
  "10 of Spades" => 10,"10 of Hearts" => 10,"10 of Clubs" => 10,"10 of Diamonds" => 10,"Jack of Spades" => 11,"Jack of Hearts" => 11,"Jack of Clubs" => 11,"Jack of Diamonds" => 11,
  "Queen of Spades" => 12,"Queen of Hearts" => 12,"Queen of Clubs" => 12,"Queen of Diamonds" => 12,"King of Spades" => 13,
  "King of Hearts" => 13,"King of Clubs" => 13,"King of Diamonds" => 13,"Ace of Spades" => 14,"Ace of Hearts" => 14,"Ace of Clubs" => 14,"Ace of Diamonds" => 14
}

def deal_cards
  # Create a deck array with same names as the hash keys above
  @deck = ["2 of Spades", "2 of Hearts", "2 of Clubs", "2 of Diamonds","3 of Spades", "3 of Hearts", "3 of Clubs", "3 of Diamonds","4 of Spades", "4 of Hearts", "4 of Clubs", "4 of Diamonds","5 of Spades", "5 of Hearts", "5 of Clubs", "5 of Diamonds","6 of Spades", "6 of Hearts", "6 of Clubs", "6 of Diamonds","7 of Spades", "7 of Hearts", "7 of Clubs", "7 of Diamonds", "8 of Spades", "8 of Hearts", "8 of Clubs", "8 of Diamonds", "9 of Spades", "9 of Hearts", "9 of Clubs", "9 of Diamonds", "10 of Spades", "10 of Hearts", "10 of Clubs", "10 of Diamonds", "Jack of Spades", "Jack of Hearts", "Jack of Clubs","Jack of Diamonds","Queen of Spades", "Queen of Hearts", "Queen of Clubs","Queen of Diamonds","King of Spades", "King of Hearts", "King of Clubs","King of Diamonds","Ace of Spades", "Ace of Hearts", "Ace of Clubs","Ace of Diamonds"]
  # Shuffle It!
  @deck.shuffle!
  # Split it
  @deck_1 = @deck.slice(0,26)
  @deck_2 = @deck.slice(26,51)
end

def take_turn
  # Keeping track of turns
  @num_turn += 1

  puts "Player 1 played #{@deck_1[0]}!"
  puts "Player 2 played #{@deck_2[0]}!"
  # sleep 3
  if @score[@deck_1[0]] > @score[@deck_2[0]]
    @deck_1 << @deck_2[0]
    @deck_1 << @deck_1[0]
    @deck_1.shift[0]
    @deck_2.shift[0]
    puts "Player 1 takes the cards."
  elsif @score[@deck_1[0]] < @score[@deck_2[0]]
    @deck_2 << @deck_1[0]
    @deck_2 << @deck_2[0]
    @deck_1.shift[0]
    @deck_2.shift[0]
    puts "Player 2 takes the cards."
  else
    # Above tests to see if player 1 or 2 wins, else, it's a tie!
    war_time!
  end
end

def war_time! # Instance variables for days
  @i = 4
  puts "It's a tie! WAR!"
  # sleep 2
  puts "Player 1 plays three cards face down, and plays #{@deck_1[@i]}!"
  puts "Player 2 plays three cards face down, and plays #{@deck_2[@i]}!"
  @x = true
  while @x == true
    if @deck_1.count > @i && @deck_2.count > @i # If both decks can survive the war, go to battle
      if @score[@deck_1[@i]] > @score[@deck_2[@i]]
        set1 = @deck_1.shift(@i)
        set2 = @deck_2.shift(@i)
        @deck_1 << set1
        @deck_1 << set2
        @deck_1.flatten!
        puts "Player 1 wins and takes all the cards!"
        @x = false
      elsif @score[@deck_1[@i]] < @score[@deck_2[@i]]
        set1 = @deck_1.shift(@i)
        set2 = @deck_2.shift(@i)
        @deck_2 << set1
        @deck_2 << set2
        @deck_2.flatten!
        puts "Player 2 wins and takes all the cards!"
        @x = false
      else
        puts "It's a tie! ANOTHER WAR!!!"
        # sleep 2
        @i += 4
        puts "Player 1 plays three cards face down, and plays #{@deck_1[@i]}!"
        puts "Player 2 plays three cards face down, and plays #{@deck_2[@i]}!"
        @x = true
      end
    else
      end_war
    end
  end
end

def end_war
  if @deck_1.count <= @i
    if @score[@deck_1.last] > @score[@deck_2[@i]]
      set1 = @deck_1.shift(@deck_1.count)
      set2 = @deck_2.shift(@i)
      @deck_1 << set1
      @deck_1 << set2
      @deck_1.flatten!
      puts "Player 1 wins and takes all the cards!"
      @x = false
    else # Ends the game...in a rare case that THIS is a tie....end it anyway.
      @deck_1.clear
      @x = false
    end
  elsif @deck_2.count <= @i
    if @score[@deck_2.last] > @score[@deck_1[@i]]
      set2 = @deck_2.shift(@deck_2.count)
      set1 = @deck_1.shift(@i)
      @deck_2 << set1
      @deck_2 << set2
      @deck_2.flatten!
      puts "Player 2 wins and takes all the cards!"
      @x = false
    else # Ends the game...in a rare case that THIS is a tie....end it anyway.
      @deck_2.clear
      @x = false
    end
  end
end

def run
  puts "Hello players -- welcome to WAR! May the strongest knight win!"
  deal_cards
  loop do
    break if @deck_1.empty? || @deck_2.empty?
    take_turn
  end
  if @deck_1.empty?
    puts "Congratulations Player 2! You won in #{@num_turn} turns!"
  else
    puts "Congratulations Player 1! You won in #{@num_turn} turns!"
  end
end

# Run the game! Optional sleep timers included if you want to watch each turn as it goes! FUN!
run
