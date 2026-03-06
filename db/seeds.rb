puts "Seeding database..."

# Users (Neocoast team)
users_data = [
  { first_name: "Demian", last_name: "Ardus", nickname: "Dem" },
  { first_name: "Fabián", last_name: "Kremer", nickname: "Fava" },
  { first_name: "Sebastián", last_name: "Melgar", nickname: "Seba" },
  { first_name: "Damián", last_name: "Jackson", nickname: "Chipi" },
  { first_name: "Nicolás", last_name: "Luraschi", nickname: "Lura" },
  { first_name: "Agustín", last_name: "Peluffo", nickname: "Peluffo" },
  { first_name: "Juan Manuel", last_name: "Cámera", nickname: "JM" },
  { first_name: "Lucas", last_name: "Bruzzone", nickname: "Lucas" },
  { first_name: "Lucía", last_name: "Del Arco", nickname: "Lu" },
  { first_name: "Martín", last_name: "Manitto", nickname: "Manitto" },
  { first_name: "Gonzalo", last_name: "Sismondi", nickname: "Sismo" },
  { first_name: "Josefina", last_name: "Suarez", nickname: "Jose" },
  { first_name: "Allison", last_name: "Labadie", nickname: "Alli" },
  { first_name: "Enzo", last_name: "Cozza", nickname: "Enz" },
  { first_name: "Lía", last_name: "Malvárez", nickname: "Li" },
  { first_name: "Sebastián", last_name: "Reolon", nickname: "Sabas" },
  { first_name: "Santiago", last_name: "Hernández", nickname: "Santi" },
  { first_name: "Alexis", last_name: "Friss", nickname: "Alexis" },
  { first_name: "Lorenzo", last_name: "Motta", nickname: "Loren" },
  { first_name: "Federico", last_name: "Dallo", nickname: "Fede" },
  { first_name: "Noel", last_name: "Layerle", nickname: "Noe" },
  { first_name: "Ignacio", last_name: "Gavilanes", nickname: "Nacho" },
  { first_name: "Bernardo", last_name: "Bocking", nickname: "Berni" },
  { first_name: "Antonela", last_name: "Falcón", nickname: "Anto" },
  { first_name: "María José", last_name: "Marra", nickname: "Majo M" },
  { first_name: "Joaquín", last_name: "Asís", nickname: "Joaco" },
  { first_name: "Mathias", last_name: "Sellanes", nickname: "Mathi" },
  { first_name: "Nicolás", last_name: "Barate", nickname: "Nico" },
  { first_name: "Valentina", last_name: "Acuña", nickname: "Vale" },
  { first_name: "Agustina", last_name: "Babic", nickname: "Babi" },
  { first_name: "Candelaria", last_name: "López", nickname: "Cande" },
  { first_name: "Federico", last_name: "Charbonnier", nickname: "Colo" },
  { first_name: "Romina", last_name: "Piria", nickname: "Romi" },
  { first_name: "María Jesús", last_name: "Echeguía", nickname: "Maiu" },
  { first_name: "Stefano", last_name: "Gazzoti", nickname: "Stefano" },
  { first_name: "Federica", last_name: "Mancebo", nickname: "Fefa" },
  { first_name: "Milena", last_name: "Gimenez", nickname: "Mile" },
  { first_name: "Gastón", last_name: "Cabana", nickname: "Gas" },
  { first_name: "Francisca", last_name: "Rivas", nickname: "Chita" },
  { first_name: "Felipe", last_name: "Lussich", nickname: "Pipe" },
  { first_name: "Alexandra", last_name: "McCulloch", nickname: "Ale" },
  { first_name: "María José", last_name: "Lorenzoni", nickname: "Majo L" },
  { first_name: "Sofía", last_name: "Symonds", nickname: "Sofi" },
  { first_name: "Agustina", last_name: "Suburú", nickname: "Agus" },
  { first_name: "Viviana", last_name: "Wald", nickname: "Vivi" },
  { first_name: "Isabel", last_name: "Muñoz", nickname: "Isa" },
  { first_name: "Victoria", last_name: "Pizzorno", nickname: "Vicky" },
  { first_name: "Gonzalo", last_name: "Fontes", nickname: "Gonza" },
  { first_name: "Claudio", last_name: "Russi", nickname: "Claudio" },
  { first_name: "Belén", last_name: "Castro", nickname: "Belu" },
  { first_name: "Facundo", last_name: "Barla", nickname: "Facu" },
  { first_name: "Julieta", last_name: "Bardecio", nickname: "Juli" },
  { first_name: "Guillermina", last_name: "Lanza", nickname: "Guille" },
  { first_name: "Victoria", last_name: "Rivao", nickname: "Mavi" },
  { first_name: "Josefina", last_name: "Gonzalez", nickname: "Jojo" },
  { first_name: "Florencia", last_name: "Barreto", nickname: "Flor" }
]

