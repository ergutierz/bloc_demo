import 'package:drift/drift.dart';

import '../persistence/app_database.dart';

class ProductRepository {

  final AppDatabase database;

  ProductRepository(this.database);

  Future<List<ProductData>> getProducts() async {
    return await database.select(database.product).get();
  }

  Future<int> insertProduct(ProductData productData) async {
    return await database.into(database.product).insert(productData);
  }

  Future<bool> updateProduct(ProductData productData) async {
    return await database.update(database.product).replace(productData);
  }

  Future<int> deleteProduct(ProductData productData) async {
    return await database.delete(database.product).delete(productData);
  }

  Future<int> deleteAllProducts() async {
    return await (database.delete(database.product)..where((_) => const Constant(true))).go();
  }


  Future<void> insertProducts(List<ProductCompanion> productDataList) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(database.product, productDataList);
    });
  }

  Future<void> updateProducts(List<ProductCompanion> productDataList) async {
    await database.batch((batch) {
      for (var productCompanion in productDataList) {
        batch.update(
          database.product,
          productCompanion,
          where: (tbl) => tbl.id.equals(productCompanion.id.value),
        );
      }
    });
  }


  Future<void> deleteProducts(List<int> productIds) async {
    await database.batch((batch) {
      for (var id in productIds) {
        batch.deleteWhere(database.product, (tbl) => tbl.id.equals(id));
      }
    });
  }
}