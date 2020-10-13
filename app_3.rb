require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

puts
puts "Bienvenue dans le mini jeu POO !"
puts "   
        |>>>                                                      |>>>
        |                     |>>>           |>>>                 |
        *                     |            * |                  / *
     /  |                    *|           /  |                 /  |
    /___|                 _/  |          /   |_               /___|
    [   ]                |/   |_________/    ||               [   ]
    [ I ]                /     |       /      |               [ I ]
    [   ]_ _ _          /       |     /        |         _ _ _[   ]
    [   ] U U |        {#########}   {#########}        | U U [   ]
    [   ]====/          |=======/     |=======/          |====[   ]
    [   ]    |           |   I |_ _ _ _| I   |           |    [   ]
    [___]    |_ _ _ _ _ _|     | U U U |     |_ _ _ _ _ _|    [___]
    |===/  I | U U U U U |     |=======|     | U U U U U | I  |===/
    | =/     |===========| I   | + W + |   I |===========|     |=/
    |    I   |           |     |_______|     |           |   I  |
    |        |           |     |||||||||     |           |      |
    |        |           |   I ||vvvvv|| I   |           |      |
_-_-| ______ |-----------|_____||     ||_____|-----------|______|-_-_
    /________|          /______||     ||______|         /________|
  |__________|---------|________|_____/________|-------|__________|
"
puts
puts "Quel est ton nom, voyageur ?"
puts
print "Ton nom > "
player_name = gets.chomp
my_game = Game.new(player_name)

while my_game.is_still_ongoing? == true
  puts
  my_game.show_players
  suspens = gets.chomp
  my_game.menu
  my_game.menu_choice
  suspens = gets.chomp
  my_game.enemies_attack
end

my_game.end
