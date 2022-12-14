import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';

Future<Country?> showPickerSheet(BuildContext context) async {
  return await showCountryPickerSheet(
    context,
  );
}
