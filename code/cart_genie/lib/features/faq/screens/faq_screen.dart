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
  Mode _q6 = Mode.question;
  Mode _q7 = Mode.question;
  Mode _q8 = Mode.question;
  Mode _q9 = Mode.question;
  Mode _q10 = Mode.question;
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
                      question: "What is Cart Genie?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q1 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q1 == Mode.answer)
                    AnsText(
                      question: "What is Cart Genie?",
                      answer:
                          "Cart Genie is a revolutionary platform that simplifies your online shopping experience by allowing you to consolidate items from multiple sites into a single shopping cart for streamlined checkout and shipment tracking.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q1 = Mode.question;
                        });
                      },
                      // height: 250,
                    ),
                  const SizedBox(height: 20),
                  if (_q2 == Mode.question)
                    QText(
                      question: "How does Cart Genie work?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q2 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q2 == Mode.answer)
                    AnsText(
                      question: "How does Cart Genie work?",
                      answer:
                          "Cart Genie works by integrating with various online shopping platforms and channels. You simply add items from different sites to your Cart Genie cart, proceed to checkout, and make a single payment for all your purchases. You can then track the shipment of all your orders from one centralized dashboard.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q2 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q3 == Mode.question)
                    QText(
                      question: "Is Cart Genie secure?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q3 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q3 == Mode.answer)
                    AnsText(
                      question: "Is Cart Genie secure?",
                      answer:
                          "Yes, Cart Genie prioritizes the security and privacy of your shopping information. We utilize industry-standard encryption protocols to protect your payment details and personal data.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q3 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q4 == Mode.question)
                    QText(
                      question: "Which online shopping platforms does Cart Genie support?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q4 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q4 == Mode.answer)
                    AnsText(
                      question: "Which online shopping platforms does Cart Genie support?",
                      answer:
                          "Cart Genie supports a wide range of popular online shopping platforms and channels. Our goal is to continually expand our network of supported sites to provide you with the most comprehensive shopping experience possible.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q4 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q5 == Mode.question)
                    QText(
                      question: "Can I use Cart Genie on my mobile device?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q5 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q5 == Mode.answer)
                    AnsText(
                      question: "Can I use Cart Genie on my mobile device?",
                      answer:
                      "Yes, Cart Genie is designed to be mobile-friendly, allowing you to shop and manage your orders conveniently from your smartphone or tablet.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q5 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q6 == Mode.question)
                    QText(
                      question: "How much does Cart Genie cost to use?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q6 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q6 == Mode.answer)
                    AnsText(
                      question: "How much does Cart Genie cost to use?",
                      answer:
                      "Cart Genie is free for users to sign up and use. We may offer premium features or subscription plans in the future, but the basic functionality of consolidating your shopping carts and tracking shipments will always remain free.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q6 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q7 == Mode.question)
                    QText(
                      question: "Does Cart Genie offer customer support?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q7 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q7 == Mode.answer)
                    AnsText(
                      question: "Does Cart Genie offer customer support?",
                      answer:
                      "Yes, we have a dedicated customer support team ready to assist you with any questions or issues you may encounter while using Cart Genie. You can reach out to us via email.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q7 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q8 == Mode.question)
                    QText(
                      question: "Can I return items purchased through Cart Genie?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q8 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q8 == Mode.answer)
                    AnsText(
                      question: "Can I return items purchased through Cart Genie?",
                      answer:
                      "Yes, you can return items purchased through Cart Genie following the return policies of the respective online retailers. We provide guidance and assistance in initiating returns and processing refunds, ensuring a smooth experience for our users.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q8 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q9 == Mode.question)
                    QText(
                      question: "Does Cart Genie offer any rewards or loyalty programs?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q9 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q9 == Mode.answer)
                    AnsText(
                      question: "Does Cart Genie offer any rewards or loyalty programs?",
                      answer:
                      "While we currently do not have a rewards or loyalty program in place, we are exploring opportunities to reward our loyal users with exclusive discounts, special offers, and other perks in the future.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q9 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),
                  if (_q10 == Mode.question)
                    QText(
                      question: "How can I stay updated on new features and developments with Cart Genie?",
                      icon: Icons.keyboard_arrow_down,
                      onPressed: () {
                        setState(() {
                          _q10 = Mode.answer;
                        });
                      },
                      // height: 60,
                    ),
                  if (_q10 == Mode.answer)
                    AnsText(
                      question: "How can I stay updated on new features and developments with Cart Genie?",
                      answer:
                      "You can stay informed about the latest news, updates, and features by subscribing to our newsletter and following us on social media. We regularly share announcements and insights to keep our users in the loop.",
                      icon: Icons.keyboard_arrow_up,
                      onPressed: () {
                        setState(() {
                          _q10 = Mode.question;
                        });
                      },
                      // height: 180,
                    ),
                  const SizedBox(height: 20),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
