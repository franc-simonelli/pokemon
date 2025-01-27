import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/models/type_model.dart';

Future<TypeModel?> checkType(String typeCheck) async {
  final typesJson = await sharedPrefsService.getValue<String>(kTypes) ?? '';

  try {
    if (typesJson != '') {
      List<TypeModel> types = TypeModel.decode(typesJson);
      TypeModel type = types.firstWhere(
        (element) => element.name == typeCheck,
      );
      return type;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
