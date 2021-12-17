import 'package:flutter/material.dart';
import 'package:recipe/constants.dart';
import 'package:recipe/data.dart';
import 'package:recipe/shared.dart';

class Detail extends StatelessWidget {
  final Recipe recipe;
  const Detail({Key key, this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextTitleVariation1(recipe.title),
                    buildTextSubTitleVariation1(recipe.description),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 32,
                padding: EdgeInsets.only(left: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTextTitleVariation2("Nutrition", false),
                        SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.calories, "Calories", "Kcal"),
                        SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.carbo, "Carbo", "g"),
                        SizedBox(
                          height: 16,
                        ),
                        buildNutrition(recipe.protein, "Protein", "g"),
                      ],
                    ),
                    Positioned(
                        right: -80,
                        child: Hero(
                            tag: recipe.image,
                            child: Container(
                              height: 310,
                              width: 310,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(recipe.image),
                                      fit: BoxFit.fitHeight)),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextTitleVariation2("Ingredients", false),
                    buildTextSubTitleVariation1(
                        "1 bunch thin asparagus spears, trimmed"),
                    buildTextSubTitleVariation1("3 tablespoons olive oil"),
                    buildTextSubTitleVariation1(
                        "1 tablespoons grated Parmesan cheese (Optional)"),
                    buildTextTitleVariation1(
                        "1 ½ clove garlic, minced (Optional)"),
                    buildTextSubTitleVariation1("1 teaspoon sea salt"),
                    buildTextSubTitleVariation1(
                        "½ teaspoon ground black pepper"),
                    buildTextSubTitleVariation1(
                        "1 tablespoon lemon juice (Optional)"),
                    SizedBox(
                      height: 16,
                    ),
                    buildTextTitleVariation2("Recipe preparation", false),
                    buildTextSubTitleVariation1("Step 1"),
                    buildTextSubTitleVariation1(
                        "Preheat an oven to 425 degrees F (220 degrees C)."),
                    buildTextSubTitleVariation1("Step 2"),
                    buildTextSubTitleVariation1(
                        "Place the asparagus into a mixing bowl, and drizzle with the olive oil. Toss to coat the spears, then sprinkle with Parmesan cheese, garlic, salt, and pepper. Arrange the asparagus onto a baking sheet in a single layer.."),
                    buildTextSubTitleVariation1("Step 3"),
                    buildTextSubTitleVariation1(
                        "Bake in the preheated oven until just tender, 12 to 15 minutes depending on thickness. Sprinkle with lemon juice just before serving."),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          icon: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 32,
          ),
          label: Text("Watch Video",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ));
  }

  Widget buildNutrition(int value, String title, String subTitle) {
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
