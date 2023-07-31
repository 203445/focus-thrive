import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stripe_checkout/stripe_checkout.dart';

class StripeService {
  static String secretKey =
      "sk_test_51NYzf2Btg6Ugy2o9ZRB87y6FHC5yAIrUXFq0L2qBM1u8OBf6mse1D0R9C05afFhZjh2om8LHEpereEJ563r5VxSu00pwbf359e";
  static String publishKey =
      "pk_test_51NYzf2Btg6Ugy2o90hAAUw8IdvDp9f4OF4cdWIK7GQNr60yx4YJVgaRjt2s3yduD91zrUkBKXudDpkIyd0uh0dmy00cZlUDxpr";

  static Future<dynamic> createCheckoutSession(
      List<dynamic> productItems, totalAmount) async {
    final url = Uri.parse("https://api.stripe.com/v1/checkout/sessions");

    String lineItems = "";
    int index = 0;

    productItems.forEach((val) {
      var productPrice = (val["productPrice"] * 100).round().toString();
      lineItems +=
          "&line_items[$index][price_data][product_data][name]=${val['productName']}";
      lineItems += "&line_items[$index][price_data][unit_amount]=$productPrice";
      lineItems += "&line_items[$index][price_data][currency]=MXN";
      lineItems += "&line_items[$index][quantity]=${val['qty'].toString()}";
      index++;
    });
    final response = await http.post(url,
        body:
            'success_url=https://checkout.stripe.dev/success&mode=payment$lineItems',
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
    return json.decode(response.body)["id"];
  }

  static Future<dynamic> stripePaymentCheckout(
      productItems, subTotal, context, mounted,
      {onSuccess, onCancel, onError}) async {
    final String sessionId =
        await createCheckoutSession(productItems, subTotal);
    final result = await redirectToCheckout(
        context: context,
        sessionId: sessionId,
        publishableKey: publishKey,
        successUrl: "https://checkout.stripe.dev/success",
        canceledUrl: "https://checkout.stripe.dev/cancel");

    if (mounted) {
      final text = result.when(
          redirected: () => 'Redirected Successfuly',
          success: () => onSuccess(),
          canceled: () => onCancel(),
          error: (e) => onError(e));
      return text;
    }
  }
}
