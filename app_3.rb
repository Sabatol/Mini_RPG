require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

  puts
  puts "Bienvenue dans le mini jeu POO !"
  puts "Put the castle here"
  puts
  puts "Quel est ton nom, voyageur ?"
  puts
  print "Ton nom > "
  player_name = gets.chomp
  my_game = Game.new(player_name)

while my_game.is_still_ongoing? == true
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end

my_game.end
