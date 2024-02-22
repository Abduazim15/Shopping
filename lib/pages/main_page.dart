import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_for_job/models/product_model.dart';

import '../models/order_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  Color primaryOrange = Color(int.parse("0xFFFF7011"));
  Color primaryGrey = Color(int.parse("0xFF7B7B7B"));
  Color primaryBack = Color(int.parse('0xFFF0F0F0'));
  List<OrderModel> list = [
    OrderModel(
        title: 'Готов к выдаче',
        description: 'Самовывоз до 29 марта',
        subTitle: 'Заказ №10021122',
        btnTxt: 'Забрать заказ',
        isCheck: true),
    OrderModel(
        title: 'Как вам работа приложения?',
        subTitle: 'Нам важно ваше мнение',
        btnTxt: 'Оценить',
        isCheck: false),
  ];
  List<ProductModel> productOfDay = [
    ProductModel(
        image: "assets/images/playstation.png",
        price: '2 000 000',
        discount: '1 750 000',
        name: 'PlayStation 4'),
    ProductModel(
        image: "assets/images/sofa.png",
        price: '5 000 000',
        discount: '2 750 000',
        name: 'Sofa Pro Max'),
    ProductModel(
        image: "assets/images/vacuumMach.png",
        price: '3 000 000',
        discount: '2 750 000',
        name: 'Электрическая варочная поверхность MAUNFELD EEHE.32.4B'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBack,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text("ORZUGRAND"),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: primaryOrange),
        leading: Icon(
          Icons.location_on_outlined,
          size: 30,
          color: primaryGrey,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset('assets/images/messages.png'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Главная"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Каталог"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined), label: "Корзина"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: "Избранное"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: "Профиль"),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    color: primaryGrey,
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    "Здравствуйте, ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    "Дониёр",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(int.parse("0xFF14A23C"))),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 152,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return recyclerItem(index);
                        }),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: TextField(
                        cursorColor: primaryGrey,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: primaryGrey),
                          fillColor: primaryBack,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          hintText: 'Поиск товаров',
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: primaryGrey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 152,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/offer1.png',
                                        width: 292,
                                        height: 142,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: primaryOrange),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Text(
                            'Все акции',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Товар дня",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Spacer(),
                          Text(
                            "22:33:15",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: primaryGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 303,
                            child: Swiper(
                              indicatorLayout: PageIndicatorLayout.DROP,
                              itemWidth: 349,
                              scrollDirection: Axis.horizontal,
                              itemCount: productOfDay.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  elevation: 5,
                                  color: Colors.white,
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: 303,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            productOfDay[index].image,
                                            height: 186,
                                            width: double.infinity,
                                          ),
                                          Text(
                                            productOfDay[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${productOfDay[index].price} сум",
                                            style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${productOfDay[index].discount} сум',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: primaryOrange),
                                          ),
                                          const SizedBox(height: 20)
                                        ],
                                      )),
                                );
                              },
                              autoplay: true,
                              pagination: const SwiperPagination(),
                              control: const SwiperControl(
                                size: 0,
                              ),
                              layout: SwiperLayout.STACK,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Рекомендуем вам",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    DefaultTabController(
                      length: 3, // Replace with the number of tabs
                      child: Column(
                        children: [
                          TabBar(
                            dividerColor: Colors.transparent,
                            indicatorColor: primaryOrange,
                            labelColor: primaryOrange,
                            isScrollable: true,
                            tabs: const [
                              Tab(text: 'Новинки'),
                              Tab(text: 'Популярное'),
                              Tab(text: 'Скидки + Рассрочка'),
                            ],
                          ),
                          Container(
                            height: 456,
                            width: 329,
                            child: TabBarView(
                              children: [
                                // Content for Tab 1
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        tabItem(0),
                                        tabItem(1),
                                        tabItem(2),
                                        SizedBox(height: 5),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryOrange),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: Center(
                                              child: Text(
                                                'Смотреть все 15',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Content for Tab 2
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        tabItem(0),
                                        tabItem(1),
                                        tabItem(2),
                                        SizedBox(height: 5),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryOrange),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: Center(
                                              child: Text(
                                                'Смотреть все 15',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Content for Tab 3
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        tabItem(2),
                                        tabItem(1),
                                        tabItem(0),
                                        SizedBox(height: 5),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: primaryOrange),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: Center(
                                              child: Text(
                                                'Смотреть все 15',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Row(
                  children: [
                    Text(
                      "ORZU",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color(int.parse("0xFF14A23C"))),
                    ),
                    Text(
                      "BLOG",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: primaryOrange),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 152,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/topOffer.png',
                                  width: 292,
                                  height: 142,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryOrange),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      'Читать все',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 211,
              padding: EdgeInsets.only(top: 50),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
              child: Stack(
                children: [
                  Card(
                    margin: const EdgeInsets.all(16),
                    elevation: 5,
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('У нас всё!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(int.parse("0xFF14A23C")),
                              )),
                          const Text('Хватит листать,\nпереходи в каталог.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              )),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: primaryOrange),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 50),
                              child: Text(
                                'Каталог',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 26, right: 26),
                      child: Image.asset('assets/images/noteImg.png'),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget tabItem(int index) {
    return SizedBox(
      height: 132,
      child: Stack(children: [
        Row(
          children: [
            Image.asset(
              productOfDay[index].image,
              width: 91,
              height: 132,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 9),
                  constraints: const BoxConstraints(
                    maxWidth: 220, // Replace with your desired maximum width
                  ),
                  child: Text(
                    productOfDay[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
                const Spacer(),
                Text(
                  "${productOfDay[index].price} сум",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${productOfDay[index].discount} сум',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryOrange),
                ),
                const SizedBox(height: 20)
              ],
            )
          ],
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 10),
              child: Image.asset('assets/images/shopBtn.png'),
            ))
      ]),
    );
  }

  Widget recyclerItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 292,
        height: 152,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  list[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryOrange),
                ),
                Text(
                  list[index].subTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: primaryGrey),
                ),
                Text(
                  list[index].description ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const Spacer(),
                Container(
                  height: 34,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryOrange),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 18),
                    child: Text(
                      list[index].btnTxt,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/box.png'),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 10.0),
              child: Image.asset('assets/images/tick-square.png'),
            ),
          ),
        ]),
      ),
    );
  }
}
