
## Ejercicio 3: Contando palabras

# - Crear un método que reciba el archivo peliculas.txt, lo abra y cuente la cantidad total de palabras. El método debe devolver este valor.
# - Crear un método similar para que además reciba -como argumento- un *string*. En este caso el método debe contar únicamente las apariciones de ese *string* en el archivo.

def cont_word(super_file)
    file = File.open(super_file, 'r')
    data = file.readlines.map(&:chomp)
    file.close 

    globar_array = []
    all_words = data.each do |line|
        globar_array << line.split(' ')
    end
    p globar_array.flatten.length
end

def search_word(super_file, word_to_search)
    file = File.open(super_file, 'r')
    data = file.readlines.map(&:chomp)
    file.close 
    all_words = data.each do |str|
        words = str.split(' ')
    end
    array_of_search = all_words.select{|w| w = word_to_search }
    puts array_of_search.length

end
cont_word('peliculas.txt')
search_word('peliculas.txt', 'Episodio')