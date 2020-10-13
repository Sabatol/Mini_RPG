require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
def orchestra
  #def welcome 
  puts
  puts "Bienvenue dans le mini jeu POO !"
  puts "Put the castle here"
  #def player_initialize
  puts
  puts "Quel est ton nom, voyageur ?"
  puts
  print "Ton nom > "
  player_name = gets.chomp
  @user = HumanPlayer.new(player_name)
  puts
  #end
  #def monsters_initialize
  puts "Le nom des monstres ?!"
  tempo = gets.chomp
  puts
  puts "..."
  tempo = gets.chomp
  
  puts
  enemies_name = ["Florian", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
  #player1 = Player.new(enemies_name[0])
  #player2 = Player.new(enemies_name[1])
  #enemies = [player1, player2]
  @enemies = enemies_name.sample(2).map!{|enemi_name| Player.new(enemi_name)}
  puts "Ouais bah non, ça sera #{@enemies[0].name} et #{@enemies[1].name}."
  puts
  print @enemies[0].show_state 
  puts @enemies[1].show_state
  #end
  puts 
  puts "##############PRESS ENTER TO CONTINUE###################"
  suspens = gets.chomp
  #def fight
  while @user.life_points > 0 && (@enemies[0].life_points > 0 || @enemies[1].life_points > 0)
    puts
    puts @user.show_state
    puts
    puts "..."
    puts
    tempo = gets.chomp 
    puts "Tu veux faire quoi maintenant ?"
    puts
    puts "a - chercher une meilleure arme"
    puts
    puts "s - chercher à se soigner" 
    puts
    puts "attaquer un joueur en vue :"
    puts

    if @enemies[0].life_points != 0
    print "0 - " 
    puts @enemies[0].show_state
    end

    if @enemies[1].life_points != 0
    print "1 - " 
    puts @enemies[1].show_state
    end

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
  puts "...Allez... C'est vrai qu'il est beau mais clique maintenant."
  suspens = gets.chomp
    case action
    when "a"
      @user.search_weapon
    when "s"
      @user.search_health_pack
    when "0"
      @user.attacks(@enemies[0])
    when "1"
      @user.attacks(@enemies[1])
    else 
      puts "Aïe aïe aïe... Il fallait écrire 'a', 's', '0' ou '1' !" 
      puts "Tant pis pour toi, tu perds un tour à te faire marrave gratos !"
    end
    puts
    puts
    puts "##############PRESS ENTER TO CONTINUE###################"
    suspens = gets.chomp
    if @enemies[0].life_points > 0 || @enemies[1].life_points > 0
    puts
    puts "Les autres joueurs t'attaquent !" 
    @enemies.each {|enemi| enemi.life_points != 0 ? enemi.attacks(@user) : enemi}
    puts    
    puts
    puts "##############PRESS ENTER TO CONTINUE###################"
    suspens = gets.chomp
    end
  end
  puts "--------------------------------------"
  puts "La partie est TERMINEE !"
  puts "--------------------------------------"
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
    puts "|==========================GAME OVER============================|"
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
orchestra