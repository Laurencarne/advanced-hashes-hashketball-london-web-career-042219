require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
          "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
          "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end
      ##########################
def num_points_scored(player_name) #CORRECT#
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:points]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name][:points]
  else
    "This player can't be found!"
  end
end
      ##########################
def shoe_size(player_name) #CORRECT#
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name][:shoe]
  else
    "This player can't be found!"
  end
end
      ##########################
def team_colors(team_name) #CORRECT#
  if game_hash[:home][:team_name].include?(team_name)
    game_hash[:home][:colors]
  else game_hash[:away][:team_name].include?(team_name)
    game_hash[:away][:colors]
  end
end
      ##########################
def team_names #CORRECT#
team_names = []
  home = game_hash[:home][:team_name]
  away = game_hash[:away][:team_name]
  team_names.push(home, away)
end
    ##########################
def player_numbers team #CORRECT#
  stats = []
  game_hash.each do |key, value|
    if value[:team_name] == team
        value[:players].each do |inner_key, inner_value|
     stats << inner_value[:number]
      end
    end
  end
  stats
end
    ##########################
def player_stats(player_name)
    if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name]
  end
end
    ##########################
def big_shoe_rebounds
  player_with_big_feet = ""
  biggest_shoe = 0

  game_hash[:home][:players].each do |player_name, value|
    if value[:shoe] > biggest_shoe
      biggest_shoe = value[:shoe]
      player_with_big_feet = player_name
    end
    game_hash[:home][:players].each do |player_name, value|
      if value[:shoe] > biggest_shoe
        biggest_shoe = value[:shoe]
        player_with_big_feet = player_name
      end
    end
  end
  if game_hash[:home][:players].include?(player_with_big_feet)
    game_hash[:home][:players][player_with_big_feet][:rebounds]
  elsif game_hash[:away][:players].include?(player_with_big_feet)
    game_hash[:away][:players][player_with_big_feet][:rebounds]
  end
end
########################
########BONUS###########
########################

def most_points_scored
  players_name = ""
  players_score = 0

  game_hash[:home][:players].each do |player_name, value|
    if value[:points] > players_score
      players_score = value[:points]
      players_name = player_name
    end
    game_hash[:away][:players].each do |player_name, value|
      if value[:points] > players_score
        players_score = value[:points]
        players_name = player_name
      end
    end
  end
  players_name
end

def winning_team
  home_team = []
  away_team = []
  home_team_total = 0
  away_team_total = 0

  game_hash[:home][:players].each do |player_name, value|
    home_team << value[:points]
  end
  game_hash[:away][:players].each do |player_name, value|
    away_team << value[:points]
  end
  away_team.each {|n| away_team_total +=n}
  home_team.each {|n| home_team_total +=n}
  if home_team_total > away_team_total
    game_hash[:home].key
  else
    game_hash[:away].key
end
end

def player_with_longest_name
end

def long_name_steals_a_ton
end

#############################
#############################
########THE ANSWERS##########
#############################
#############################
=begin
def num_points_scored(name)
  player = find_the_player(name)
  player.fetch(:points)
end

def shoe_size(name)
  player = find_the_player(name)
  player.fetch(:shoe)
end

def team_colors(team_name)
  team = find_the_team(team_name)
  team.fetch(:colors)
end

def team_names
  teams.map{|t| t.fetch(:team_name)}
end

def player_numbers(team_name)
  find_the_team(team_name)[:players].map{ |player_name, stats| stats[:number] }
end

def player_stats(player_name)
  find_the_player(player_name)
end

def big_shoe_rebounds
  player_biggest_shoe_size.fetch(:rebounds)
end

def teams
  game_hash.values
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_the_team(team_name)
  teams.find {|team| team.fetch(:team_name) == team_name}
end

def find_the_player(name)
  players.fetch(name)
end

def player_biggest_shoe_size
  players.max_by{|player, stats| stats.fetch(:shoe)}[1]
  binding.pry
end
=end
