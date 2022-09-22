import 'package:badges/badges.dart';
import 'package:curso_flutter_greengrocer/src/config/app_data.dart' as appData;
import 'package:curso_flutter_greengrocer/src/config/custom_colors.dart';
import 'package:curso_flutter_greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:curso_flutter_greengrocer/src/pages/home/components/item_tile.dart';
import 'package:curso_flutter_greengrocer/src/services/utils_services.dart';
import 'package:flutter/material.dart';

import '../common_widgets/app_name_widget.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';
  final UltilsServices ultilsServices = UltilsServices();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      // Campo de pesquisa
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(
                      () {
                        selectedCategory = appData.categories[index];
                      },
                    );
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: appData.categories.length,
            ),
          ),

          //Grid
          Expanded(
            child: !isLoading
                ? GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                    ),
                    itemCount: appData.items.length,
                    itemBuilder: (_, index) {
                      return ItemTile(
                        item: appData.items[index],
                      );
                    },
                  )
                : GridView.count(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                    children: List.generate(
                      10,
                      (index) => CustomShimmer(
                        height: double.infinity,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
