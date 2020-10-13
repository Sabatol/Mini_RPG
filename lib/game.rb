
require_relative 'player'

class Game < HumanPlayer
  attr_accessor :human_player, :enemies
  # Initialise une partie avec un nom, va chercher 4 ennemis aléatoires parmi la liste
  def initialize(name)
    @name = name
    enemies_name = ["Florian", "Laurox dorée", "Cyprien", "Romain", "Nico", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
    $enemies = enemies_name.sample(4).map!{|enemi_name| Player.new(enemi_name)}
    @user = HumanPlayer.new(name)
  end
  # Supprime un bot de la liste des ennemis si ses HP sont à 0 ou moins
  def try_to_kill(player)
    if player.life_points <= 0
      $enemies.delete(player)
    end
  end
  # Le jeu continue ? Booléen
  def is_still_ongoing?
    if $enemies.count != 0 && @user.life_points > 0 #ou @enemies != nill ?
      return true
    else 
      return false
    end
  end
  # Affiche l'état du joueur et le nombre de bot restants
  def show_players
    puts @user.show_state
    puts "Il reste #{$enemies.count} ennemis"
  end
  # Menu (affichage seulement)
  def menu
    puts "Tu veux faire quoi maintenant ?"
    puts
    puts "a - chercher une meilleure arme"
    puts
    puts "s - chercher à se soigner" 
    puts
    puts "Ou attaquer un joueur en vue :"
    puts
      $enemies.each do |enemi|
        if enemi.life_points != 0
          print "#{$enemies.index(enemi)} - " 
          puts enemi.show_state
        end
      end
    
  end

  # Prends une string comme input et sort un output en fonction du choix
  def menu_choice
    print "Ton action > "
    action = gets.chomp
    puts 
    puts 
    puts 
    puts     
    puts  " 
               .--.
              |.--.|
    |         |====|
   &&         |`::`|
  &&&&    .-;`|....|`;_.-^-._
   ||    /  |...::..|`   :   `|
   |:'- |   /'''::''|   .:.   |
  @|   /;-,/|   ::  |..:::::..|
  '||| <` > |>._::_.| ':::::' | 
   || `--`  |   ^^  |   ':'   |
   ||       |       \    :    /
   ||       |        \   :   / 
   ||       |___  ___|`-.:.-`
   ||        |_ || _|    `
   ||        <_ >< _>
   ||        |  ||  |
   ||        |  ||  |
   ||       _|.:||:.|_
   ||      /____||____|           "
  puts 
  puts 
  puts "...Allez... C'est vrai qu'il est beau mais clique sur 'Entrée' maintenant."
  suspens = gets.chomp
      
  
      case action
        when "a"
          @user.search_weapon
        when "s"
          @user.search_health_pack    
        when "0"
          @user.attacks($enemies[0])
          try_to_kill($enemies[0])
        when "1"
          @user.attacks($enemies[1])
          try_to_kill($enemies[1])
        when "2"
          @user.attacks($enemies[2])
          try_to_kill($enemies[2])
        when "3"
          @user.attacks($enemies[3])
          try_to_kill($enemies[3])
        else
          puts "Aïe aïe aïe... Il fallait écrire 'a', 's', '0', '1', '2' ou '3' !" 
          puts "Tant pis pour toi, tu perds un tour à te faire marrave gratos !"
      end
  end
  def enemies_attack
    unless $enemies.count == 0
    puts "Les autres joueurs t'attaquent !" 
    $enemies.each {|enemi| enemi.life_points != 0 ? enemi.attacks(@user) : enemi}
    end
  end
  # FIIIIIIIN DU JEEEEEEEU
  def end
    puts
    puts "--------------------------------------------------------"
    puts "              La partie est TERMINEE !"
    puts "--------------------------------------------------------"
    puts
    puts "##############PRESS ENTER TO CONTINUE###################"
    suspens = gets.chomp
    if @user.life_points > 0
      puts 
      puts "AND YOU WIIIIIIIIN !"
      puts "              
                              ¶¶¶¶¶¶¶¶¶¶¶¶ 
                              ¶¶             ¶¶ 
                ¶¶¶¶¶        ¶¶                ¶¶ 
                ¶     ¶     ¶¶      ¶¶    ¶¶     ¶¶ 
                 ¶     ¶    ¶¶       ¶¶    ¶¶      ¶¶ 
                  ¶    ¶   ¶¶        ¶¶    ¶¶      ¶¶ 
                   ¶   ¶   ¶                         ¶¶ 
                 ¶¶¶¶¶¶¶¶¶¶¶¶                         ¶¶ 
                ¶            ¶    ¶¶            ¶¶    ¶¶ 
                ¶¶            ¶    ¶¶            ¶¶    ¶¶ 
              ¶¶   ¶¶¶¶¶¶¶¶¶¶¶      ¶¶        ¶¶     ¶¶ 
              ¶               ¶       ¶¶¶¶¶¶¶       ¶¶ 
              ¶¶              ¶                    ¶¶ 
               ¶   ¶¶¶¶¶¶¶¶¶¶¶¶                   ¶¶ 
               ¶¶           ¶  ¶¶                ¶¶ 
                ¶¶¶¶¶¶¶¶¶¶¶¶    ¶¶            ¶¶
                                ¶¶¶¶¶¶¶¶¶¶¶"
      puts
    else 
      puts "|==========================GAME OVER===========================|"
      puts
      puts
      puts "               
                            :::!~!!!!!:.
                      .xUHWH!! !!?M88WHX:.
                    .X*#M@$!!  !X!M$$$$$$WWx:.
                  :!!!!!!?H! :!$!$$$$$$$$$$8X:
                 !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
                :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
                  ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
                    !:~~~ .:!MXX#$$$$WX??#MRRMMM!
                    ~?WuxiW*`   `XX$$$$8!!!!??!!!
                  :X- M$$$$       `XXX$T~!8$WUXU~
                :%`  ~#$$$m:        ~!~ ?$$$$$$
              :!`.-   ~T$$$$8xx.  .xWW- ~""##*X
    .....   -~~X<` !    ~?T#$$@@W@*?$$      /`
    W$@@M!!! .!~~ !!     XXXUW$W!~ `X~:    :
    XX~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
    :::~:!!`:X~ .: ?H.!u x$$$B$$$!W:U!T$$M~
    .~~   :X@!.-~   ?@$$$$(x*$$$W$TH$! `
    Wi.~!X$?!-~    : ?$$$B$W **** RM!
    $R@i.~~ !     :   ~$$$$$B$$en:``
    ?MXT@Wx.~    :     ~xxx*$$$$M"
    puts
    puts
    puts
    puts "Boh, t'as essayé au moins..."
    end
  end

end