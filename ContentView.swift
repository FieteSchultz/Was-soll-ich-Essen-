import SwiftUI

struct ContentView: View {
    @State private var selectedDish: Dish?
    
    let dishes: [Dish] = Dish.sampleDishes
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Was soll ich essen?")
                    .font(.largeTitle)
                    .bold()
                
                Button(action: {
                    selectedDish = dishes.randomElement()
                }) {
                    Text("🍽 Zufallsgericht auswählen")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if let dish = selectedDish {
                    Text(dish.name)
                        .font(.title)
                        .bold()
                        .padding()
                        .transition(.opacity)
                    
                    NavigationLink("📋 Zutaten", destination: IngredientsView(dish: dish))
                        .buttonStyle(.borderedProminent)
                        
                    NavigationLink("👨‍🍳 Zubereitung", destination: PreparationView(dish: dish))
                        .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
    }
}

struct IngredientsView: View {
    let dish: Dish
    
    var body: some View {
        List {
            Section(header: Text("Für 1 Person")) {
                ForEach(dish.ingredients, id: \..self) { ingredient in
                    Text("\(ingredient.amount)g \(ingredient.name)")
                }
            }
            Section(header: Text("Für 2 Personen")) {
                ForEach(dish.ingredients, id: \..self) { ingredient in
                    Text("\(ingredient.amount * 2)g \(ingredient.name)")
                }
            }
            Section(header: Text("Für 4 Personen")) {
                ForEach(dish.ingredients, id: \..self) { ingredient in
                    Text("\(ingredient.amount * 4)g \(ingredient.name)")
                }
            }
        }
        .navigationTitle("Zutaten")
    }
}

struct PreparationView: View {
    let dish: Dish
    
    var body: some View {
        ScrollView {
            Text(dish.preparation)
                .padding()
        }
        .navigationTitle("Zubereitung")
    }
}

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let ingredients: [Ingredient]
    let preparation: String
    
    struct Ingredient: Hashable {
        let name: String
        let amount: Int
    }
    
    static let sampleDishes: [Dish] = [
        Dish(name: "Spaghetti Bolognese", ingredients: [Ingredient(name: "Spaghetti", amount: 100), Ingredient(name: "Hackfleisch", amount: 150), Ingredient(name: "Tomatensauce", amount: 200)], preparation: "1. Nudeln kochen. 2. Hackfleisch anbraten. 3. Tomatensauce dazugeben. 4. Alles mischen und servieren."),
        Dish(name: "Pizza Margherita", ingredients: [Ingredient(name: "Mehl", amount: 200), Ingredient(name: "Tomatensauce", amount: 100), Ingredient(name: "Mozzarella", amount: 150)], preparation: "1. Teig zubereiten. 2. Tomatensauce darauf verteilen. 3. Mit Mozzarella belegen. 4. Backen und genießen."),
        Dish(name: "Sushi", ingredients: [Ingredient(name: "Sushireis", amount: 100), Ingredient(name: "Lachs", amount: 100), Ingredient(name: "Noriblätter", amount: 2)], preparation: "1. Reis kochen. 2. Auf Noriblatt verteilen. 3. Mit Lachs belegen. 4. Rollen und schneiden."),
        Dish(name: "Lasagne", ingredients: [Ingredient(name: "Lasagneplatten", amount: 200), Ingredient(name: "Hackfleisch", amount: 150), Ingredient(name: "Tomatensauce", amount: 200)], preparation: "1. Hackfleisch anbraten. 2. Tomatensauce dazugeben. 3. In eine Auflaufform mit Lasagneplatten schichten. 4. Backen und genießen."),
        Dish(name: "Bratwurst mit Sauerkraut", ingredients: [Ingredient(name: "Bratwurst", amount: 200), Ingredient(name: "Sauerkraut", amount: 150), Ingredient(name: "Kartoffeln", amount: 200)], preparation: "1. Bratwurst braten. 2. Sauerkraut erwärmen. 3. Mit Kartoffeln servieren."),
        Dish(name: "Eisbein mit Erbspüree", ingredients: [Ingredient(name: "Eisbein", amount: 500), Ingredient(name: "Erbsen", amount: 200), Ingredient(name: "Kartoffeln", amount: 200)], preparation: "1. Eisbein kochen. 2. Erbsen pürieren. 3. Mit Kartoffeln servieren."),
        Dish(name: "Schweinebraten mit Knödeln", ingredients: [Ingredient(name: "Schweinefleisch", amount: 500), Ingredient(name: "Kartoffelknödel", amount: 200), Ingredient(name: "Sauerkraut", amount: 150)], preparation: "1. Schweinefleisch braten. 2. Knödel zubereiten. 3. Mit Sauerkraut servieren."),
        Dish(name: "Leberkäse mit Spiegelei", ingredients: [Ingredient(name: "Leberkäse", amount: 200), Ingredient(name: "Eier", amount: 2), Ingredient(name: "Kartoffelsalat", amount: 200)], preparation: "1. Leberkäse braten. 2. Spiegelei zubereiten. 3. Mit Kartoffelsalat servieren."),
        Dish(name: "Kartoffelsuppe", ingredients: [Ingredient(name: "Kartoffeln", amount: 500), Ingredient(name: "Karotten", amount: 100), Ingredient(name: "Zwiebeln", amount: 100)], preparation: "1. Gemüse würfeln. 2. Kochen und pürieren."),
        Dish(name: "Schupfnudeln mit Sauerkraut", ingredients: [Ingredient(name: "Schupfnudeln", amount: 300), Ingredient(name: "Sauerkraut", amount: 150), Ingredient(name: "Speck", amount: 100)], preparation: "1. Schupfnudeln anbraten. 2. Mit Sauerkraut und Speck servieren."),
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


