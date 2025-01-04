import '../../../models/variant_type.dart';
import '../../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/constants.dart';
import '../../../widgets/custom_text_field.dart';

class VariantTypeSubmitForm extends StatelessWidget {
  final VariantType? variantType;

  const VariantTypeSubmitForm({super.key, this.variantType});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    context.variantTypeProvider.setDataForUpdateVariantTYpe(variantType);
    return SingleChildScrollView(
      child: Form(
        key: context.variantTypeProvider.addVariantsTypeFormKey,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          width: size.width * 0.5,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: context.variantTypeProvider.variantNameCtrl,
                      labelText: 'Nome da variante',
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome de variante';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: context.variantTypeProvider.variantTypeCtrl,
                      labelText: 'Tipo de Varinate',
                      onSave: (val) {},
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome de tipo';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: secondaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the popup
                    },
                    child: const Text('Cancelar'),
                  ),
                  const SizedBox(width: defaultPadding),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      // Validate and save the form
                      if (context.variantTypeProvider.addVariantsTypeFormKey
                          .currentState!
                          .validate()) {
                        context.variantTypeProvider.addVariantsTypeFormKey
                            .currentState!
                            .save();
                        context.variantTypeProvider.submitVariantType();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Submeter'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// How to show the category popup
void showAddVariantsTypeForm(BuildContext context, VariantType? variantType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Adicione o Tipo da Variante'.toUpperCase(),
                style: const TextStyle(color: primaryColor))),
        content: VariantTypeSubmitForm(variantType: variantType),
      );
    },
  );
}
