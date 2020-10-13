require 'pry'

class Player
  attr_accessor :name, :life_points

  # On créer des nouveaux joueurs ici, et on leur attribue un nom et des points de vie !
  def initialize(name)
    @name = name
    @life_points = 10
  end

  # Montre l'état d'un joueur
  def show_state
    puts "#{name} a #{@life_points} points de vie."
  end

  # Calcul des dégats. Si PV <= 0, joueur décédé
  def gets_damage(hit)
    @life_points -= hit
    if @life_points <= 0
      puts "HE IS DEAD"
      @life_points = 0
    end
  end

  # Interaction d'attaque entre deux joueurs ! Enlève des pvs à la cible (message personnalisé suivant les dégats)
  def attacks(target)
    puts
    puts "Le joueur #{name} attaque le joueur #{target.name}"
    damage = compute_damage
    if damage > 10
    puts "OULALALAAAA LE ONE SHOT ! Il lui inflige #{damage} points de dommages !"
    target.gets_damage(damage)
    elsif damage > 4
      puts "Très joli coup ! Il lui inflige #{damage} points de dommages !"
      target.gets_damage(damage)
    elsif damage > 2
      puts "Mouais... Il lui inflige #{damage} points de dommages."
      target.gets_damage(damage)
    else 
      puts "Le coup est trèèès léger. Il lui inflige #{damage} points de dommages."
      target.gets_damage(damage)
    end
  end

  # Méthode pour calculer les dégats (ici, aléatoire entre 1 et 6)
  def compute_damage
    return rand(1..6)
  end 

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{@life_points} points de vie et tient une arme de niveau #{@weapon_level}."
  end    
  
  # Applique un coefficient sur la plage de dégats
  def compute_damage
    rand(1..6) * @weapon_level
  end

  # Méthode pour trouver une arme (= coefficient pour compute_damage)
  def search_weapon
    new_weapon_lvl = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_lvl} !"
    if new_weapon_lvl > @weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle... PRENDS LA !" 
      @weapon_level = new_weapon_lvl
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # Cherche un médipack (peut crit si rand = 6 et échouer si rand = 1)
  def search_health_pack
    try_find_health = rand(1..6) 
    case try_find_health
    when 1
      puts "Tu n'as rien trouvé... "
    when 2..5
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 100
        @life_points = 100
      end
    else
      @life_points += 80
      puts "Waooooow ! Tu as trouvé un pack de +80 points de vie !"
      if @life_points > 100
        @life_points = 100
      end 
    end
  end

end
