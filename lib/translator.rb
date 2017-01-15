# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |key, array|
      emoticon_hash["get_meaning"][array[-1]] = key
      emoticon_hash["get_emoticon"][array[0]] = array[-1]
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
    emoticon_hash = load_library(file_path)
    japanese_emoticon = nil
    emoticon_hash.each do |key, hash|
        hash.each do |symbol, value|
            if symbol == emoticon
                japanese_emoticon = value
            end
        end
    end
    if japanese_emoticon
        japanese_emoticon
    else
        "Sorry, that emoticon was not found"
    end
  # code goes here
end

def get_english_meaning(file_path, emoticon)
    emoticon_hash = load_library(file_path)
    if emoticon_hash["get_meaning"][emoticon] == nil
        "Sorry, that emoticon was not found"
    else
        emoticon_hash["get_meaning"][emoticon]
    end
  # code goes here
end