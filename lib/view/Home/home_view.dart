import 'package:ecommerceend/constance.dart';
import 'package:ecommerceend/core/view_model/control_view_model.dart';
import 'package:ecommerceend/core/view_model/home_view_model.dart';
import 'package:ecommerceend/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_view.dart';

class HomeView extends StatelessWidget {
  final List<String> nams = <String>[
    's',
    'sw',
    'd',
    'sd',
    'qs',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: ListView(
              children: [
                const _SearchTextFormField(),
                const SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'Categories',
                ),
                const SizedBox(
                  height: 30,
                ),
                _ListViewCategory(nams: nams),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Selling',
                      fontsize: 18,
                    ),
                    CustomText(
                      text: 'See all',
                      fontsize: 16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                _ListViewProducts(nams: nams),
              ],
            
          ),
        ),
      ),
    );
  }
}



class _ListViewProducts extends StatelessWidget {
  const _ListViewProducts({
    Key? key,
    required this.nams,
  }) : super(key: key);

  final List<String> nams;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: nams.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idex) {
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  child: Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.asset(
                        'assets/images/Image.png',
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Leather Wristwatch',
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: 'Tag Heuer',
                  alignment: Alignment.bottomLeft,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: '\$ ${700}',
                  alignment: Alignment.bottomLeft,
                  color: primaryColor,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}

class _ListViewCategory extends StatelessWidget {
  const _ListViewCategory({
    Key? key,
    required this.nams,
  }) : super(key: key);

  final List<String> nams;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: nams.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idex) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/Icon_Mens Shoe.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: nams[idex],
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}

class _SearchTextFormField extends StatelessWidget {
  const _SearchTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
