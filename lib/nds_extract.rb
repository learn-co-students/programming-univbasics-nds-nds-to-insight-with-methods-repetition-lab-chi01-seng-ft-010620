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
  index = 0
  directors = []
  while index < source.length
    directors << source[index][:name]
    index += 1
  end
  directors
end

def total_gross(source)
  # result = directors_totals(source)
  # grand_total = result["Stephen Spielberg"] + result["Russo Brothers"] + result["James Cameron"] + result["Spike Lee"] + result["Wachowski Siblings"] + result["Robert Zemeckis"] + result["Quentin Tarantino"] + result["Martin Scorsese"] + result["Francis Ford Coppola"]
  # grand_total
  dir_to_earnings_hash = directors_totals(source)
  dir_names = list_of_directors(source)
    i = 0

    total = 0

    while i < dir_names.length do
      dir_name = dir_names[i]
      total += dir_to_earnings_hash[dir_name]
      i += 1
    end

 total
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
end
