import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final String baseUrl;
  final http.Client httpClient;
  String? token; // optional for auth

  ApiClient({required this.baseUrl, http.Client? client}) : httpClient = client ?? http.Client();

  Future<void> authenticate(String username, String password) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/auth/login'),
      body: jsonEncode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      token = jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to authenticate');
    }
  }

  Future<List<dynamic>> fetchPurchaseOrders() async {
    final response = await httpClient.get(
      Uri.parse('$baseUrl/purchase-orders'),
      headers: token != null ? {'Authorization': 'Bearer $token'} : {},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch purchase orders');
    }
  }

  Future<void> syncInvoiceData(Map<String, dynamic> invoiceData) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/invoices/sync'),
      body: jsonEncode(invoiceData),
      headers: {  
        'Content-Type': 'application/json',  
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sync invoice data');
    }
  }
}