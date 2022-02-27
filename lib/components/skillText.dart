import 'package:flutter/material.dart';
import 'package:shramik/widget/small_text.dart';

Widget skillText(List<String> strings) {
  return Container(
    margin: const EdgeInsets.only(left: 50),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings
            .map((item) => Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                              text: item,
                              size: 16,
                              fontWeight: FontWeight.w700),
                          const SizedBox(
                            width: 2,
                          ),
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.redAccent,
                                size: 15,
                              ),
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
                ))
            .toList()),
  );
}
