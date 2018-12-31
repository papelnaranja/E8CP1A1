
# Se tiene un archivo con diversos productos, donde la primera columna indica el nombre del producto y el resto de las columnas muestra el stock en distintas tiendas.

# Producto1, 10, 15, 21
# Producto2, 20, 0, 3
# Producto3, 4, 8, 0
# Producto8, 1, 2, NR
# Producto12, NR, 2, NR
# Donde NR significa no registrado.

# Se pide:

# Crear un menú con 5 opciones, se debe validar que la opción escogida sea 1, 2, 3, 4, 5 o 6.

# La opción 1 permite conocer la cantidad de productos existentes. Al seleccionar esta opción, se mostrará un submenú que permitirá:

# a) Mostrar la existencia por productos. ( suma de las cantidades del producto)
# b) Mostrar la existencia total por tienda. ( suma de las tiendas )
# c) Mostrar la existencia total en todas las tiendas. ( sumar todos )
# d) Volver al menú principal.
# Hint: Se debe validar que la opción ingresada sea válida.

# La opción 2 permite que el usuario ingrese el nombre de un producto y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto.

# La opción 3 muestra los productos no registrados en cada bodega.

# La opción 4 permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.

# La opción 5 permite registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append).

# Si el usuario ingresa la opción 6 el programa sale, si ingresa cualquier otra opción se debe mostrar que la opción es inválida, y mostrar el menú nuevamente y la opción de elegir.


file = File.open('productos.txt', 'r')
products = file.readlines.map(&:chomp)
file.close


products_arrays = products.map do |lines|
 lines.split(', ').to_a
end


def do_hash(array)
    product_hash = {}
    product_hash[:name] = array.shift
    product_hash[:shops] = array
    return product_hash
end

def create_epic_array_of_hashes(products_arrays)
    epic_array = []
    products_arrays.each do |product_info|
        epic_array << do_hash(product_info)
    end
    return epic_array
end

the_array_of_hashes = create_epic_array_of_hashes(products_arrays)


def sum_products_stock(the_array_of_hashes)
    the_array_of_hashes.each do |product|
        products = product[:shops].map {|num| num.to_i}
        puts "El #{product[:name]} tiene: #{products.sum} "
    end
end

def sum_shops_products(the_array_of_hashes)
    puts "Colocar número de tiendas totales"
    number_of_shops = gets.chomp.to_i
    a = 0
    while a != number_of_shops 
        array_shop = []
        the_array_of_hashes.each do |shops|
            array_shop << shops[:shops][a].to_i
        end
        #p array_shop
        suma = array_shop.sum.to_i
        puts "La tienda #{a + 1} tiene: #{suma} elementos"
        a += 1
    end
end

def sum_all_products(the_array_of_hashes)
    all = []
    the_array_of_hashes.each do |product|
        a = []
        product[:shops].each do |num|
            a << num.to_i
        end
       
        all << a.sum
    end
    #p all
    puts "En total hay #{all.sum} elementos"
end
#sum_all_products(the_array_of_hashes)

def search_products_stock(the_array_of_hashes)
    puts "Ingresar nombre de producto"
    product_name = gets.chomp.to_s
    select_product = nil
    position = nil
    new_array = nil
    the_array_of_hashes.each_with_index do |hash, index|
        select_product = hash.select {|key, value| value == product_name} 
        if !select_product.empty?
            position = index
            new_array = hash[:shops].map {|i| i.to_i}
        end
    end
    puts "El producto #{product_name} tiene: #{new_array.sum}"
    
end
# Encontrar los productos no registradis en cada bodega
# ProductoX no tiene stock en la tienda Z
def nr_for_shops(the_array_of_hashes)
    the_array_of_hashes.each do |hash_info|
        hash_info[:shops].each_with_index do |value, index|
            puts "#{hash_info[:name]}, tiene stock no registrado en la bodega #{index}" if value == "NR"
        end
    end
end

# Estos productos tienen un cantidad igual o menor a x
def cantidad_menor(the_array_of_hashes)
    puts "Cantidad a consultar"
    num = gets.chomp.to_i
    the_array_of_hashes.each do |hash|
        hash[:shops].each_with_index do |stock, index|
            if stock.to_i <= num
                 puts "El #{hash[:name]} tiene: #{stock} en la tienda/bodega #{index}"
            end
        end
    end
end

def add_new_product
    puts "Añadir un nuevo producto"
    puts "usar el siguiente formato ej: 'Producto10, 20, 40, 50'"
    content = gets.chomp
    file = File.open('productos.txt', 'a')
    file.puts content.split("\n")
    file.close
end

def program_init()
    puts "Programa de productos"
    puts "Ingrese un número del 1 al 6 para seleccionar su acción"
    puts "1. Productos existentes"
    puts "2. Conocer cantidad de Stock de un producto"
    puts "3. Conocer los productos no registrados por tienda"
    puts "4. permite conocer los productos con una existencia total menor a un valor ingresado por el usuario"
    puts "5. permite registrar un nuevo producto con su respectivo stock en cada bodega."
    puts "6. salir"
end

def submenu_init()
    puts "a) Mostrar la existencia por productos. ( suma de las cantidades del producto)"
    puts "b) Mostrar la existencia total por tienda. ( suma de las tiendas )"
    puts "c) Mostrar la existencia total en todas las tiendas. ( sumar todos )"
    puts "d) Volver al menú principal."
end

option = 0
while option != 6
    program_init()
    option = gets.chomp.to_i
    case option
        when 1
            submenu_option = 0
            submenu_init()
            while submenu_option != 'd'
                submenu_option = gets.chomp.to_s
                case submenu_option
                    when 'a'
                       sum_products_stock(the_array_of_hashes)
                    when 'b'
                        sum_shops_products(the_array_of_hashes)
                    when 'c'
                        sum_all_products(the_array_of_hashes)
                    when 'd'
                        puts 'volver al menu principal'
                    else
                        puts "Opcion invalida, sigues en el submenu"
                end
            end
        when 2
            search_products_stock(the_array_of_hashes)
        when 3
            nr_for_shops(the_array_of_hashes)
        when 4
            cantidad_menor(the_array_of_hashes)
        when 5
            add_new_product()
        when 6
            puts "Saliendo..."
        else
            puts "Opción invalida!"
    end
end
