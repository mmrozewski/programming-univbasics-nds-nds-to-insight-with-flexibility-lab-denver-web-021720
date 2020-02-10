# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  result = []
  index = 0 
  
  while index < movies_collection.length do
    result << movie_with_director_name(name, movies_collection[index])
    index += 1 
  end
  
  result
  
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
result = {}
studio_array = []
gross_array = []
index = 0
index_two = 1
  
  while index < collection.length do
    studio_array << collection[index][:studio]
    gross_array << collection[index][:worldwide_gross]
    index += 1
  end 
  
  index = 0
  
  while index < studio_array.length do
    while index_two < studio_array.length do
      if studio_array[index] == studio_array[index_two]
        gross_array[index] += gross_array.delete_at(index_two)
        studio_array[index] = studio_array.delete_at(index_two)
      end 
      index_two += 1 
    end
    index += 1
  end
  
  index = 0 
  
  while index < studio_array.length do 
    result[studio_array[index]] = gross_array[index]
    index += 1
  end 
        
  result
end

def movies_with_directors_set(source)
  index = 0
  result = []
  while index < source.length do
    result << movies_with_director_key(source[index][:name], source[index][:movies])
    index += 1
  end
  
  result

    
    
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
