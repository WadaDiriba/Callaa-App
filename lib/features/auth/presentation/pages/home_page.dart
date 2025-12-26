import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:callaa_app/features/task/presantion/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_GridItem> gridItems = const [
    _GridItem(icon: Icons.currency_exchange, label: "Send Money"),
    _GridItem(icon: Icons.account_balance_wallet, label: "Wallet"),
    _GridItem(icon: Icons.history, label: "Withdraw"),
    _GridItem(icon: Icons.payment, label: "Payments"),
    _GridItem(icon: Icons.mobile_friendly, label: "Mobile Recharge"),
    _GridItem(icon: Icons.width_wide_rounded, label: "WithDraw"),
    _GridItem(icon: Icons.currency_exchange, label: "Currency Exchange"),
    _GridItem(icon: Icons.flight, label: "Book Flight"),
    _GridItem(icon: Icons.support_agent, label: "Support"),
  ];

  bool _showBalance = false;
  String _currentBalance = "***";
  int _currentIndex = 0;

  Widget showBalanceButton(String currentBalance) {
    if (_showBalance) {
      return IconButton(
        onPressed: () {
          setState(() {
            _showBalance = false;
            _currentBalance = "***ETB";
          });
        },
        icon: const Icon(Icons.remove_red_eye),
      );
    } else {
      return IconButton(
        onPressed: () {
          setState(() {
            _showBalance = true;
            _currentBalance = "$currentBalance ETB";
          });
        },
        icon: const Icon(Icons.visibility_off),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isloading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (authProvider.currentuser == null) {
          return const Scaffold(
            body: Center(
              child: Text("The user is not loaded yet, please try again"),
            ),
          );
        }

        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            indicatorColor: Colors.amber,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.info),
                icon: Icon(Icons.info_outline),
                label: "About",
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_2_outlined),
                label: "Profile",
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings_outlined),
                label: "Setting",
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),

                const Text(
                  "Chella",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.amber,
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  width: 380,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        authProvider.currentuser!.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "Chella Earnings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Referes"),
                          const SizedBox(width: 10),
                          Text(
                            "${authProvider.currentuser!.referralCode}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentBalance,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          showBalanceButton(
                           "${authProvider.currentuser!.amount}",
                          ),

                          
                        ],

                      
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                            Text("Chella",
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 20,
                            ),
                            )
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: gridItems.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 1,
  ),
  itemBuilder: (context, index) {
    final item = gridItems[index];

    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => TaskPage()));
            break;

          case 1:
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (_) => WalletPage()));
            break;

          case 2:
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (_) => WithdrawPage()));
            break;

          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${item.label} clicked"),
              ),
            );
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 32,
              color: Colors.yellow[800],
            ),
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

class _GridItem {
  final IconData icon;
  final String label;

  const _GridItem({
    required this.icon,
    required this.label,
  });
}
