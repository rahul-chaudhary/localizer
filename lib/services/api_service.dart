import 'package:dio/dio.dart';
import 'package:localizer/utils/helpers/debug_print.dart';

final dio = Dio();

Future<String?> fetchTranslateText({required String targetLang,required String text}) async {

  const String url = 'https://openl-translate.p.rapidapi.com/translate';
  const String apiKey = 'f70d5bbb9dmsh886b74511a22846p14ed06jsnb38e6f6085f7';

  try {
    final response = await dio.post(
      url,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'x-rapidapi-key': apiKey,
          // 'x-rapidapi-host': 'openl-translate.p.rapidapi.com'
        }),
      data: {
        'target_lang' : targetLang,
        'text' : text
      }
    );
    if(response.statusCode == 200) {
      String? translateText = response.data['translatedText'];
      if(translateText != null) {
        dbPrint(translateText);
        return translateText;
      }

    }
  } catch(e) {
    rethrow;
  }

  return null;
}