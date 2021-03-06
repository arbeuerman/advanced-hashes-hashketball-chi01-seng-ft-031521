require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(input_player)
  game_stats = game_hash
  points_scored = 0  
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name] == input_player
        points_scored = player_stats[:points]  
      end 
    end 
  end 
  points_scored
end 
 
def shoe_size(input_player)
  game_stats = game_hash
  player_shoe_size = 0  
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name] == input_player
        player_shoe_size = player_stats[:shoe]  
      end 
    end 
  end 
  player_shoe_size
end 
 
def team_colors(team_name) 
  game_stats = game_hash
  team_color = 0  
  game_stats.each do |side, data|
    if data[:team_name] == team_name
      team_color = data[:colors]  
    end 
  end 
  team_color  
end 
 
def team_names 
  game_stats = game_hash
  names = []
  game_stats.each do |side, data|
    names << data[:team_name]
  end 
  names 
end 
 
def player_numbers(team_name)
  game_stats = game_hash
  jersey_numbers = []
  game_stats.each do |side, data|
    if data[:team_name] == team_name
      data[:players].each do |player_stats|
        jersey_numbers << player_stats[:number]
      end 
    end 
  end
  jersey_numbers
end 

def player_stats(player_name)
  game_stats = game_hash
  player_info = {}
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        player_info = player_stats  
      end 
    end 
  end 
  pp player_info
end 

def get_largest_shoe_player(game_stats)
  shoe_size = -1
  player = ""
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:shoe] > shoe_size
        shoe_size = player_stats[:shoe]
        player = player_stats[:player_name]
      end 
    end 
  end
  player 
end 

def get_largest_data_point_helper(game_stats, value_to_find)
  start_value = -1
  player = ""
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[value_to_find] > start_value
        start_value = player_stats[value_to_find]
        player = player_stats[:player_name]
      end 
    end 
  end
  player
end 

def big_shoe_rebounds
  game_stats = game_hash  
  player = get_largest_data_point_helper(game_stats, :shoe)
  puts player #for debugging/verifying 
  rebounds = 0 
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name] == player 
        rebounds = player_stats[:rebounds]
      end 
    end 
  end
  rebounds  
end 

#bonus methods (one is above, the get_largest_data_point_helper)
def most_points_scored
  game_stats = game_hash  
  player = get_largest_data_point_helper(game_stats, :points)
  puts player #for debugging/verifying 
  points_scored = 0 
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name] == player 
        points_scored = player_stats[:points]
      end 
    end 
  end
  points_scored
end 

def get_total_points
  game_stats = game_hash
  team_scores = {}
  game_stats.each do |side, data|
    points_scored = 0 
    data[:players].each do |player_stats|
      points_scored += player_stats[:points]
    end
    team_scores[data[:team_name]] = points_scored
  end
  team_scores
end 

def winning_team
  max_score = 0 
  winner = ""
  #add total points for each team 
  team_scores = get_total_points
  #return the team name with the most points 
  team_scores.each do |name, score|
    if score > max_score  
      max_score = score 
      winner = name 
    end 
  end
  winner
end 

def player_with_longest_name
  game_stats = game_hash
  max_name_length = -1
  player = ""
  game_stats.each do |side, data|
    data[:players].each do |player_stats|
      if player_stats[:player_name].length > max_name_length
        max_name_length = player_stats[:player_name].length 
        player = player_stats[:player_name]
      end 
    end 
  end
  player
end 

def longest_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = get_largest_data_point_helper(game_hash, :steals)
  does_longest_name_steal_most = false 
  if longest_name == most_steals
    does_longest_name_steal_most = true 
  end 
  does_longest_name_steal_most
end 

puts longest_name_steals_a_ton?

