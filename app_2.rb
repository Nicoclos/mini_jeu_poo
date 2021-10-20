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
ennemis = [ Player.new("Josiane_du_95"), Player.new("José_le_toulousain")]

#Combat
while user.life_points >0 && (ennemis[0].life_points > 0 || ennemis[1].life_points >0)
  puts "Voici l'état de chaque joueur:"
  puts user.show_state
end

#Ending
if humain.lifepoints > 0
  puts "Tu portes bien ton nom ! Allez, trace ta route et conquiert le monde ! Bravo à toi !"
else
  puts "C'était vraiment pathétique, retourne t'entraîner au lieu de me faire perdre mon temps là !"  
end