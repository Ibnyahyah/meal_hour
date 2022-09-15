import 'dart:async';
import 'package:path/path.dart' as p;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = './about__247chops';
  const AboutScreen({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCallOrSendMail(
      String phoneNumber, String scheme) async {
    final Uri launchUri = Uri(
      scheme: scheme,
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About 247Chops'),
        elevation: 0,
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Our Story',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Text(
                '247chops cakes and confectionery is an online catering shop that specializes in cake and varieties of delicious fingerfoods, cakes and smallchops for corporate event, get together and for home consumptions. They provide sumptuous finger foods with exquisite taste and quality presentation that are quite affordable',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'About us',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Text(
                '247chops_NG provides sumptuous finger foods such as small chops, yummy and delicious chinchin and other snacks with exquisite taste and quality presentation. They are quite affordable.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Contact Information',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Address: House 6, Agba-dam Link Road, GRA Ilorin.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _makePhoneCallOrSendMail(
                            '247chops@gmail.com', 'mailto');
                      },
                      child: const Text(
                        'Email: 247chops@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _makePhoneCallOrSendMail('+2348160306274', 'tel');
                      },
                      child: const Text(
                        'Tel: +234 816 030 6274',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Social Network',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            _launchInBrowser(
                              Uri(
                                scheme: 'https',
                                host: 'twitter.com',
                                path: '/247chops_ng',
                              ),
                            );
                          },
                          child:
                              Image.asset('./assets/icons/twitter_icons.png'),
                        ),
                        InkWell(
                          onTap: () {
                            _launchInBrowser(
                              Uri(
                                scheme: 'https',
                                host: 'facebook.com',
                                path: '/247chops',
                              ),
                            );
                          },
                          child:
                              Image.asset('./assets/icons/facebook_icons.png'),
                        ),
                        InkWell(
                          onTap: () {
                            _launchInBrowser(
                              Uri(
                                scheme: 'https',
                                host: 'instagram.com',
                                path: '/247chopsN',
                              ),
                            );
                          },
                          child:
                              Image.asset('./assets/icons/instagram_icons.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Divider(
                  color: Colors.black,
                ),
              ),
              const Text(
                'Developer and Application',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Text(
                'This application is built by whitecoode, in collaboration with ibroaheem as the backend developer.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: const Text(
                  'Contact Developer:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              Column(children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Text('Social:'),
                      InkWell(
                        onTap: () {
                          _launchInBrowser(
                            Uri(
                              scheme: 'https',
                              host: 'twitter.com',
                              path: '/whitecoode',
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            const Text(
                              ' @whitecoode',
                            ),
                            Image.asset(
                              './assets/icons/twitter_icons.png',
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      const Text('Email:'),
                      InkWell(
                        onTap: () {
                          _makePhoneCallOrSendMail(
                            'yahyahridwan665@gmail.com',
                            'mailto',
                          );
                        },
                        child: const Text(' Yahyahridwan665@gmail.com'),
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  'Application version: 1.0',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black45,
        child: const Text('Rate'),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
