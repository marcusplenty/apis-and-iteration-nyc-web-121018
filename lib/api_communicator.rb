require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_apis = nil 
  response_hash.each do |k1, v1|
    if k1 == "results"
      v1.each_with_index do |hash,i|
        hash.each do |k2,v2|
          if v2 == character_name
            film_apis = response_hash[k1][i]["films"]
          end
        end 
      end 
    end 
  end
  final_list = film_apis.map do |url|
    unparsed = RestClient.get(url)
    JSON.parse(unparsed)
  end 
  final_list
  
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  titles = films.map{|film| film["title"]}
  print titles
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
