import 'package:ecommerce/utility/extensions.dart';

import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';
import '../../../models/category.dart';
import 'add_category_form.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Todas as categorias",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: Consumer<DataProvider>(
              builder: (context, dataProvider, child) {
                return DataTable(
                  columnSpacing: defaultPadding,
                  // minWidth: 600,
                  columns: const [
                    DataColumn(
                      label: Text("Nome da categoria"),
                    ),
                    DataColumn(
                      label: Text("Data adicionada"),
                    ),
                    DataColumn(
                      label: Text("Editar"),
                    ),
                    DataColumn(
                      label: Text("Excluir"),
                    ),
                  ],
                  rows: List.generate(
                    dataProvider.categories.length,
                    (index) => categoryDataRow(dataProvider.categories[index],
                        delete: () {
                      context.categoryProvider
                          .deleteCategory(dataProvider.categories[index]);
                    }, edit: () {
                      showAddCategoryForm(
                          context, dataProvider.categories[index]);
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

DataRow categoryDataRow(Category CatInfo, {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              CatInfo.image ?? '',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(CatInfo.name ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(CatInfo.createdAt ?? '')),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ))),
    ],
  );
}
