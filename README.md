
# 🚀Demo App

### About Campany
83 help companies in digital transformation and merge them with traditional advertisements in a professional way to create the best results for a strong brand that resonates in people’s minds.

<img width="290" alt="Screen Shot 2022-10-17 at 12 20 18 PM" src="https://user-images.githubusercontent.com/75214477/196141263-4a62d5b7-6e37-4916-9a17-38ab87ec0838.png">

<br><br>
## Task Explanation

Demo Flutter App that consists of 4 screens:
### Home, News, Favorite, Cart screen
  #### HOME SCREEN:
  * User can add to his Favorite by click ( :heart: ) and remove by another click on it (Deals pf the day part).
  * User can add to his Cart by click ( :shopping_cart: ) and remove by another click on it (Demo Products part).

  #### Favorite SCREEN:
  * User can see his Favorite .
  
  #### Cart SCREEN:
  * User can see his products wich add them to Cart .
  
  
  About App:

* State management: GetX
* Define color palette and Text Stylies for the app
* Reusable UI components 
* Publish the project on Github




## Run
<br>

```bash
  flutter run
```




https://user-images.githubusercontent.com/75214477/196149937-353e3685-fc65-432a-96fa-342e8bf81e3c.mp4




## Tech Stack

**State management:** [get](https://pub.dev/packages/get)

**For Ui:** 

[persistent_bottom_nav_bar](https://pub.dev/packages/persistent_bottom_nav_bar)

[google_fonts](https://pub.dev/packages/google_fonts)


**Project structure:** MVC


<pre>
|-- lib
    |-- controllers
    |   |-- cart_controller
    |   |-- grocery_controller 
    |-- demoList
    |   |-- address_list
    |   |-- cart_list
    |   |-- favorite_list
    |   |-- offers_list
    |   |-- catoegry_list
    |-- factories
    |   |-- color
    |   |-- textstyles
    |-- models
    |   |-- address_model
    |   |-- cart_model
    |   |-- favorite_model
    |   |-- offers_model
    |-- screens(Contain all app screens)
    |   |-- Cart
    |   |-- Grocery
    |   |-- Viewer
    |-- widget (Contain widgets for every screen)
    |   |-- Cart
    |   |-- Grocery
    |   |-- Viewer


</pre>

