import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/controllers/subcategory_controller.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/models/subcategory.dart';
import 'package:store_app/views/screens/detail/screens/widgets/inner_banner_widget.dart';
import 'package:store_app/views/screens/detail/screens/widgets/subcategory_tile_widget.dart';
import 'package:store_app/views/screens/nav_screens/widgets/header_widget.dart';

class InnerCategoryContentScreen extends StatefulWidget {
  final Category category;
  const InnerCategoryContentScreen({super.key, required this.category});

  @override
  State<InnerCategoryContentScreen> createState() =>
      _InnerCategoryContentScreenState();
}

class _InnerCategoryContentScreenState
    extends State<InnerCategoryContentScreen> {
  late Future<List<Subcategory>> _subCategories;
  final SubcategoryController _subcategoryController = SubcategoryController();
  @override
  void initState() {
    super.initState();
    _subCategories = _subcategoryController.getSubcategoryBycategoryName(
      widget.category.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.2,
        ),
        child: HeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back, size: 18),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Home',
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            InnerBannerWidget(image: widget.category.banner),
            Center(
              child: Text(
                'Shop By Categories',
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: _subCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return Center(child: Text('No categories found'));
                } else {
                  final subcategories = snapshot.data!;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: List.generate(
                        (subcategories.length / 7).ceil(),
                        (setIndex) {
                          final start = setIndex * 7;
                          final end = (setIndex + 1) * 9;

                          return Padding(
                            padding: EdgeInsets.all(8.9),
                            child: Row(
                              children: subcategories
                                  .sublist(
                                    start,
                                    end > subcategories.length
                                        ? subcategories.length
                                        : end,
                                  )
                                  .map(
                                    (subcategory) => SubcategoryTileWidget(
                                      image: subcategory.image,
                                      title: subcategory.subCategoryName,
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
