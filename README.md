I built a simulation of the card game, WAR. It runs as a ruby script on the command line. All of the code is in a single file.

Simply run "ruby war.rb" on the command line and in a split second the game unfolds. 

At the conclusion of the game, the program lets you know how many turns the game took.

Each turn logs the cards played so you can look back through the game to see what happened. There are sleep timers commented out in the code that you can mess around with if you'd like to watch the game unfold turn by turn.

Challenges Faced:

-- Creating an OO solution: Abstracting out logic for comparing cards (haven't done this)
-- Implementing logic to handle situation where one player doesn't have enough cards to get through a WAR situation.
    Current Solution: wrote an 'end_war' method to handle this
    -- If the player with too few cards wins, the game continues
    -- If the player with too few cards loses, the game is over
    -- If the players tie (when one player is out of cards), the game ends and the player without cards is the loser.
    
Feel free to fork and submit pull requests for any code you want to improve!

I ran this simulation 500 times for fun and the average amount of turns per game was approx 230 turns.
