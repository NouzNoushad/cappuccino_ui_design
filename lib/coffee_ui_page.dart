import 'package:coffee_ui/cappuccino_list.dart';
import 'package:flutter/material.dart';

import 'cappuccino_cart.dart';
import 'cappuccino_details.dart';

class CoffeeUI extends StatefulWidget {
  const CoffeeUI({super.key});

  @override
  State<CoffeeUI> createState() => _CoffeeUIState();
}

class _CoffeeUIState extends State<CoffeeUI> {
  int currentIndex = 0;

  getWidgets(index) {
    switch (index) {
      case 0:
        return const CoffeeHomePage();
      case 1:
        return const CoffeeCart();
      case 2:
        return const Center(
          child: Text(
            'Favorite',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        );
      case 3:
        return const Center(
          child: Text(
            'Notification',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(239, 227, 200, 1),
          unselectedItemColor: const Color.fromRGBO(107, 92, 93, 1),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          ]),
      body: getWidgets(currentIndex),
    );
  }
}

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 5, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'deja',
                          style: TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(107, 92, 93, 1),
                          ),
                        ),
                        Text(
                          'Brew',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromRGBO(239, 227, 200, 1),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.orange,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color.fromRGBO(243, 202, 145, 1),
                        child: Image.asset(
                          'assets/profile.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(23, 16, 23, 1),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromRGBO(239, 227, 200, 1),
                      ),
                      hintText: 'Browse your favourite coffee..',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(107, 92, 93, 1),
                      ),
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(56, 35, 42, 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: TabBar(
                        controller: controller,
                        indicatorColor: Colors.transparent,
                        labelColor: const Color.fromRGBO(239, 227, 200, 1),
                        unselectedLabelColor:
                            const Color.fromRGBO(158, 158, 158, 0.5),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        labelPadding: EdgeInsets.zero,
                        tabs: [
                          'Cappuccino',
                          'Flat White',
                          'Espresson',
                          'Americano',
                          'Latte'
                        ]
                            .map((e) => Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child:
                          TabBarView(controller: controller, children: const [
                        CappuccinoTab(),
                        Center(
                          child: Text(
                            'Flat White',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Espresson',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Americano',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Latte',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CappuccinoTab extends StatelessWidget {
  const CappuccinoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 5,
          ),
          itemCount: cappuccinos.length,
          itemBuilder: (context, index) {
            final cappuccino = cappuccinos[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(54, 44, 54, 1),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // navigates to details page
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => CappuccinoDetails(
                                        cappuccino: cappuccino,
                                      )),
                            );
                          },
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/${cappuccino['image']}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(54, 44, 54, 0.7),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Text(
                                  cappuccino['rating'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Text(
                      cappuccino['name'].toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(70, 61, 70, 1),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '\$${cappuccino['price']}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromRGBO(239, 227, 200, 1),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 30,
                                color: Color.fromRGBO(70, 61, 70, 1),
                              ),
                            ),
                          ]),
                    ),
                  ]),
            );
          }),
    );
  }
}
