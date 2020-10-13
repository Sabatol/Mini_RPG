require 'bundler'
Bundler.require
require 'pry'

require_relative 'lib/game'
require_relative 'lib/player'

def orchestra
  player1 = Player.new("Josiane")
  player2 = Player.new("Michel")
  puts
  puts "A ma gaaaauche : #{player1.name} ! A ma droiiiiiite : #{player2.name} !" 
  puts
  puts "Voici l'état des joueurs :" 
  puts
  print player1.show_state, player2.show_state # ";" pour sauter une logne (à la place de ",")
  puts
  puts "Passons à la phase d'attaque !!!"
  puts
  while player1.life_points > 0 && player2.life_points > 0
  puts player1.attacks(player2)
  puts player2.show_state
  if player2.life_points == 0
    break
  else
  puts player2.attacks(player1) 
  puts player1.show_state
  end
  end
end
orchestra