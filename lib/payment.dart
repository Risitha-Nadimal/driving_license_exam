import 'package:driving_license_exam/component/appbar.dart';
import 'package:driving_license_exam/component/backbutton.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = 'visa';
  double totalFee = 2700.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                appbar(
                    size: size,
                    bgcolor: const Color(0xffD7ECFE),
                    textColor: Colors.black,
                    heading: "PAYMENT"),
                // Credit Card Display
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Santander',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            const SizedBox(height: 24),
                            const Text('1234 5678 9012 3456',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 2)),
                            const SizedBox(height: 12),
                            const Text('06/16',
                                style: TextStyle(color: Colors.white70)),
                            const Text('J DOE',
                                style: TextStyle(color: Colors.white70)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/master.png'),
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Payment Method Title
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Payment method',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 16),

                      // Visa Card Option
                      PaymentOptionTile(
                        icon: Icons.credit_card,
                        label: 'Visa Card',
                        value: 'visa',
                        selectedValue: selectedMethod,
                        onChanged: (val) =>
                            setState(() => selectedMethod = val!),
                      ),

                      // Bank Account Option
                      PaymentOptionTile(
                        icon: Icons.account_balance,
                        label: 'Bank Account',
                        value: 'bank',
                        selectedValue: selectedMethod,
                        onChanged: (val) =>
                            setState(() => selectedMethod = val!),
                      ),

                      const SizedBox(height: 24),

                      // Total Fee
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Fee',
                              style: TextStyle(fontSize: 16)),
                          Text('Rs. ${totalFee.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Pay Now Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff219EBC),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            // Handle payment
                          },
                          child: const Text(
                            'Pay Now',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.22),
                    ],
                  ),
                ),

                // Back Button
                Positioned(bottom: 0, child: backbutton(size: size))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Payment Option Widget
class PaymentOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const PaymentOptionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == selectedValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue.shade50 : Colors.white,
          border: Border.all(color: Colors.blue.shade100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: isSelected ? Colors.blue : Colors.grey),
            const SizedBox(width: 12),
            Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
            Radio<String>(
              value: value,
              groupValue: selectedValue,
              onChanged: onChanged,
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
