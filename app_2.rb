require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Accueil
puts ("-"*49)
puts("|Bienvenue sur 'ILS VEULENT TOUS MA POO !        |")
puts ("|Le but du jeau est d'être le dernier survivant !|")
puts ("-"*49)

#Initialisation joueur
puts ("Comment dois-je t'appeler ?")
pseudo = gets.chomp
user = HumanPlayer.new(pseudo)

#Initialisation ennemis
enemies = [ Player.new("Josiane_du_95"), Player.new("José_le_toulousain")]

#Combat
while user.life_points >0 && (enemies[0].life_points > 0 || enemies[1].life_points >0)
  puts "Voici l'état de chaque joueur :"
  puts user.show_state
  gets.chomp
  puts ""
  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts ""
  print "0 - "
  print "#{enemies[0].show_state}"
  print "1 - "
  print "#{enemies[1].show_state}"
  choice = gets.chomp
    
  case choice
    when "a"
      user.search_weapon
    when "s"
      user.search_health_pack
    when "0"
      enemies[0].life_points -= user.compute_damage
      enemies[0].show_state
    when  "1"
      enemies[1].life_points -= user.compute_damage
      enemies[1].show_state
  end

  gets.chomp

  if enemies[0].life_points > 0 || enemies[1].life_points > 0
    puts "Les autres joueurs t'attaquent !"
    enemies.each do |player|
      if player.life_points > 0
       player.attacks(user)
      end
    end
  end
end

#Ending
if user.life_points > 0
  puts "Tu portes bien ton nom ! Allez, trace ta route et conquiert le monde ! Bravo à toi !"
else
  puts "C'était vraiment pathétique, retourne t'entraîner au lieu de me faire perdre mon temps là !"  
end

# binding.pry