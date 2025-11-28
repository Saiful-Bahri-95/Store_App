import 'package:flutter/material.dart';
import 'package:store_app/controllers/category_controller.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/views/screens/nav_screens/widgets/reusable_text_widget.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  //future list of categories to be displayed
  late Future<List<Category>> futureCategories;
  @override
  void initState() {
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextWidget(title: 'Categories', subtitle: 'View All'),
        FutureBuilder(
          future: futureCategories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(child: Text('No categories found'));
            } else {
              final categories = snapshot.data!;
              return GridView.builder(
                padding: const EdgeInsets.all(5.0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // GAMBAR
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: Image.network(
                              category.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // LABEL NAMA
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.5,
                            horizontal: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
