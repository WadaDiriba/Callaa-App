import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isvisible=false;
 
  final List<_GridItem> gridItems = const [
    _GridItem(icon: Icons.currency_exchange, 
    label: "Send Money",),
    _GridItem(icon: Icons.account_balance_wallet,
     label: "Wallet"),
    _GridItem(icon: Icons.history,
     label: "Transactions"),
    _GridItem(icon: Icons.payment,
     label: "Payments"),
    _GridItem(icon: Icons.mobile_friendly, 
    label: "Mobile Recharge"),
    _GridItem(icon: Icons.width_wide_rounded,
     label: "WithDraw"),
    _GridItem(icon: Icons.currency_exchange,
     label: "Currency Exchange"),
    _GridItem(icon: Icons.flight,
     label: "Book Flight"),
    _GridItem(icon: Icons.support_agent, 
    label: "Support"),
  ];




  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final username = authProvider.currentuser?.username ?? "Guest";
        final balance = authProvider.currentuser?.amount ?? 0.0;

        return Scaffold(
          appBar: AppBar(
            title: Text("Welcome, $username",style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.yellow,
          ),
          body: authProvider.isloading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      IconButton(
                        icon: const Icon(Icons.account_balance_wallet),
                        onPressed: () {

                          setState(() {
                            _isvisible = !_isvisible;
                          });
                        },

                         

                      ),

                      Visibility(
                        
                        child: AmountCard(amount: balance),
                        visible: _isvisible,
                      ),
                      const SizedBox(height: 30),

                      // Grid section
                      Align(
                        alignment: Alignment.center,
                        child: const Text(
                          "Quick Actions you can Do",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: gridItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final item = gridItems[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(item.icon, size: 32,
                                 color: Colors.yellow[800]),
                                const SizedBox(height: 8),
                                Text(
                                  item.label,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}


class AmountCard extends StatelessWidget {
  final double amount;
  const AmountCard({super.key, 
  required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 138, 137, 130),
           Colors.yellowAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Balance",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class _GridItem {
  final IconData icon;
  final String label;

  const _GridItem(
    {required this.icon,
   required this.label});
}