users_data.each { |attrs| User.find_or_create_by!(attrs) }
puts "Created #{User.count} users"

# ============================================================
# Restaurant 1: Rudy
# ============================================================
rudy = Restaurant.find_or_create_by!(name: "Rudy")

cheese_toppings = %w[Cebolla Ketchup Lechuga Mayonesa Mostaza Pepinillos Tomate]
cheese_toppings_with_sin = cheese_toppings + ["Sin toppings"]

cheese_extras = [
  { name: "Bacon", price: 60 },
  { name: "Queso", price: 65 },
  { name: "Papas", price: 170 },
  { name: "Papas rusticas", price: 190 }
]

bacon_toppings_with_sin = ["Cebolla", "Salsa Rudy", "Sin toppings"]

veggie_toppings = %w[Cebolla Rucula Alioli Muzzarella Palta Tomate]
veggie_extras = [
  { name: "Queso", price: 65 },
  { name: "Veggie", price: 144 },
  { name: "Papas", price: 170 },
  { name: "Papas rusticas", price: 190 }
]

# Cheeseburger
cheeseburger = rudy.menu_items.find_or_create_by!(name: "Cheeseburger", price: 440)
cheese_toppings_with_sin.each { |t| cheeseburger.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| cheeseburger.extras.find_or_create_by!(e) }

# Bacon Cheeseburger
bacon_cheese = rudy.menu_items.find_or_create_by!(name: "Bacon Cheeseburger", price: 480)
bacon_toppings_with_sin.each { |t| bacon_cheese.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| bacon_cheese.extras.find_or_create_by!(e) }

# Doble Cheeseburger
doble_cheese = rudy.menu_items.find_or_create_by!(name: "Doble Cheeseburger", price: 590)
cheese_toppings_with_sin.each { |t| doble_cheese.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| doble_cheese.extras.find_or_create_by!(e) }

# Doble Bacon Cheeseburger
doble_bacon = rudy.menu_items.find_or_create_by!(name: "Doble Bacon Cheeseburger", price: 640)
cheese_toppings_with_sin.each { |t| doble_bacon.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| doble_bacon.extras.find_or_create_by!(e) }

# Hamburger
hamburger = rudy.menu_items.find_or_create_by!(name: "Hamburger", price: 430)
cheese_toppings_with_sin.each { |t| hamburger.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| hamburger.extras.find_or_create_by!(e) }

# Doble Hamburger
doble_hamburger = rudy.menu_items.find_or_create_by!(name: "Doble Hamburger", price: 580)
cheese_toppings_with_sin.each { |t| doble_hamburger.toppings.find_or_create_by!(name: t, price: 0) }
cheese_extras.each { |e| doble_hamburger.extras.find_or_create_by!(e) }

# Veggie
veggie = rudy.menu_items.find_or_create_by!(name: "Veggie", price: 465)
veggie_toppings.each { |t| veggie.toppings.find_or_create_by!(name: t, price: 0) }
veggie_extras.each { |e| veggie.extras.find_or_create_by!(e) }

# ============================================================
# Restaurant 2: Ashot
# ============================================================
ashot = Restaurant.find_or_create_by!(name: "Ashot")

ashot_toppings = [
  "Hummus", "Tomate", "Mayonesa", "Repollo con zanahoria", "Picante",
  "Pepino", "Cebolla", "Salsa de tomate con curry", "Yogurt",
  "Salsa de sesamo thina", "Papas pay"
]

ashot_extras = [
  { name: "Papas", price: 0 }
]

# Cerdo
cerdo = ashot.menu_items.find_or_create_by!(name: "Cerdo", price: 430)
ashot_toppings.each { |t| cerdo.toppings.find_or_create_by!(name: t, price: 0) }
ashot_extras.each { |e| cerdo.extras.find_or_create_by!(e) }

