import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/models/type_model.dart';

saveType(TypeModel newType) async {
  List<TypeModel> types = [];
  final typesJson = await sharedPrefsService.getValue<String>(kTypes) ?? '';

  if (typesJson != '') {
    final typesSP = TypeModel.decode(typesJson);
    types.addAll(typesSP);
    types.add(newType);
  } else {
    types.add(newType);
  }

  final String encodeData = TypeModel.encode(types);
  await sharedPrefsService.removeValue(kTypes);
  await sharedPrefsService.setValue<String>(kTypes, encodeData);
}
