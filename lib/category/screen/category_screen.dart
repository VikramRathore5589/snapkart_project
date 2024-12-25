import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snapkart_project/category/model/category_model.dart';
import 'package:snapkart_project/category/provider/category_provider.dart';
import 'package:snapkart_project/web/web_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {

    super.initState();
    getCategory();
  }

  Future getCategory() async {
    CategoryProvider categoryProvider = Provider.of(context, listen: false);
    await categoryProvider.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(builder: (context, provider, child) {
        if (provider.categoryList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return LayoutBuilder(builder: (context, constraint) {
            bool isWeb = constraint.maxWidth > 600;
            if (isWeb) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                    const WebAppBar(),
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: provider.categoryList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10,
                              crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            CategoryModel model = provider.categoryList[index];
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Text(model.name ?? 'No name found'),
                                    Text(model.iV.toString()),
                                    Text(model.sId.toString())
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: provider.categoryList.length,
                  itemBuilder: (context, index) {
                    CategoryModel model = provider.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(model.name ?? 'No name found'),
                          subtitle: Row(
                            children: [
                              const Text('sId:'),
                              Text(model.sId.toString())
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          });
        }
      }),
    );
  }
}
