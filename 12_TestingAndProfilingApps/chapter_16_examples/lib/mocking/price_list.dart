import 'package:http/http.dart' as http;

class PriceList {

  static const _source =  "https://someapi/get/prices";

  Future<String> queryPrices(http.Client client) async {

    final response = await client.get(_source);

    if(response.statusCode == 200) {
      return response.body;
    }

    return '{}';

  }


}