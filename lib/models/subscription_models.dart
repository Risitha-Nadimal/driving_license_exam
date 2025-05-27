class SubscriptionPlan {
  final int id;
  final String name;
  final int durationMonths;
  final double price;
  final String currency;
  final String vehicleType;
  final String? description;
  final List<String> features;
  final bool isPopular;
  final bool isActive;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.durationMonths,
    required this.price,
    required this.currency,
    required this.vehicleType,
    this.description,
    required this.features,
    required this.isPopular,
    required this.isActive,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      name: json['name'],
      durationMonths: json['duration_months'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      vehicleType: json['vehicle_type'],
      description: json['description'],
      features: List<String>.from(json['features'] ?? []),
      isPopular: json['is_popular'] ?? false,
      isActive: json['is_active'] ?? true,
    );
  }
}

class UserSubscription {
  final String subscriptionId;
  final SubscriptionPlan plan;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final int daysRemaining;
  final bool isExpired;
  final bool autoRenewal;
  final double amountPaid;
  final DateTime createdAt;

  UserSubscription({
    required this.subscriptionId,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.daysRemaining,
    required this.isExpired,
    required this.autoRenewal,
    required this.amountPaid,
    required this.createdAt,
  });

  factory UserSubscription.fromJson(Map<String, dynamic> json) {
    return UserSubscription(
      subscriptionId: json['subscription_id'],
      plan: SubscriptionPlan.fromJson(json['plan']),
      status: json['status'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      daysRemaining: json['days_remaining'],
      isExpired: json['is_expired'],
      autoRenewal: json['auto_renewal'],
      amountPaid: json['amount_paid'].toDouble(),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
