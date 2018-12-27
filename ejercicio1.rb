## Ejercicio 1: Escribiendo un archivo básico

# - Crear un método que reciba dos strings, este método creará un archivo index.html y pondrá como párrafo cada uno de los strings recibidos.
# - Crear un método similar al anterior, que además pueda recibir un arreglo. Si el arreglo no está vacío, agregar debajo de los párrafos una lista ordenada con cada uno de los elementos.
# - Crear un tercer método que además pueda recibir un color. Agregar color de fondo a los párrafos.
# - El retorno de los métodos debe devolver nil.


def do_par(string1, string2)
    p1 = "<p>#{string1}</p>"
    p2 = "<p>#{string2}</p>"
    file = File.open('index.html', 'a')
    file.puts p1
    file.puts p2
    file.close
    return nil
end

def do_ol(string1, string2, array)
    p1 = "<p>#{string1}</p>"
    p2 = "<p>#{string2}</p>"
    if array != nil
        ol_start = "<ol>"
        list = array.map do |value|
            "   <li>#{value}</li>"
        end
        ol_end = "</ol>"
    end
    file = File.open('index.html', 'a')
    file.puts p1
    file.puts p2
    file.puts ol_start
    file.puts list
    file.puts ol_end
    file.close
    return nil
end

def do_with_color(str1, str2, array, color)
    p1 = "<p style='background-color:#{color}'>#{str1}</p>"
    p2 = "<p style='background-color:#{color}'>#{str2}</p>"
    if array != nil
        ol_start = "<ol>"
        list = array.map do |value|
            "   <li>#{value}</li>"
        end
        ol_end = "</ol>"
    end
    file = File.open('index.html', 'a')
    file.puts p1
    file.puts p2
    file.puts ol_start
    file.puts list
    file.puts ol_end
    file.close
    return nil
end


new_array = ['foo', 'bar', 'pepe']

#do_par('hola', 'chao')
#do_ol('str', 'str2', new_array)
do_with_color('str', 'str2', new_array, '#f4f4f4')
