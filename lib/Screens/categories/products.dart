import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../bloc/cubit.dart';
import '../../bloc/state.dart';
import '../homepage/Homepage.dart';
import '../profile/my_saved.dart';
import '../categories/product_details.dart';
import 'Categories.dart';

class Products extends StatefulWidget {
  final String title;
  final Color color;

  const Products({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String, dynamic>> savedProducts = [];

  // Mapping category names to their respective IDs
  final Map<String, int> categoryIdMap = {
    "Pain Relievers": 3,
    "Antibiotics": 4,
    "Antihistamines": 5,
    "Antacids": 6,
    "Cough & Cold": 7,
    "Vitamins & Supplements": 8,
    "Skin Care": 9,
    "Eye Care": 10,
  };

  @override
  void initState() {
    super.initState();
    int categoryId = categoryIdMap[widget.title] ?? 9; // Default to 9
    HomeCubit.get(context).getMedicsList(categoryId);
    _loadSavedProducts();
  }

  Future<void> _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList = savedProducts.map((item) => json.encode(item)).toList();
    await prefs.setStringList('saved_products', encodedList);
  }

  Future<void> _loadSavedProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('saved_products');
    if (savedList != null) {
      setState(() {
        savedProducts = savedList.map((item) => json.decode(item)).cast<Map<String, dynamic>>().toList();
      });
    }
  }

  bool isFavorite(String name) {
    return savedProducts.any((p) => p['name'] == name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.heart, color: Colors.transparent,),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MySaved()),
              );
              await _loadSavedProducts();
              setState(() {});
            },
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(type: PageTransitionType.fade, child: message_tab_all()),
            );
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/icons/back1.png"),
              ),
            ),
          ),
        ),
        title: Text(
          "Products",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 17.sp,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 64,
              color: widget.color,
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state is GetMedicsDataLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetMedicsListSuccessState) {
                  final drugs = state.drugsList;

                  if (drugs.isEmpty) {
                    return const Center(child: Text("No products available in this category."));
                  }

                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(drugs.length, (index) {
                      final drug = drugs[index];
                      final name = drug.name;
                      final isFav = isFavorite(name);

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: ProductDetails(
                                image: drug.image,
                                name: drug.name,
                                description: drug.description,
                                stock: drug.stock,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.topLeft,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.42,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff465C67)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 139,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: drug.image.isNotEmpty
                                    ?
                                Image.network(
                                  drug.image,
                                  fit: BoxFit.cover,
                                  width: 139,
                                  height: 80,
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const Center(child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, error, stackTrace) {
                                    print('Error loading image: $error');
                                    return const Icon(FontAwesomeIcons.image);
                                  },
                                )

                                    : const Icon(FontAwesomeIcons.image),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${drug.price} \$",
                                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.cyan),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${drug.stock}  piece",

                                style: const TextStyle(color: Color(0xff465C67)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 3),
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isFav) {
                                        savedProducts.removeWhere((p) => p['name'] == name);
                                      } else {
                                        savedProducts.add({
                                          'name': name,
                                          'stock': drug.stock,
                                          'image': drug.image,
                                          'price': drug.price,
                                        });
                                      }
                                      _saveToPrefs();
                                    });
                                  },
                                  child: Icon(
                                    isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                    color: isFav ? Colors.red : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return const Center(child: Text("No data available."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
