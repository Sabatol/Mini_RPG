
require_relative 'player'

class Game < HumanPlayer
  attr_accessor :human_player, :enemies_in_sight, :player_left
  # Initialise une partie avec un nom, va chercher 4 ennemis aléatoires parmi la liste
  def initialize(name)
    @name = name
    enemies_name = ["Florian", "Laurox dorée", "Cyprien", "Romain", "Nico", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
    $enemies_in_sight = enemies_name.sample(4).map!{|enemi_name| Player.new(enemi_name)}
    @user = HumanPlayer.new(name)
    @player_left = 10
  end
  # Supprime un bot de la liste des ennemis si ses HP sont à 0 ou moins
  def try_to_kill(player)
    if player.life_points <= 0
      $enemies_in_sight.delete(player)
    end
  end
  # Le jeu continue ? Booléen
  def is_still_ongoing?
    if $enemies_in_sight.count != 0 && @user.life_points > 0 #ou @enemies != nill ?
      return true
    else 
      return false
    end
  end

  # Rajoute des ennemis en vue 
  def new_players_in_sight
    if $enemies_in_sight.count >= @player_left
      puts "Tous les joueurs sont déjà en vue !"
    else
    yolo = rand(1..6)
      if yolo == 1
        puts "Ouf ! Personne de plus à l'horizon..."
        puts
      elsif yolo < 5
        guest = Player.new("Invité #{rand(1..999)}")
        $enemies_in_sight << guest
        @player_left -= 1
        puts "Un invité s'est joint à la partie..."
        puts
      else 
        guest = Player.new("Invité #{rand(1..999)}")
        guest2 = Player.new("Invité #{rand(1..999)}")
        $enemies_in_sight << guest
        $enemies_in_sight << guest2
        @player_left -= 2
        puts "Eeeet deux nouveaux invités entre dans la danse !"
        puts
      end
    end
  end

  # Affiche l'état du joueur et le nombre de bot restants
  def show_players
    puts @user.show_state
    puts "Il reste #{$enemies_in_sight.count} ennemis"
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
      $enemies_in_sight.each do |enemi|
        if enemi.life_points != 0
          print "#{$enemies_in_sight.index(enemi)} - " 
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
      

    if action == "a"
      @user.search_weapon
    elsif action == "s"
      @user.search_health_pack    
    #elsif action.class == Integer  
    else  
      @user.attacks($enemies_in_sight[action.to_i])
      try_to_kill($enemies_in_sight[action.to_i])
   
    #puts "Tant pis pour toi, fais attention à ce que tu écris parce que là, tu perds un tour à te faire marrave gratos !"
    end
  end

  def enemies_attack
    unless $enemies_in_sight.count == 0
    puts "Les autres joueurs t'attaquent !" 
    $enemies_in_sight.each {|enemi| enemi.life_points != 0 ? enemi.attacks(@user) : enemi}
    end
  end
  # FIIIIIIIN DU JEEEEEEEU
  def end
    puts
    puts "--------------------------------------------------------"
    puts "              La partie est TERMINEE !"
    puts "--------------------------------------------------------"
    puts
    puts "###############PRESS ENTER TO CONTINUE##################"
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
    puts
    puts
    puts "|==========================GAME OVER===========================|"
    end
  end

end