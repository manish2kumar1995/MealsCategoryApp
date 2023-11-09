//
//  MockMealsJson.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation

enum MockMealsJson {
    static let mockJsonCategoryList: [String:Any] = [
        "categories": [
          [
            "idCategory": "1",
            "strCategory": "Beef",
            "strCategoryThumb": "",
            "strCategoryDescription": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
          ],
          [
            "idCategory": "2",
            "strCategory": "Chicken",
            "strCategoryThumb": "",
            "strCategoryDescription": "Chicken is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets."
          ],
          [
            "idCategory": "3",
            "strCategory": "Dessert",
            "strCategoryThumb": "",
            "strCategoryDescription": "Dessert is a course that concludes a meal. The course usually consists of sweet foods, such as confections dishes or fruit, and possibly a beverage such as dessert wine or liqueur, however in the United States it may include coffee, cheeses, nuts, or other savory items regarded as a separate course elsewhere. Fruit is also commonly found in dessert courses because of its naturally occurring sweetness. Some cultures sweeten foods that are more commonly savory to create desserts."
          ],
          [
            "idCategory": "4",
            "strCategory": "Lamb",
            "strCategoryThumb": "",
            "strCategoryDescription": "Lamb, hogget, and mutton are the meat of domestic sheep (species Ovis aries) at different ages.\r\n\r\nA sheep in its first year is called a lamb, and its meat is also called lamb. The meat of a juvenile sheep older than one year is hogget; outside the USA this is also a term for the living animal. The meat of an adult sheep is mutton, a term only used for the meat, not the living animals. The term mutton is almost always used to refer to goat meat in the Indian subcontinent.\r\n\r\n"
          ],
          [
            "idCategory": "5",
            "strCategory": "Miscellaneous",
            "strCategoryThumb": "",
            "strCategoryDescription": "General foods that don't fit into another category"
          ],
          [
            "idCategory": "6",
            "strCategory": "Pasta",
            "strCategoryThumb": "",
            "strCategoryDescription": "Pasta is a staple food of traditional Italian cuisine, with the first reference dating to 1154 in Sicily.\r\n\r\nAlso commonly used to refer to the variety of pasta dishes, pasta is typically a noodle made from an unleavened dough of a durum wheat flour mixed with water or eggs and formed into sheets or various shapes, then cooked by boiling or baking. As an alternative for those wanting a different taste, or who need to avoid products containing gluten, some pastas can be made using rice flour in place of wheat.[3][4] Pastas may be divided into two broad categories, dried (pasta secca) and fresh (pasta fresca)."
          ],
          [
            "idCategory": "7",
            "strCategory": "Pork",
            "strCategoryThumb": "",
            "strCategoryDescription": "Pork is the culinary name for meat from a domestic pig (Sus scrofa domesticus). It is highly prized in Asian cuisines for its fat content and pleasant texture. Consumption of pork is forbidden by Jewish and Muslim dietary law, a taboo that is deeply rooted in tradition, with several suggested possible causes. The sale of pork is limited in Israel and illegal in certain Muslim countries."
          ],
          [
            "idCategory": "8",
            "strCategory": "Seafood",
            "strCategoryThumb": "",
            "strCategoryDescription": "Seafood is any form of sea life regarded as food by humans. Seafood prominently includes fish and shellfish. Shellfish include various species of s eaten by humans, so all edible aquatic life may be referred to as seafood. For the sake of completeness, this article includes all edible aquatic life."
          ],
          [
            "idCategory": "9",
            "strCategory": "Side",
            "strCategoryThumb": "",
            "strCategoryDescription": "A side dish, sometimes referred to as a side order, side item, or simply a side, is a food item that accompanies the entrée or main course at a meal. Side dishes such as salad, potatoes and bread are commonly used with main courses throughout many countries of the western world. New side orders introduced within the past decade[citation needed], such as rice and couscous, have grown to be quite popular throughout Europe, especially at formal occasions (with couscous appearing more commonly at dinner parties with Middle Eastern dishes)."
          ],
          [
            "idCategory": "10",
            "strCategory": "Starter",
            "strCategoryThumb": "",
            "strCategoryDescription": "An entrée in modern French table service and that of much of thes d’œuvre, and entrée (including the bouilli and relevé). The “second service” consisted of roast (rôti), salad, and entremets (the entremets sometimes being separated into a “third service” of their own). The final service consisted only of dessert.[3]:3–11 :13–25"
          ],
          [
            "idCategory": "11",
            "strCategory": "Vegan",
            "strCategoryThumb": "",
            "strCategoryDescription": "Veganism is both the practice of abstaining from the use of animal products farming of animals is environmentally damaging and unsustainable."
          ],
          [
            "idCategory": "12",
            "strCategory": "Vegetarian",
            "strCategoryThumb": "",
            "strCategoryDescription": "Vegetarianism is the practice of abstaining from the consumption of meat iry products, and a lacto-vegetarian diet includes dairy products but not eggs. A vegan diet excludes all animal products, including eggs and dairy. Some vegans also avoid other animal products such as beeswax, leather or silk clothing, and goose-fat shoe polish."
          ],
          [
            "idCategory": "13",
            "strCategory": "Breakfast",
            "strCategoryThumb": "",
            "strCategoryDescription": "Breakfast is the first meal of a day. The word in English refers to breaking the fasting period of the previous night. There is a strong likelihood for one or more \"typical\", or \"traditional\", breakfast menus to exist in most places, but their composition varies widely from place to place, and has varied over time, so that globally a very wide range of preparations and ingredients are now associated with breakfast."
          ],
          [
            "idCategory": "14",
            "strCategory": "Goat",
            "strCategoryThumb": "",
            "strCategoryDescription": "The domestic goat or simply goat (Capra aegagrus hircus) is a subspecies of C. aegagrus domesticated from the wild goat of Southwest Asia and Eastern Europe. The goat is a member of the animal family Bovidae and the subfamily Caprinae, meaning it is closely related to the sheep. There are over 300 distinct breeds of goat. Goats are one of the oldest domesticated species of animal, and have been used for milk, meat, fur and skins across much of the world. Milk from goats is often turned into goat cheese."
          ]
        ]
      ]
    
    static let mockEmptyJSONResponse:[String:Any] = ["status": "ok","totalResults": 0,"articles" :[]]
    
    static let mockJsonMealsList: [String:Any] = [
        "meals": [
            [
                "strMeal": "Saltfish and Ackee",
                "strMealThumb": "",
                "idMeal": "52936"
            ],
            [
                "strMeal": "Seafood fideu",
                "strMealThumb": "",
                "idMeal": "52836"
            ],
            [
                "strMeal": "Shrimp Chow Fun",
                "strMealThumb": "",
                "idMeal": "52953"
            ],
            [
                "strMeal": "Sledz w Oleju (Polish Herrings)",
                "strMealThumb": "",
                "idMeal": "53023"
            ],
            [
                "strMeal": "Spring onion and prawn empanadas",
                "strMealThumb": "",
                "idMeal": "53040"
            ],
            [
                "strMeal": "Sushi",
                "strMealThumb": "",
                "idMeal": "53065"
            ],
            [
                "strMeal": "Three Fish Pie",
                "strMealThumb": "",
                "idMeal": "52882"
            ],
            [
                "strMeal": "Tuna and Egg Briks",
                "strMealThumb": "",
                "idMeal": "52975"
            ],
            [
                "strMeal": "Tuna Nicoise",
                "strMealThumb": "",
                "idMeal": "52852"
            ]
        ]
    ]
    

}
