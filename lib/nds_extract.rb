$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end


def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  list_of_directors = []
  director_index = 0 
  while director_index < source.size do 
    list_of_directors.push(source[director_index][:name])
    director_index += 1 
  end
  list_of_directors
end


def total_gross(source)
  list_of_directors = list_of_directors(source)
  total_gross = 0 
  index = 0 
  while index < list_of_directors.length do 
    name = list_of_directors[index]
    directors_totals = directors_totals(source)
    total_gross += directors_totals[name]
    index += 1 
  end
  total_gross
end


