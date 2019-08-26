# Write your code here!
require "pry"

def game_hash
  {
    home: 
      { team_name: "Brooklyn Nets",
        colors: ["Black", "White"],
        players: [
          { name: "Alan Anderson",
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1 },
          { name: "Reggie Evans",
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7 },
          { name: "Brook Lopez",
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15 },
          { name: "Mason Plumlee",
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5 },
          { name: "Jason Terry",
            number: 31,
            shoe: 15,
            points: 19,
            rebounds: 2,
            assists: 2,
            steals: 4,
            blocks: 11,
            slam_dunks: 1 }
        ] },
    
    away: 
    { team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        
        { name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        
        { name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        
        { name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        
        { name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
      ] }
  }
end

def num_points_scored(player_name)
  # 1) Get list of all players 
  # 2) Iterate trough list of all players 
  # 3) Return points of all players from step 2 
  
  
end 

def get_all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  return home_players + away_players
end 

def enumerate_get_all_players
  
end 

def shoe_size(player_name)
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      return player_hash[:shoe] if player_hash[:name] == player_name
    end 
  end   
end 

def team_colors(needed_team_name)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == needed_team_name
  end 
end 

def team_names
  array = []
  game_hash.each do |location, team_data|
    array << team_data[:team_name]
  end
  array 
end 

def player_numbers(acquired_team_name)
  array = []
  
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      if team_data[:team_name] == acquired_team_name
        array << player_hash[:number] 
      end 
    end 
  end 
  array 
end 

def player_stats(player_name)
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      return player_hash.reject{|name| name == :name} if player_hash[:name] == player_name
    end 
  end 
end   

def big_shoe_rebounds 
  largest_shoe = 0  
  rebounds = 0
  
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:shoe] > largest_shoe
        largest_shoe = player_hash[:shoe]
        rebounds = player_hash[:rebounds]
      end 
    end 
  end 
  rebounds
end   

def most_points_scored
  most_points = 0 
  most_points_player = nil 
  
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:points] > most_points
        most_points = player_hash[:points]
        most_points_player = player_hash[:name]
      end 
    end 
  end 
  most_points_player
end 

def winning_team
  output_hash = {}
  
  game_hash.values.each do |team_data|
    points_scored = 0 
    team_data[:players].each do |player_hash|
      points_scored += player_hash[:points]
    end 
    output_hash[team_data[:team_name]] = points_scored
  end 
  output_hash.key(output_hash.values.max)
end   
  
def player_with_longest_name
  array = []
  
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      array << player_hash[:name]
    end 
  end 
  array.max_by {|name| name.length}
end 

def long_name_steals_a_ton? 
  max_steals = 0 
  max_steals_player = nil 
  
  game_hash.values.each do |team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:steals] > max_steals
        max_steals_player = player_hash[:name]
        max_steals = player_hash[:steals]
      end 
    end 
  end 
  return true if max_steals_player == player_with_longest_name
end 

binding.pry