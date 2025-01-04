import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/api_response.dart';
import '../../../models/variant_type.dart';
import '../../../services/http_services.dart';
import '../../../utility/snack_bar_helper.dart';

class VariantsTypeProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final DataProvider _dataProvider;

  final addVariantsTypeFormKey = GlobalKey<FormState>();
  TextEditingController variantNameCtrl = TextEditingController();
  TextEditingController variantTypeCtrl = TextEditingController();

  VariantType? variantTypeForUpdate;

  VariantsTypeProvider(this._dataProvider);

  //addVariatType
  addVariantType() async {
    try {
      Map<String, dynamic> variantType = {
        'name': variantNameCtrl.text,
        'type': variantTypeCtrl.text
      };

      final response = await service.addItem(
          endpointUrl: 'variantTypes', itemData: variantType);

      if (response.isOk) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.body, null);

        if (apiResponse.success == true) {
          clearFields();
          SnackBarHelper.showSuccessSnackBar(
              'Tipo de Variante adicionada com Sucesso');
          _dataProvider.getAllVariantType();
          print('Tipo de Variante adicionada');
        } else {
          SnackBarHelper.showErrorSnackBar(
              'Falha ao adicionar Tipo de Variante: ${apiResponse.message}');
        }
      } else {
        SnackBarHelper.showErrorSnackBar(
            'Erro ${response.body?['message'] ?? response.statusText}');
      }
    } catch (e) {
      print(e);
      SnackBarHelper.showErrorSnackBar('An error ocurred: $e');
      return;
    }
  }

  updateVariantType() async {
    try {
      if (variantTypeForUpdate != null) {
        Map<String, dynamic> variantType = {
          'name': variantNameCtrl.text,
          'type': variantTypeCtrl.text
        };
        final response = await service.updateItem(
            endpointUrl: 'variantTypes',
            itemData: variantType,
            itemId: variantTypeForUpdate?.sId ?? '');

        if (response.isOk) {
          ApiResponse apiResponse = ApiResponse.fromJson(response.body, null);
          if (apiResponse.success == true) {
            clearFields();
            SnackBarHelper.showSuccessSnackBar('Tipo de Variante Atualizado');
            print('Tipo de Variante Atualizado');
            _dataProvider.getAllVariantType();
          } else {
            SnackBarHelper.showErrorSnackBar(
                'Falha ao atualizar a Tipo de Variante: ${apiResponse.message}');
          }
        } else {
          SnackBarHelper.showErrorSnackBar(
              'Erro ${response.body?['message'] ?? response.statusText}');
        }
      }
    } catch (e) {
      print(e);
      SnackBarHelper.showErrorSnackBar('An error ocurred: $e');
    }
  }

  //Delete Marca
  deleteVarientType(VariantType variantType) async {
    try {
      Response response = await service.deleteItem(
          endpointUrl: 'variantTypes', itemId: variantType.sId ?? '');

      if (response.isOk) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.body, null);
        if (apiResponse.success == true) {
          SnackBarHelper.showSuccessSnackBar(
              'Tipo de Variante Excluída com Sucesso');
          _dataProvider.getAllVariantType();
        }
      } else {
        SnackBarHelper.showErrorSnackBar(
            'Erro ${response.body?['message'] ?? response.statusText}');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //Submitvariante
  submitVariantType() {
    if (variantTypeForUpdate != null) {
      updateVariantType();
    } else {
      addVariantType();
    }
  }

  setDataForUpdateVariantTYpe(VariantType? variantType) {
    if (variantType != null) {
      variantTypeForUpdate = variantType;
      variantNameCtrl.text = variantType.name ?? '';
      variantTypeCtrl.text = variantType.type ?? '';
    } else {
      clearFields();
    }
  }

  clearFields() {
    variantNameCtrl.clear();
    variantTypeCtrl.clear();
    variantTypeForUpdate = null;
  }
}
