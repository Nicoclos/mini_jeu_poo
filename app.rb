require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def player_uno
    player1 = Player.new("Josiane")
end

def player_dos
    player2 = Player.new("José")    
end

def healthy
    puts "Voici l'état de forme de nos combattants du jour :"
    puts player_uno.show_state
    puts player_dos.show_state
end

def announce
    puts "QUE LA BASTON COMMENCE ! ON VEUT DU SANG PUTAIN !"
end

def fight
    player_uno.attacks(player_dos)
    player_dos.attacks(player_uno)
end
binding.pry