# Pollo
pollo = ashot.menu_items.find_or_create_by!(name: "Pollo", price: 430)
ashot_toppings.each { |t| pollo.toppings.find_or_create_by!(name: t, price: 0) }
ashot_extras.each { |e| pollo.extras.find_or_create_by!(e) }

# Falafel
falafel = ashot.menu_items.find_or_create_by!(name: "Falafel", price: 370)
ashot_toppings.each { |t| falafel.toppings.find_or_create_by!(name: t, price: 0) }
ashot_extras.each { |e| falafel.extras.find_or_create_by!(e) }

# ============================================================
# Restaurant 3: Bilas
# ============================================================
bilas = Restaurant.find_or_create_by!(name: "Bilas")

bilas_salsas = [
  { name: "Aceite Girasol/Maiz", price: 0 },
  { name: "Manteca", price: 0 },
  { name: "Pomarola", price: 25 },
  { name: "Fileto", price: 25 },
  { name: "Pesto", price: 25 },
  { name: "Blanca", price: 25 },
  { name: "Rosa", price: 30 },
  { name: "4 Quesos", price: 30 },
  { name: "Blanca y Pomarola", price: 30 },
  { name: "Bolognesa", price: 30 },
  { name: "Tuco de Carne", price: 30 },
  { name: "Aceite de Oliva", price: 39 },
  { name: "Caruso", price: 30 },
  { name: "Pesto con nueces", price: 39 },
  { name: "Genovesa", price: 39 },
  { name: "Crema de albahaca", price: 39 },
  { name: "Caprese", price: 39 },
  { name: "Cracovia", price: 39 }
]

bilas_extras = [
  { name: "Pancito adicional", price: 15 },
  { name: "Queso rallado Adicional", price: 15 }
]

# Pasta Pronta Tradicional
bilas_tradicional = [
  { name: "Ñoquis de papa", price: 349 },
  { name: "Tallarines de yema", price: 325 },
  { name: "Tallarines de espinaca", price: 349 },
  { name: "Fettuccini de yema", price: 325 },
  { name: "Fettuccini de espinaca", price: 349 },
  { name: "Ravioles de pollo y jamon", price: 325 },
  { name: "Ravioles de verdura", price: 349 },
  { name: "Ravioles de ricotta", price: 325 },
  { name: "Ravioles de jamon y queso", price: 349 },
  { name: "Ravioles de calabacin", price: 349 },
  { name: "Ñoquis calabacin", price: 349 },
  { name: "Ñoquis morron", price: 349 },
  { name: "Ñoquis degustacion de sabores", price: 349 },
  { name: "Ñoquis espinaca", price: 349 },
  { name: "Ñoquis provenzal", price: 349 }
]

# Pasta Pronta Especialidad
bilas_especialidad = [
  { name: "Raviolones de cordero", price: 415 },
  { name: "Raviolones de osobuco", price: 415 },
  { name: "Raviolones alla birra", price: 415 },
  { name: "Ñoquis romanos", price: 389 },
  { name: "Sorrentinos", price: 389 },
  { name: "Sorrentinos bondiola y queso", price: 389 },
  { name: "Capeletis artesanales", price: 389 },
  { name: "Tortelines artesanales", price: 369 },
  { name: "Rotolo di pasta", price: 425 },
  { name: "Rotolo di pasta caprese", price: 425 },
  { name: "Lasagna clasica", price: 425 },
  { name: "Lasagna napolitana", price: 425 },
  { name: "Lasagna humita", price: 425 },
  { name: "Lasagna light calabacin", price: 425 },
  { name: "Lasagna light ricotta", price: 425 },
  { name: "Lasagna pollo", price: 425 },
  { name: "Canelones de carne", price: 395 },
  { name: "Canelones de espinaca", price: 395 },
  { name: "Canelones humita", price: 395 },
  { name: "Canelones de jamon y queso", price: 395 },
  { name: "Canelones de pollo", price: 395 },
  { name: "Raviolon calabacin", price: 389 },
  { name: "Raviolon JyQ", price: 389 },
  { name: "Raviolon ricota, apio y nueces", price: 389 },
  { name: "Raviolon caprese", price: 389 },
  { name: "Raviolon 3 quesos", price: 389 },
  { name: "Raviolon lombardinense", price: 389 },
  { name: "Raviolon tivolis", price: 389 }
]

