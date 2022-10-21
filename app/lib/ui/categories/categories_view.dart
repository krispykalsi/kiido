import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../data/model/category.dart';
import '../../state/categories_view_state.dart';
import '../common/loading_indicator.dart';
import 'categories_grid_tile.dart';

class CategoriesView extends ConsumerWidget {
  const CategoriesView({Key? key}) : super(key: key);

  static const routeName = "categories";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(
      CategoriesViewState.provider.select((state) => state.categories),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: categories.when(
        data: (categories) {
          return Column(
            children: [
              SfCircularChart(
                palette: const [
                  Color(0xFF63E0D8),
                  Color(0xFFec78be),
                  Color(0xFF5991e5),
                ],
                legend: Legend(isVisible: true),
                series: [
                  DoughnutSeries<Category, String>(
                    dataSource: categories,
                    xValueMapper: (category, _) => category.name,
                    yValueMapper: (category, _) => category.numberOfThings,
                    dataLabelMapper: (category, _) =>
                        category.numberOfThings.toString(),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  )
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 180,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoriesGridTile(category);
                  },
                ),
              ),
            ],
          );
        },
        error: (e, s) => Center(child: Text(e.toString())),
        loading: () => const LoadingIndicator(),
      ),
    );
  }
}
