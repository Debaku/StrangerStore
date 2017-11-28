#CARRRIIIITOOOOO DEEEEE COOOOMPRAAAAAAS


puts "Carrito de Compras"
  #Menu principal
def menuPrincipal()

puts "----Menú Principal----"
puts "---1.Realizar venta---"
puts "---2.Reporte ventas---"
puts "---3.Reporte inventario---"
puts "---4.Actualizar inventario---"
puts "---5.Guardar---"
puts "---6.Salir---"
  
  # Esto es para que lea las opciones en el teclado
opc=gets.to_i 
  
return opc

end
  #menu de compra
def menuCompra()

puts "----Menú Compra----"
puts "---1.Buscar producto---"
puts "---2.Eliminar producto---"
puts "---3.Actualizar Producto---"
puts "---4.Ver total---"
puts "---5.Guardar---"
puts "---6.Salir---"
  
  # Esto es para que lea las opciones en el teclado
opc=gets.to_i 
  
return opc

end

  #Variable global
$productos=[] #MODIFIQUEN AQUI PARA Q COMBINE CON SU CODIGO
$ventas=[]
$numVentasAll=0 #para contrlar el numero de ventas


#limpiar pantalla
def cls()
  system ('cls')
  
end

#metodo agregar al carrito

def addCarrito
  carrito=[]  #arreglo para el carrito
  newItem=0 #nos ayuda a lelvar el control de donde vamos ponienddo en el arreglo del carrito
  
  begin
  opcion=menuCompra()
  case opcion 
    when 1
      cls
      pos=buscarProductos
        if pos !=-1
          carrito[newItem]=[]
          carrito[newItem][0]=$productos[pos][0]  #esta es ya conociendo la posicion del arreglo de los productos (bd)
          puts "Producto: #{$productos[pos][1]} Valor: #{$productos[pos][4]}"
          begin
            print "Ingrese cantidad"
            cantidad=gets.to_i
          end while actualizarStockItemCarrito (pos,cantidad) == 0
          carrito[newItem][1]=cantidad
          carrito[newItem][2]=$productos[pos][4]  #segun el ejemplo en la segunda columna del arreglo es la cantidad unitaria
          carrito[newItem][3]=carrito[newItem][1].to_i*carrito[newItem][2].to_i    #aca es el precio total
          newItem+=1
        else 
          puts "No existe"
        end
    when 2
      cls
      verTodasVentasCarrito(carrito)
      print "Ingrese Id Producto:"
      id=gets.to_i
      carrito=borrarItemCarrito(id,carrito)
    when 3
      cls
      verTodasVentasCarrito(carrito)
      print "Ingrese Id Producto:"
      id=gets.to_i
      carrito=actualizarItemCarrito(id,carrito)
      
    when 4
      cls
      verTodasVentasCarrito(carrito)
    when 5
      cls
      guardarVenta(carrito)
    
    
end while opcion >=1 and opcion<6
  
#METODO PARA LEER LA BD O ARCHIVO 
def cargarProductos()
  i=0
  File.open('productos.txt', 'r') do |f1| #primer parametro lo q va a leer, r es para leer  (f1 es el primeer archivo etc etc)
    while linea = f1.gets
    $productos[i]=linea.split (",") #este es un metodo para que cuando ingresen los datos al arreglo los separe por columnas cada que tenga una coma
                                    #pueden borrarla si no les sirve
      i+1
    end
  end
end
  
#metodo para imprimir lo que contiene el arreglo (bd)
def verProductos()
  for i in (0..$productos.size-1) #filas (i)
    for j in (0..$productos[i].size-1) #columnas (j)
      print "{$productos[i][j]} \s"
    end
    print "\n"
  end
end
  
#metodo para buscar lso productos
def buscarProductos()
  puts "Ingrese el id del producto"
  nom=gets.to_i
  pos=-1
  for i in(0..$productos.size-1)
    if ($productos[i][0].to_i)==nom.to_i
      pos=i
    end
  end
  return pos
end
  
#metodo para ver todo lo que compramos del carrito

