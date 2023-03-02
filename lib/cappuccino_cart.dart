import 'package:coffee_ui/cappuccino_list.dart';
import 'package:flutter/material.dart';

class CoffeeCart extends StatelessWidget {
  const CoffeeCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Cart',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                }),
                itemCount: cappuccinos.length,
                itemBuilder: (context, index) {
                  final cart = cappuccinos[index];
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(54, 44, 54, 1),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/${cart['image']}',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Cappuccino',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    cart['name'],
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$${cart['price']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ]),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(239, 227, 200, 1),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color.fromRGBO(54, 44, 54, 1),
                                ),
                              ),
                              const Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(239, 227, 200, 1),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(54, 44, 54, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomDottedDivider(),
                    Stack(
                      children: [
                        Container(
                          height: 50,
                          color: const Color.fromRGBO(56, 35, 42, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Apply Coupon Code',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white70,
                                  size: 20,
                                )
                              ]),
                        ),
                        const Positioned(
                            left: -8,
                            top: 15,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(32, 21, 32, 1),
                            )),
                        const Positioned(
                            right: -8,
                            top: 15,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(32, 21, 32, 1),
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Delivery Charges',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              '\$49',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Taxes',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              '\$64.87',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomDottedDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Grand Total',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$1009.87',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(239, 227, 200, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          'Pay now'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(32, 21, 32, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class CustomDottedDivider extends StatelessWidget {
  const CustomDottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(400 ~/ 10, (index) {
      return Expanded(
        child: Container(
          color: index % 2 == 0 ? Colors.transparent : Colors.grey,
          height: 1.5,
        ),
      );
    }));
  }
}
