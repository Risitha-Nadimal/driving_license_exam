import 'package:driving_license_exam/services/http_service.dart';

import '../models/subscription_models.dart';
import 'api_config.dart';

class SubscriptionService {
  static Future<ApiResponse<List<SubscriptionPlan>>> getSubscriptionPlans({
    String? vehicleType,
  }) async {
    String url = '${ApiConfig.subscriptionBaseUrl}/subscription-plans';
    if (vehicleType != null) {
      url += '?vehicle_type=$vehicleType';
    }

    final response = await HttpService.get(url);
    return ApiResponse.fromJson(
      response,
      (data) => (data as List)
          .map((plan) => SubscriptionPlan.fromJson(plan))
          .toList(),
    );
  }

  static Future<ApiResponse<SubscriptionPlan>> getSubscriptionPlan(
      int planId) async {
    final response = await HttpService.get(
        '${ApiConfig.subscriptionBaseUrl}/subscription-plans/$planId');
    return ApiResponse.fromJson(
        response, (data) => SubscriptionPlan.fromJson(data));
  }

  static Future<ApiResponse<UserSubscription>> createSubscription({
    required String userId,
    required int planId,
    String? paymentMethod,
    Map<String, dynamic>? paymentDetails,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.subscriptionBaseUrl}/subscriptions',
      body: {
        'user_id': userId,
        'plan_id': planId,
        if (paymentMethod != null) 'payment_method': paymentMethod,
        if (paymentDetails != null) 'payment_details': paymentDetails,
      },
    );
    return ApiResponse.fromJson(
        response, (data) => UserSubscription.fromJson(data));
  }

  static Future<ApiResponse<List<UserSubscription>>> getUserSubscriptions({
    required String userId,
    String? status,
  }) async {
    String url = '${ApiConfig.subscriptionBaseUrl}/users/$userId/subscriptions';
    if (status != null) {
      url += '?status=$status';
    }

    final response = await HttpService.get(url);
    return ApiResponse.fromJson(
      response,
      (data) =>
          (data as List).map((sub) => UserSubscription.fromJson(sub)).toList(),
    );
  }

  static Future<ApiResponse<UserSubscription>> getSubscription(
      String subscriptionId) async {
    final response = await HttpService.get(
        '${ApiConfig.subscriptionBaseUrl}/subscriptions/$subscriptionId');
    return ApiResponse.fromJson(
        response, (data) => UserSubscription.fromJson(data));
  }

  static Future<ApiResponse<Map<String, dynamic>>> cancelSubscription({
    required String subscriptionId,
    String? reason,
  }) async {
    final response = await HttpService.delete(
      '${ApiConfig.subscriptionBaseUrl}/subscriptions/$subscriptionId',
    );
    return ApiResponse.fromJson(response, (data) => data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> renewSubscription({
    required String subscriptionId,
    String? paymentMethod,
    bool autoRenewal = false,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.subscriptionBaseUrl}/subscriptions/$subscriptionId/renew',
      body: {
        if (paymentMethod != null) 'payment_method': paymentMethod,
        'auto_renewal': autoRenewal,
      },
    );
    return ApiResponse.fromJson(response, (data) => data);
  }
}