def verTodasVentasCarrito(ventas)
  
  totalVentas=0
  for i in(0..ventas.size-1)
      totalVentas+=ventas[i][3]
      print "ID: #{ventas[i][0]}  Cantidad: #{ventas[i][1]}  Valor: #{ventas[i][2]}, Valor Total: #{ventas[i][3]} \n"
  end
  print "Total de ventas: #{totalVentas} \n"
end
  
 #metodo para borrar del carrito
 
  def borrarItemCarrito(Id,Carrito)
    pos=-1
    for i in (0..carrito.size-1)
      if carrito[i][0].to_i==id
        pos=i
      end
    end
    if pos !=-1
      carrito.delete_at(pos)  #delete_at lo borra y recorre
    end
    return carrito
  end
  
  
  #metodo para actualizar 
  
  def actualizarItemCarrito (id,carrito)
    pos=-1
    for i in(0..carrito.size-1)
      if carrito [i][0].to_i==id
        print "La cantidad actual es #{carrito[i][1]} ingrese el valor nuevo: "
        carrito[i][1]=gets.to_i
        carrito[i][3]=carrito[i][1].to_i*carrito[i][2].to_i
      end
    end
    return carrito
 end
 
 #metodo para guardar 
  
 def guardarVenta(carrito)
   $ventas[$numVentasAll]=Array.new(carrito)
   $numVentasAll +=1
 end
  
 #metodo para el reporte de ventas
  
 def verTodasVentas()
   totalVentas=0
   for i in(0..$ventas.size-1)
     for j in(0..$ventas[i].size-1)
     end
     totalVentas=totalVentas
   end
   puts "Total Vendido: #{totalVentas}"
 end
 
 #metodo actualizar inventario
  
 def actualizarStockItemCarrito (posicion,cantidad)
   sw=1   #Start With (sw)
   nuevaCantidad=$productos[posicion][5].to_i-cantidad
   if (nuevaCantidad >=0)
     $productos[posicion][5]=nuevaCantidad
   else
     sw=0
     puts "Cantidad fuera de stock"
   end
   return = sw
 end
  
 #metodo actualizar stock producto
  
 def actualizarStockProducto(pos)
   puts "1.Incrementar stock"
   puts "2.Decrementar stock"
   op=gets.to_i   #op es opcion 
   print "Ingrese cantidad: "
   cantidad=gets.to_i
   if op==1
     $productos[posicion][5]=$productos[posicion][5] + cantidad
   else
     valor=$productos[posicion][5] * cantidad
     if valor >=0
       $productos[posicion][5]=$productos[posicion][5] - cantidad
     else
       puts "Debe ingresar una cantidad valida.El stock no puede quedar en negativo"
     end
   end
 end
  
 #metodo guardar ventas
 
 def writeFileVentas()
   File.open('ventas.txt', 'w') do |f2|
     for i in(0..$ventas.size-1)
       for j in(0..$ventas[i].size-1)
         f2 puts "# {$ventas[i][j][0]},# {$ventas[i][j][1]},# {$ventas[i][j][2]},# {$ventas[i][j][3]},# {$ventas[i][j][4]}"
       end
     end
   end
 end
  
 #metodo guardar productos
 
  def writeFileProductos()
   File.open('productos.txt', 'w') do |f2|
     for i in(0..$productos.size-1)
       f2 puts "# {$productos[i][0]},# {$productos[i][1]},# {$productos[i][2]},# {$productos[i][3]},# {$productos[i][4]},# {$productos[i][5]},"
     end
   end
 end
  
#Inicia el programa
cargarProductos

begin
  opcion=menuPrincipal()
  case opcion 
    when 1
      cls
      addCarrito
    when 2
      cls
      verTodasVentas
    when 3
      cls
      verProductos
    when 4
      cls
      verProductos
      pos=buscarProductos
      if pos !=-1
        actualizarStockProducto (pos)
      else 
        puts "No existe el producto"
      end
    when 5
      cls
      puts "opcion 5"   #esta opcion la deben usar para guardar en su base de datos 
                         # les dejo la estructura nada mas por si no les sirve o si sirve para su codigo
      writeFileVentas
      writeFileProductos
    
    
end while opcion >=1 and opcion<6