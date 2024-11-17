import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/category/model/category_model.dart';
import 'package:snapkart_project/category/provider/category_provider.dart';
import 'package:snapkart_project/category/screen/category_detail_screen.dart';
import 'package:snapkart_project/core/app_util.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getCategory();
    return Scaffold(
      appBar: Util.appBar('Categories'),
      body: Consumer<CategoryProvider>(builder: (context, provider, child) {
        if(provider.categoryList.isEmpty){
          return const Center(child: CircularProgressIndicator());
        }else{
        return ListView.builder(
          itemBuilder: (context, index) {
            CategoryModel items = provider.categoryList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoryDetailScreen(categoryModel: items),
                    ));
              },
              child: Card(
                child: ListTile(
                  title: Text(items.name ?? 'No name'),
                  subtitle: Text(items.sId ?? 'No sId'),
                  trailing: Text(items.iV.toString()),
                ),
              ),
            );
          },
          itemCount: provider.categoryList.length,
        );}
      }),
    );
  }
}
