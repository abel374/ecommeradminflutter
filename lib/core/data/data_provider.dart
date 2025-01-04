import 'dart:convert';

import '../../models/api_response.dart';
import '../../models/coupon.dart';
import '../../models/my_notification.dart';
import '../../models/order.dart';
import '../../models/poster.dart';
import '../../models/product.dart';
import '../../models/variant_type.dart';
import '../../services/http_services.dart';
import '../../utility/snack_bar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:get/get.dart';
import '../../../models/category.dart';
import '../../models/brand.dart';
import '../../models/sub_category.dart';
import '../../models/variant.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();

  List<Category> _allCategories = [];
  List<Category> _filteredCategories = [];
  List<Category> get categories => _filteredCategories;

  List<SubCategory> _allSubCategories = [];
  List<SubCategory> _filteredSubCategories = [];

  List<SubCategory> get subCategories => _filteredSubCategories;

  List<Brand> _allBrands = [];
  List<Brand> _filteredBrands = [];
  List<Brand> get brands => _filteredBrands;

  List<VariantType> _allVariantTypes = [];
  List<VariantType> _filteredVariantTypes = [];
  List<VariantType> get variantTypes => _filteredVariantTypes;

  List<Variant> _allVariants = [];
  List<Variant> _filteredVariants = [];
  List<Variant> get variants => _filteredVariants;

  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  List<Product> get products => _filteredProducts;

  List<Coupon> _allCoupons = [];
  List<Coupon> _filteredCoupons = [];
  List<Coupon> get coupons => _filteredCoupons;

  List<Poster> _allPosters = [];
  List<Poster> _filteredPosters = [];
  List<Poster> get posters => _filteredPosters;

  List<Order> _allOrders = [];
  List<Order> _filteredOrders = [];
  List<Order> get orders => _filteredOrders;

  List<MyNotification> _allNotifications = [];
  List<MyNotification> _filteredNotifications = [];
  List<MyNotification> get notifications => _filteredNotifications;

  DataProvider() {
    getAllCategory();
  }

//Oter todas as categorias

  Future<List<Category>> getAllCategory({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'categories');
      if (response.isOk) {
        ApiResponse<List<Category>> apiResponse =
            ApiResponse<List<Category>>.fromJson(
          response.body,
          (json) =>
              (json as List).map((item) => Category.fromJson(item)).toList(),
        );
        _allCategories = apiResponse.data ?? [];
        _filteredCategories = List.from(
            _allCategories); // Inicializa lista filtrada com todos os dados
        notifyListeners();
        if (showSnack) SnackBarHelper.showSuccessSnackBar(apiResponse.message);
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow;
    }
    return _filteredCategories;
  }

//Filtro Categorias  <>

  void fillterCateories(String keyword) {
    if (keyword.isEmpty) {
      _filteredCategories = List.from(_allCategories);
    } else {
      final lowerkeyword = keyword.toLowerCase();
      _filteredCategories = _allCategories.where((category) {
        return (category.name ?? '').toLowerCase().contains(lowerkeyword);
      }).toList();
    }
    notifyListeners();
  }

//TODO: deve concluir obter todas as subcategorias  <>

//TODO: deve concluir o filtro Subcategorias  <>

//TODO: deve concluir obter todas as marcas

//TODO: deve concluir o filtro Marcas

//TODO: deve concluir obter todos os tipos de variantes

//TODO: deve concluir o filtro Tipos de variantes

//TODO: deve concluir obter todas as variantes

//TODO: deve concluir o filtro Variantes

//TODO: deve concluir obter todos os produtos

//TODO: deve concluir o filtro Produtos

//TODO: deve concluir obter todos os cupons

//TODO: deve concluir o filtro Cupons

//TODO: deve concluir obter todos os pôsteres

//TODO: deve concluir o filtro Pôsteres

//TODO: deve concluir obter todas as notificações

//TODO: deve concluir o filtro Notificações

//TODO: deve concluir obter todos os pedidos

//TODO: deve concluir o filtro Pedidos

//TODO: deve concluir calcular pedidos com Status

//TODO: deve concluir o filtro Produtos por Quantidade

//TODO: deve concluir o cálculo Produto com Quantidade
}