(bilas_tradicional + bilas_especialidad).each do |item_data|
  mi = bilas.menu_items.find_or_create_by!(name: item_data[:name], price: item_data[:price])
  bilas_salsas.each { |t| mi.toppings.find_or_create_by!(t) }
  bilas_extras.each { |e| mi.extras.find_or_create_by!(e) }
end

# ============================================================
# Restaurant 4: Kona Poke
# ============================================================
kona = Restaurant.find_or_create_by!(name: "Kona Poke")

# All toppings (Base + Proteina + Toppings + Salsas + Chips + Obsequio) - price 0
kona_toppings = [
  # Base
  "Arroz de sushi", "Mix de verdes", "Quinoa",
  # Proteina (sin salmon)
  "Pollo", "Tofu", "Langostinos", "Pollo crispy", "Garbanzos", "Lango Panko",
  # Toppings
  "Verdeo", "Edamame", "Palta", "Cream cheese", "Cherrys", "Repollo colorado",
  "Cebolla colorada", "Ananá", "Zanahoria", "Pepino", "Mango",
  # Salsas
  "Soja", "Ponzu (soja cítrica)", "Teriyaki", "Mostaza y miel", "Maracuyá",
  "Spicy mayo", "Salsa anguila", "Aceite de oliva", "Sriracha",
  "Nikkei (salsa de sushi)", "Sweet Wasabi",
  # Chips
  "Cebolla crispy", "Maíz crispy", "Sésamo",
  # Obsequio
  "Jengibre"
]

kona_extras = [
  { name: "Palta", price: 63 },
  { name: "Salmón", price: 63 },
  { name: "Pollo", price: 54 },
  { name: "Tofu", price: 54 },
  { name: "Cebolla crispy", price: 45 },
  { name: "Mango", price: 63 },
  { name: "Cream cheese", price: 45 },
  { name: "Camarones", price: 63 },
  { name: "Pollo crispy", price: 63 },
  { name: "Garbanzos", price: 36 },
  { name: "Maíz crispy", price: 45 },
  { name: "Ananá", price: 54 }
]

kona_items = [
  { name: "Arma tu bowl", price: 468 },
  { name: "Arma tu poke - Classic", price: 495 },
  { name: "Arma tu poke - Proteico", price: 549 }
]

kona_items.each do |item_data|
  mi = kona.menu_items.find_or_create_by!(name: item_data[:name], price: item_data[:price])
  kona_toppings.each { |t| mi.toppings.find_or_create_by!(name: t, price: 0) }
  kona_extras.each { |e| mi.extras.find_or_create_by!(e) }
end

# ============================================================
# Restaurant 5: Tropical Smoothies
# ============================================================
tropical = Restaurant.find_or_create_by!(name: "Tropical Smoothies")

tropical_smoothies = [
  { name: "Rio Smooth", price: 359 },
  { name: "Strawberry Fields", price: 306 },
  { name: "Avocado Smoothie", price: 311 },
  { name: "Banana Tropical", price: 282 },
  { name: "Blue Lagoon", price: 323 },
  { name: "Jamaica Mango", price: 330 },
  { name: "Mango Mambo", price: 342 },
  { name: "Mr. Kiwi", price: 311 },
  { name: "Pitufo Berry", price: 311 },
  { name: "Power Jungle", price: 311 },
  { name: "Mango Sunshine", price: 299 },
  { name: "Green Smoothie", price: 299 },
  { name: "Aloha Smoothie", price: 299 },
  { name: "Amazonas Açaí", price: 359 }
]

tropical_jugos = [
  { name: "Pura Vida", price: 210 },
  { name: "Fuera Stress", price: 198 },
  { name: "Refrescante", price: 216 },
  { name: "Detox", price: 210 },
  { name: "Vital", price: 210 },
  { name: "Chau Doc", price: 198 },
  { name: "Zeus", price: 210 },
  { name: "Poseidon", price: 198 },
  { name: "Aphrodite", price: 216 },
  { name: "Hades", price: 216 },
  { name: "Mantra", price: 198 },
  { name: "Jugo de Naranja", price: 210 },
  { name: "Prana", price: 198 },
  { name: "Jugo Mi Medicina", price: 258 },
  { name: "Apolo", price: 210 },
  { name: "Therapy", price: 234 },
  { name: "Zen", price: 210 },
  { name: "Jugo Bienestar", price: 246 },
  { name: "Citrico", price: 216 },
  { name: "Tropical Mango", price: 234 }
]

