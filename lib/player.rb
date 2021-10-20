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