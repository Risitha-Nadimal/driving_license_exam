import 'package:driving_license_exam/component/appbar.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedVehicleIndex = 0;
  int selectedPlanIndex = -1;

  final List<Map<String, dynamic>> vehicleTypes = [
    {"name": "Car", "icon": Icons.directions_car},
    {"name": "Bike", "icon": Icons.motorcycle},
    {"name": "Light", "icon": Icons.local_shipping},
    {"name": "Heavy", "icon": Icons.fire_truck},
    {"name": "Special", "icon": Icons.miscellaneous_services},
  ];

  final List<Map<String, dynamic>> plans = [
    {
      "duration": "3 Month Plan",
      "price": "Rs. 1500",
      "features": [
        "Full access to practice tests",
        "Road rules and signs handbook",
        "Progress tracking"
      ],
      "button": "Select Plan"
    },
    {
      "duration": "6 Month Plan",
      "price": "Rs. 2700",
      "features": [
        "Full access to practice tests",
        "Road rules and signs handbook",
        "Progress tracking",
        "Renewal alerts"
      ],
      "button": "Renew Plan"
    },
    {
      "duration": "1 Year Plan",
      "price": "Rs. 4800",
      "features": [
        "Full access to premium tests",
        "Road rules and signs handbook",
        "Personalized analytics",
        "Progress tracker"
      ],
      "button": "Select Plan"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final selectedVehicle = vehicleTypes[selectedVehicleIndex]["name"];
    const int totalDays = 180; // For 6-month plan
    const int remainingDays = 25;
    const double progress = (totalDays - remainingDays) / totalDays;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appbar(
                size: size,
                bgcolor: const Color(0xffD7ECFE),
                textColor: Colors.black,
                heading: "SUBSCRIPTION"),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 17),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Current Plan",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      Chip(
                        label: const Text("25 days left",
                            style: TextStyle(color: Color(0xff219EBC))),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                              width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "6 Months - Light Vehicle",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Vehicle Type Selector
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text("Select Vehicle Type",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(vehicleTypes.length, (index) {
                    final isSelected = selectedVehicleIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedVehicleIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xffBDE0FE)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(vehicleTypes[index]["icon"],
                                size: 28,
                                color: isSelected
                                    ? const Color(0xff219EBC)
                                    : Colors.blue),
                            const SizedBox(height: 4),
                            Text(
                              vehicleTypes[index]["name"],
                              style: TextStyle(
                                color:
                                    isSelected ? Colors.black : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Subscription Plans
            ...List.generate(plans.length, (index) {
              final plan = plans[index];
              final isSelected = selectedPlanIndex == index;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plan["duration"],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(plan["price"],
                            style: const TextStyle(
                                fontSize: 16, color: Colors.green)),
                        const SizedBox(height: 10),
                        ...plan["features"].map<Widget>((feature) => Row(
                              children: [
                                const Icon(Icons.check_circle,
                                    size: 16, color: Colors.green),
                                const SizedBox(width: 8),
                                Expanded(child: Text(feature)),
                              ],
                            )),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected
                                    ? const Color(0xff219EBC)
                                    : const Color(0xffD7ECFE),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedPlanIndex = index;
                                });
                              },
                              child: Text(plan["button"],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xff219EBC),
                                  )),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
