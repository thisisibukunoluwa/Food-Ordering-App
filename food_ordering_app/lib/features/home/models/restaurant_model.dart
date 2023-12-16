import 'package:food_ordering_app/features/home/models/menu_item_model.dart';
import 'package:food_ordering_app/gen/assets.gen.dart';

class RestaurantModel {
  final String title;
  final String image;
  final double distance;
  final double rating;
  final String deliveryTime; 
  final List<MenuCategory> menu;

  RestaurantModel({
    required this.title,
    required this.image,
    required this.distance,
    required this.rating,
    required this.deliveryTime,
    required this.menu
  });

  static List<RestaurantModel> restaurants = [
    RestaurantModel(
      title: "The Pizza Place",
      image: Assets.popularrestaurants.pizzaplace.path,
      distance: 2,
      rating: 5,
      deliveryTime: "20 to 30 mins",
      menu: [
        MenuCategory(
          categoryName: "Combo Deals",
          meals:[
            MenuItem(
              title: "King's deal",
              description: "Any medium classic Pizza + a small pizza and a pet drink",
              price: 20.34,
              image: "https://media.istockphoto.com/id/1179675467/photo/glass-of-coke-and-pizza.jpg",
            ),
          ]
        ),
          MenuCategory(
            categoryName: "Classic Pizza", meals: [
            MenuItem(
              title: "BBQ Chicken",
              description:
                  "Pizza coated with BBQ sauce,cheese and grilled chicken",
              price: 12.99,
              image:
                  "https://images.pexels.com/photos/825661/pexels-photo-825661.jpeg",
            ),
            MenuItem(
              title: "BBQ Beef",
              description:
                  "Pizza coated with BBQ sauce,cheese and grilled chicken",
              price: 12.89,
              image:
                  "https://images.pexels.com/photos/3343626/pexels-photo-3343626.jpeg",
            ),
            MenuItem(
              title: "Veggie Supreme",
              description:
                  "Pizza coated with tomato sauce, cheese and vegetable toppings",
              price: 13.00,
              image:
                  "https://images.pexels.com/photos/2147491/pexels-photo-2147491.jpeg",
            ),
          ]),
        MenuCategory(
          categoryName: "Premium Pizza",
          meals:[
            MenuItem(
              title: "BBQ Mega",
              description: "Any medium classic pizza + a chicken pizza + a pet drink",
              price: 12.99,
              image: "https://media.istockphoto.com/id/1179675467/photo/glass-of-coke-and-pizza.jpg",
            ),
            MenuItem(
              title: "Chicken BalI",
              description: "Tomato sauce, cheese, grilled chicken , pineapple & mushrooms",
              price: 12.89,
              image: "https://media.istockphoto.com/id/1349383878/photo/hawaiian-pizza-with-ham-and-pineapple.jpg",
            ),
            MenuItem(
              title: "Extravaganza",
              description: "Tomato sauce, cheese, pepper, pepperoni,beef, onions & olives",
              price: 13.00,
              image: "https://images.pexels.com/photos/5792328/pexels-photo-5792328.jpeg",
            ),
          ]
        ),
        MenuCategory(
          categoryName: "Sides",
          meals:[
            MenuItem(
              title: "Chicken Wings",
              description: "Choose between 6pcs, 8pcs, 12pcs",
              price: 6.45,
              image: "https://media.istockphoto.com/id/835903320/photo/baked-chicken-wings-with-sesame-seeds-and-sweet-chili-sauce-on-white-wooden-board.jpg?s=612x612&w=0&k=20&c=SH8ZCkEKuWD_wxulpntIJ0uD4yRnUf9UXovQwSwrmmA=",
            ),
            MenuItem(
              title: "French Fries",
              description: "Choose between large, extra large, and regular",
              price: 5.50,
              image: "https://images.pexels.com/photos/1893556/pexels-photo-1893556.jpeg",
            ),
          ]
        ),
        MenuCategory(
          categoryName: "Drinks",
          meals:[
            MenuItem(
              title: "Coke",
              description: "Choose between 35cl , 50cl and 150cl",
              price: 3.45,
              image: "https://images.pexels.com/photos/50593/coca-cola-cold-drink-soft-drink-coke-50593.jpeg",
            ),
            MenuItem(
              title: "Sprite",
              description: "Choose between 35cl , 50cl and 150cl",
              price: 3.45,
              image: "https://images.pexels.com/photos/4161715/pexels-photo-4161715.jpeg",
            ),
          ]
        ),
      ]
    ),
   RestaurantModel(
  title: "Sweet Scoops",
  image: Assets.popularrestaurants.icecreamfactory.path,
  distance: 2,
  rating: 5,
  deliveryTime: "15 to 25 mins",
  menu: [
    MenuCategory(
      categoryName: "Special Sundae",
      meals: [
        MenuItem(
          title: "Royal Delight",
          description: "Vanilla ice cream with caramel syrup, nuts, and whipped cream",
          price: 8.99,
          image: "https://example.com/royal_delight.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Classic Flavors",
      meals: [
        MenuItem(
          title: "Chocolate Lover's",
          description: "Rich chocolate ice cream with chocolate chunks and fudge",
          price: 6.99,
          image: "https://example.com/chocolate_lovers.jpg",
        ),
        MenuItem(
          title: "Strawberry Bliss",
          description: "Creamy strawberry ice cream with fresh strawberries",
          price: 7.49,
          image: "https://example.com/strawberry_bliss.jpg",
        ),
        MenuItem(
          title: "Vanilla Dream",
          description: "Smooth vanilla ice cream with vanilla bean specks",
          price: 6.49,
          image: "https://example.com/vanilla_dream.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Premium Creations",
      meals: [
        MenuItem(
          title: "Caramel Crunch Deluxe",
          description: "Caramel ice cream with toffee pieces and chocolate swirls",
          price: 9.49,
          image: "https://example.com/caramel_crunch_deluxe.jpg",
        ),
        MenuItem(
          title: "Mint Chocolate Fantasy",
          description: "Mint chocolate chip ice cream with chocolate fudge",
          price: 8.99,
          image: "https://example.com/mint_chocolate_fantasy.jpg",
        ),
        MenuItem(
          title: "Double Berry Extravaganza",
          description: "Mixed berry ice cream with berry swirls and fruit pieces",
          price: 9.99,
          image: "https://example.com/double_berry_extravaganza.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Toppings",
      meals: [
        MenuItem(
          title: "Sprinkles Galore",
          description: "Assorted colorful sprinkles to top off your ice cream",
          price: 1.50,
          image: "https://example.com/sprinkles_galore.jpg",
        ),
        MenuItem(
          title: "Hot Fudge Drizzle",
          description: "Warm chocolate fudge sauce to pour over your ice cream",
          price: 2.00,
          image: "https://example.com/hot_fudge_drizzle.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Beverages",
      meals: [
        MenuItem(
          title: "Iced Caramel Latte",
          description: "Chilled caramel latte to accompany your sweet treat",
          price: 4.99,
          image: "https://example.com/iced_caramel_latte.jpg",
        ),
        MenuItem(
          title: "Fruit Punch Cooler",
          description: "Refreshing fruit punch cooler to quench your thirst",
          price: 3.99,
          image: "https://example.com/fruit_punch_cooler.jpg",
        ),
      ],
    ),
  ],
),
RestaurantModel(
  title: "Java Junction",
  image: Assets.popularrestaurants.coffeehouse.path,
  distance: 2,
  rating: 4.5,
  deliveryTime: "15 to 20 mins",
  menu: [
    MenuCategory(
      categoryName: "Signature Coffees",
      meals: [
        MenuItem(
          title: "Caramel Macchiato",
          description: "Espresso with steamed milk and caramel drizzle",
          price: 4.99,
          image: "https://example.com/caramel_macchiato.jpg",
        ),
        MenuItem(
          title: "Hazelnut Latte",
          description: "Rich espresso with steamed milk and hazelnut flavor",
          price: 5.49,
          image: "https://example.com/hazelnut_latte.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Classic Brews",
      meals: [
        MenuItem(
          title: "Americano",
          description: "Espresso with hot water for a bold and smooth flavor",
          price: 3.99,
          image: "https://example.com/americano.jpg",
        ),
        MenuItem(
          title: "Cappuccino",
          description: "Equal parts espresso, steamed milk, and frothed milk",
          price: 4.49,
          image: "https://example.com/cappuccino.jpg",
        ),
        MenuItem(
          title: "Mocha",
          description: "Espresso with steamed milk, chocolate syrup, and whipped cream",
          price: 4.79,
          image: "https://example.com/mocha.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Specialty Blends",
      meals: [
        MenuItem(
          title: "Iced Vanilla Latte",
          description: "Chilled espresso with cold milk and vanilla flavor",
          price: 5.29,
          image: "https://example.com/iced_vanilla_latte.jpg",
        ),
        MenuItem(
          title: "Toffee Nut Frappuccino",
          description: "Blended coffee with toffee nut syrup, milk, and ice",
          price: 5.99,
          image: "https://example.com/toffee_nut_frappuccino.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Pastries",
      meals: [
        MenuItem(
          title: "Croissant",
          description: "Buttery and flaky pastry perfect for a coffee pairing",
          price: 2.99,
          image: "https://example.com/croissant.jpg",
        ),
        MenuItem(
          title: "Blueberry Muffin",
          description: "Moist muffin with bursts of blueberries",
          price: 3.49,
          image: "https://example.com/blueberry_muffin.jpg",
        ),
      ],
    ),
    MenuCategory(
      categoryName: "Teas",
      meals: [
        MenuItem(
          title: "Chai Latte",
          description: "Spiced tea with steamed milk for a comforting blend",
          price: 4.49,
          image: "https://example.com/chai_latte.jpg",
        ),
        MenuItem(
          title: "Green Tea",
          description: "Classic green tea for a refreshing experience",
          price: 3.99,
          image: "https://example.com/green_tea.jpg",
        ),
      ],
    ),
  ],
);

  ];
}