(tropical_smoothies + tropical_jugos).each do |item_data|
  tropical.menu_items.find_or_create_by!(name: item_data[:name], price: item_data[:price])
end

# ============================================================
# Restaurant 6: Donut City
# ============================================================
donut_city = Restaurant.find_or_create_by!(name: "Donut City")

donut_city_items = [
  # Meriendas / Boxes
  { name: "Box Donuts 2x2", price: 495 },
  { name: "Box de 2 rosquillas", price: 225 },
  { name: "Box Posta de donuts", price: 711 },
  # Donuts rosquillas
  { name: "Cinnamon", price: 135 },
  { name: "Choco brownie", price: 144 },
  # Donut rellenas
  { name: "Lemon Pie", price: 171 },
  { name: "Maracuyá", price: 180 },
  { name: "Choco Dulce", price: 171 },
  { name: "Boston Cream", price: 162 },
  { name: "Pistacho Lover", price: 207 },
  { name: "Dulce de leche", price: 171 },
  # Clásicos
  { name: "Medialunita", price: 108 },
  { name: "Scon de queso", price: 108 },
  # Postres
  { name: "Budín de Limón", price: 180 },
  { name: "Mini Brownie", price: 135 },
  { name: "Brownie", price: 198 },
  { name: "Cookie NY Chocolate", price: 216 },
  { name: "Cookie NY Nutella", price: 243 },
  { name: "Cookie NY Red Velvet", price: 243 },
  { name: "Carrot cake", price: 288 },
  { name: "Mini Muffin De Carrot Cake", price: 135 },
  # Bebidas
  { name: "Coca-Cola 600ml", price: 135 },
  { name: "Coca-Cola ZERO 600ml", price: 135 },
  { name: "Agua mineral 600ml", price: 126 },
  { name: "Agua mineral con gas 600ml", price: 126 }
]

donut_city_items.each do |item_data|
  donut_city.menu_items.find_or_create_by!(name: item_data[:name], price: item_data[:price])
end

# ============================================================
# Restaurant 7: Nomnom Bakery
# ============================================================
nomnom = Restaurant.find_or_create_by!(name: "Nomnom Bakery")

nomnom_items = [
  # Cookies ny
  { name: "Cookie ny oreo", price: 240 },
  { name: "Cookie ny red velvet", price: 240 },
  { name: "Cookie ny pistacho", price: 250 },
  { name: "Cookie ny limón & coco", price: 240 },
  { name: "Cookie ny nutella & banana", price: 240 },
  { name: "Cookie ny triple choco & ddl", price: 240 },
  # Dulces
  { name: "Carrot Cake", price: 310 },
  { name: "Red Velvet", price: 310 },
  { name: "Torta moka", price: 310 },
  { name: "Rogel", price: 285 },
  { name: "Cheesecake frutos rojos", price: 310 },
  { name: "Pastafrola de guayaba", price: 255 },
  { name: "Pastafrola de naranja", price: 255 },
  { name: "Cuadrado coco y ddl", price: 255 },
  # Salado
  { name: "Scon de queso", price: 130 },
  { name: "Galletas de oliva & sésamo", price: 190 },
  { name: "Galletas de oliva y parmesano", price: 190 },
  # Sin gluten
  { name: "Brownie sin gluten", price: 255 },
  { name: "Cookie almendra sin gluten", price: 255 },
  { name: "Cookie chips sin gluten", price: 255 },
  { name: "Cookie earl grey sin gluten", price: 255 },
  { name: "Cookie cranberry sin gluten", price: 255 },
  { name: "Alfajor de maicena sin gluten", price: 135 },
  # Bebidas calientes
  { name: "Espresso doble", price: 150 },
  { name: "Americano", price: 170 },
  { name: "Latte macchiatto", price: 190 },
  { name: "Cappuccino", price: 190 },
  { name: "Moka belga", price: 190 },
  { name: "Submarino", price: 190 },
  # Bebidas frías
  { name: "Limonada clásica", price: 200 },
  { name: "Limonada nomnom", price: 220 }
]

nomnom_items.each do |item_data|
  nomnom.menu_items.find_or_create_by!(name: item_data[:name], price: item_data[:price])
end

puts "Created #{Restaurant.count} restaurants with menu items"
puts "Done!"
