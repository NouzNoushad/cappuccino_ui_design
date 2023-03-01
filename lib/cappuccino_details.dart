import 'package:coffee_ui/cappuccino_list.dart';
import 'package:flutter/material.dart';

class CappuccinoDetails extends StatefulWidget {
  final cappuccino;
  const CappuccinoDetails({super.key, this.cappuccino});

  @override
  State<CappuccinoDetails> createState() => _CappuccinoDetailsState();
}

class _CappuccinoDetailsState extends State<CappuccinoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(32, 21, 32, 1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/${widget.cappuccino['image']}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cappuccino',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // favorite
                                  setState(() {
                                    widget.cappuccino['favorite'] =
                                        !widget.cappuccino['favorite'];
                                  });
                                },
                                child: widget.cappuccino['favorite']
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 35,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.cappuccino['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    widget.cappuccino['rating'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'A single espresso shot poured into hot foamy milk with the surface topped with mildly sweetened coca powder and drizzled with scrumptious caramel syrup',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white70,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choice of Milk',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: choiceMilk.length,
                              itemBuilder: (context, index) {
                                final milk = choiceMilk[index];
                                return GestureDetector(
                                  onTap: () {
                                    // choose milk by clicking
                                    setState(() {
                                      milk['selected'] = !milk['selected'];
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // change background color
                                      color: milk['selected']
                                          ? const Color.fromRGBO(
                                              239, 227, 200, 1)
                                          : Colors.transparent,
                                      border: Border.all(
                                          width: 1.8,
                                          color: const Color.fromRGBO(
                                              239, 227, 200, 1)),
                                    ),
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      milk['name'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        // change text color
                                        color: milk['selected']
                                            ? const Color.fromRGBO(
                                                32, 21, 32, 1)
                                            : const Color.fromRGBO(
                                                239, 227, 200, 1),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                '\$${widget.cappuccino['price']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(239, 227, 200, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Text(
                                  'Buy now'.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(32, 21, 32, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
