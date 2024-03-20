import 'package:cart_genie/constants/global_variables.dart';
import 'package:cart_genie/features/faq/widgets/ans_text.dart';
import 'package:cart_genie/features/faq/widgets/q_text.dart';
import 'package:flutter/material.dart';
import 'package:cart_genie/common/widgets/background.dart';

enum Mode {
  question,
  answer,
}

class FAQScreen extends StatefulWidget {
  static const String routename = '/faq';
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  Mode _q1 = Mode.question;
  Mode _q2 = Mode.question;
  Mode _q3 = Mode.question;
  Mode _q4 = Mode.question;
  Mode _q5 = Mode.question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.backgroundColor,
            ),
          ),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Container(
              //   height: 100,
              //   padding: const EdgeInsets.only(left: 05, right: 145, top: 40),
              //   child: Icon(Icons.arrow_back),
              // ),
              Container(
                height: 100,
                padding: const EdgeInsets.only(top: 40, left: 110, right: 50),
                alignment: Alignment.topLeft,
                child: Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Semicircle(
                radius: 325, // Adjust the height as per your requirement
                color: GlobalVariables
                    .greyBackgroundColor, // Set the color of the semicircle
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 40, 25, 0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  if (_q1 == Mode.question)
                    QText(
                      question: "Who Are We ??",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q1 = Mode.answer;
                        });
                      },
                      height: 60,
                    ),
                  if (_q1 == Mode.answer)
                    AnsText(
                      question: "Who Are We ?",
                      answer:
                          "Cart Genie addresses the problem of tracking deliveries and returns across\n multiple e-commerce platforms. Our application will address this problem by scraping details\n from text messages and provide an organized infographic.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q1 = Mode.question;
                        });
                      },
                      height: 250,
                    ),
                  const SizedBox(height: 20),
                  if (_q2 == Mode.question)
                    QText(
                      question: "Contributors",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q2 = Mode.answer;
                        });
                      },
                      height: 60,
                    ),
                  if (_q2 == Mode.answer)
                    AnsText(
                      question: "Contributors",
                      answer:
                          " Hardik Kalia\n Chinmay Sharma\n Kushagra Dhingra\n Samagra Bharti ",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q2 = Mode.question;
                        });
                      },
                      height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q3 == Mode.question)
                    QText(
                      question: "Lorem Ipsum",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q3 = Mode.answer;
                        });
                      },
                      height: 60,
                    ),
                  if (_q3 == Mode.answer)
                    AnsText(
                      question: "Lorem Ipsum",
                      answer:
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q3 = Mode.question;
                        });
                      },
                      height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q4 == Mode.question)
                    QText(
                      question: "Lorem Ipsum",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q4 = Mode.answer;
                        });
                      },
                      height: 60,
                    ),
                  if (_q4 == Mode.answer)
                    AnsText(
                      question: "Lorem Ipsum",
                      answer:
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q4 = Mode.question;
                        });
                      },
                      height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q5 == Mode.question)
                    QText(
                      question: "Lorem Ipsum",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q5 = Mode.answer;
                        });
                      },
                      height: 60,
                    ),
                  if (_q5 == Mode.answer)
                    AnsText(
                      question: "Lorem Ipsum",
                      answer:
                          " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q5 = Mode.question;
                        });
                      },
                      height: 180,
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
