class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{life_points} points de vie !"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "#{name} a perdu tous ses PV ! #{name} lâche 20 bitcoins en s'effondrant et se fait absorber par le sol pour rejoindre les entrailles de la Terre..."
    end
  end

  def attacks(foe)
    puts "#{name} s'en prend violemment à #{foe.name} ! Ça va barder !"
    damage_dealt = compute_damage
    foe.gets_damage(damage_dealt)
    puts "#{name} inflige #{damage_dealt} points de dégâts !"
    if damage_dealt >= 4
      puts "Quel coup de bg ! #{foe.name} s'en est pris plein la gueule ! "
    elsif damage_dealt == 0
      puts "#{foe.name} évite le coup ! Quelle classe !"           
    elsif damage_dealt <= 2
      puts "C'est à peine si ça lui fait mal..."
    else
      puts "Ça fait mal putain !!"    
    end
  end

  def compute_damage
    return rand(0..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @lifepoints=100
    @weapon_level =1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level} !"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    random_weapon = rand(1..6)
    puts "TULULU TULULU TULULU TULULU TULULU... TADADADA ! Tu as trouver une arme #{random_weapon}!"
    if random_weapon > @weapon_level
      puts "Hé, franchement, elle est carrément meilleure que celle que tu as actuellement, alors hop embarques la !"
    else
      puts "Franchement, pas ouf du tout le truc, ça peut faire un bon gratte-dos par exemple..."
    end
  end

  def search_health_pack
    random_health = rand(1..6)
    if random_health == 1
      puts "Failed, tu n'as rien trouvé..."
    elsif random_health > 1 && random_health < 6
      self.lifepoints += 50
      self.lifepoints = 100 if self.lifepoints > 100
      puts "Pas mal, tu as trouvé un pack de +50 points de vie !"
    else
      self.lifepoints += 80
      self.lifepoints = 100 if self.lifepoints > 100
      puts "Bg, tu as trouvé un pack de +80 points de vie !"
    end
  end  

end
