// import 'package:callaa_app/features/auth/presentation/pages/Settingpage.dart';
// import 'package:callaa_app/features/auth/presentation/pages/profilepage.dart';
// import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;

//   // final List<String> _pages = [


//   //       AboutPage(),

//   //       ProfilePage(),
//   //       SettingPage(),

     

 
//   // ];

//   bool _isvisible=false;
 
//   final List<_GridItem> gridItems = const [
//     _GridItem(icon: Icons.currency_exchange, 
//     label: "Send Money",),
//     _GridItem(icon: Icons.account_balance_wallet,
//      label: "Wallet"),
//     _GridItem(icon: Icons.history,
//      label: "Transactions"),
//     _GridItem(icon: Icons.payment,
//      label: "Payments"),
//     _GridItem(icon: Icons.mobile_friendly, 
//     label: "Mobile Recharge"),
//     _GridItem(icon: Icons.width_wide_rounded,
//      label: "WithDraw"),
//     _GridItem(icon: Icons.currency_exchange,
//      label: "Currency Exchange"),
//     _GridItem(icon: Icons.flight,
//      label: "Book Flight"),
//     _GridItem(icon: Icons.support_agent, 
//     label: "Support"),
//   ];

  




//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthProvider>(
//       builder: (context, authProvider, child) {
//         final username = authProvider.currentuser?.username ?? "Guest";
//         final balance = authProvider.currentuser?.amount ?? 0.0;

//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Welcome, $username",style: TextStyle(color: Colors.black),),
//             backgroundColor: Colors.yellow,
//           ),
//           body: authProvider.isloading
//               ? const Center(child: CircularProgressIndicator())
//               : SingleChildScrollView(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                      
//                       IconButton(
//                         icon: const Icon(Icons.account_balance_wallet),
//                         onPressed: () {

//                           setState(() {
//                             _isvisible = !_isvisible;
//                           });
//                         },

                         

//                       ),

//                       Visibility(
                        
//                         child: AmountCard(amount: balance),
//                         visible: _isvisible,
//                       ),
//                       const SizedBox(height: 30),

//                       // Grid section
                      
//                       const SizedBox(height: 16),

//                       GridView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: gridItems.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           childAspectRatio: 1,
//                         ),
//                         itemBuilder: (context, index) {
//                           final item = gridItems[index];
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(12),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 2),
//                                 )
//                               ],
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(item.icon, size: 32,
//                                  color: Colors.yellow[800]),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   item.label,
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),


                
//         );
//       },


     
//     );
//   }
// }


// class AmountCard extends StatelessWidget {
//   final double amount;
//   const AmountCard({super.key, 
//   required this.amount});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color.fromARGB(255, 138, 137, 130),
//            Colors.yellowAccent],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Balance",
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 16,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "\$${amount.toStringAsFixed(2)}",
//             style: const TextStyle(
//               color: Colors.black87,
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class _GridItem {
//   final IconData icon;
//   final String label;

//   const _GridItem(
//     {required this.icon,
//    required this.label});
// }


// class BottomNavigationBars extends StatefulWidget {
//   const BottomNavigationBars({super.key});

//   @override
//   State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
// }

// class _BottomNavigationBarsState extends State<BottomNavigationBars> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = const [
//     HomePage(),
//     Profilepage(),
//     SettingPage(),

//     AboutPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },

//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),

//           BottomNavigationBarItem(icon: Icon(Icons.person),
//           label: "About"
          
          
//           )
//         ],
//       ),
//     );
//   }
// }

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:callaa_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  

  bool _showbalance=false;

  String _currentbalance="***";

  int _currentIndex=0;


  
                    Widget showbalanceButton(  String currentbalance){


                      if(_showbalance){


                               return IconButton(
                                        
                                        onPressed: (){

                                          setState(() {
                                            _showbalance=false;
                                            _currentbalance="***ETB";
                                          }
                                          
                                          );
                                        }, 
                                        
                                        icon: Icon(Icons.remove_red_eye)
                                        
                                        );


                                      }

                                      else{

                                        return IconButton(onPressed:(){

                                          setState(() {
                                            
                                            _showbalance=true;
                                            _currentbalance="${currentbalance}ETB";
                                          });
                                        },
                                        
                                         icon:Icon(Icons.visibility_off)
                                         
                                         );
                                      }

                                    }

                                   

                                      
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, AuthProvider, child) {


        if(AuthProvider.isloading){

          return Scaffold(

            body: Center(
             child: CircularProgressIndicator(),
            ),
          );
        }

                 if(AuthProvider.currentuser==null){

                  return Scaffold(
                    body: Center(
                      child: Text("The user is not loeded yet,please try again"),
                    ),
                  );


                 }

                 return Scaffold(

                  bottomNavigationBar: NavigationBar(
                    
                    onDestinationSelected:(int index){
                         setState(() {
                           _currentIndex=index;
                         });

                    },

                    indicatorColor: Colors.amber,

                    selectedIndex: _currentIndex,
                    destinations:  const<Widget>
                    [

                      NavigationDestination(
                        selectedIcon:Icon(Icons.home),
                        icon: Icon(Icons.home_outlined), 
                        label: "Home",
                        
                        ),
                        NavigationDestination(
                        selectedIcon:Icon(Icons.info),
                        icon: Icon(Icons.info_outline), 
                        label: "About",
                        
                        ),
                        NavigationDestination(
                        selectedIcon:Icon(Icons.person),
                        icon: Icon(Icons.person_2_outlined), 
                        label: "Profile",
                        
                        ),
                        NavigationDestination(
                        selectedIcon:Icon(Icons.settings),
                        icon: Icon(Icons.settings_outlined), 
                        label: "Setting",
                        
                        ),
                    ],
                    
                    ),
                    body: SingleChildScrollView(
                        
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Align(
                              alignment: Alignment.center,
                              child: Text(" Chella",
                              style: TextStyle(

                                fontSize: 40,
                                color: Colors.amber,
                              ),
                              
                              ),
                            ),
                            Container(
                                 
                                    width: 500,
                                 height: 400,
                                
                              decoration: BoxDecoration(

                                  color: Colors.amber,
                              ),

                              child: Column(

                                children: [

                                  Text(AuthProvider.currentuser!.fullName,style: TextStyle(

                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                  
                                  ),

                                  SizedBox(height: 30,),

                                  Text("Chella Earnings",style: TextStyle(

                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                  ),

                                  SizedBox(height: 25,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text("Referes"),
                                      
                                    
                                      
                                      
                                      
                                      

                                      Text("..."),
                                       Text("..."),

                                       Text("${AuthProvider.currentuser!.referralCode}",style: TextStyle(
                                      
                                        color: Colors.white,
                                      
                                        fontSize: 30,
                                      ),

                                       

                                       ),


                                      
                                    ],
                                  ),



                                  
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [


                                      Text(_currentbalance,

                                      style: TextStyle(

                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,

                                      ),
                                   
                                  
                                      ),


                                     showbalanceButton("${AuthProvider.currentuser!.amount}"),


                                   

                                    ]



                                     
                                     )
                                ],

                              ),

                              ),

                          

                                   

                                   
                                   
                                   
                                   

                                 
                                   
                                   


                              

                                
                                      
                                      
                         
                                      



                                         
                                    ],
                                   )

                                


                              
                              ),
                            

                            

                        
                          
                        

                  


                 );
        
      },


      
                
              

    );
  }
}
