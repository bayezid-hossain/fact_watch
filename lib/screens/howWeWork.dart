import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:fact_watch/functions/constants.dart';
import 'package:flutter_html/style.dart';

import '../functions/functionalities.dart';
class HowWeWork extends StatelessWidget {
  final EdgeInsets paddingInsets=EdgeInsets.only(right: 5,left:5);
  final EdgeInsets imageInsets=EdgeInsets.all(10);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: Scaffold(

        appBar:  TabBar(

          tabs: [
            Tab(
              child: Text("বাংলা",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'BalooDa2'),),

            ),Tab(
              child: Text("English",style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'BalooDa2'),),
            )
          ],
        ),
        body: TabBarView(

          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5,0,0,0),
                child:  Column(
                  children: [Html(
                    data: howWeWorkBanglaDescription,
                    onLinkTap: (url,_,__,___) {
                      Functionalities.launchURL(url!);
                    },
                    style: {
                      // tables will have the below background color
                      "table": Style(

                        backgroundColor: Colors.white,
                        //width: 1000,

                        width:MediaQuery. of(context). size. width,
                        border: Border.all(color: Colors.white),
                        padding: EdgeInsets.symmetric(vertical: 0),
                        margin: EdgeInsets.symmetric(vertical:0),
                        wordSpacing: 0,
                        letterSpacing: 0.1,
                        //width: double.maxFinite,
                        alignment: Alignment.topRight,
                      ),
                      // some other granular customizations are also possible
                      "tr": Style(

                        alignment: Alignment.center,
                        //width: double.infinity,
                      ),
                      "td": Style(
                        padding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        alignment: Alignment.center,
                        //width: double.maxFinite,
                      ),
                      "p": Style(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                      ),
                      "img": Style(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      "a": Style(
                        color: Colors.black,
                      ),
                        'li':Style(
                          fontFamily: "Kalpurush",
                        ),

                        'h1':Style(
                            fontFamily: "BalooDa2"
                        ),
                        'h2':Style(
                            fontFamily: "BalooDa2"
                        ),
                        'h3':Style(
                            fontFamily: "BalooDa2"
                        ),
                        'h4':Style(
                            fontFamily: "BalooDa2"
                        ),
                        'h5':Style(
                          fontFamily: "BalooDa2",
                        ),

                    },
                    //blacklistedElements: ['width'],

                  ),
                  Table(

                    children: [
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact1.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("সত্য",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),child: Text("সংবাদের দাবির পক্ষে সত্যতা পাওয়া গেছে। ঘটনাটি সত্য, যে গণমাধ্যমে প্রকাশিত সেটি গ্রহণযোগ্য, এবং ফ্যাক্টওয়াচের যুক্তিপরম্পরায় কোনো মিসিং লিংক খুঁজে পাওয়া যায় নি।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact2.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("মিথ্যা",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),child: Text("সংবাদের দাবির পক্ষে প্রামাণ্য তথ্য পাওয়া যায় নি। বরং গ্রহণযোগ্য সূত্রসমূহ এর বিপরীত দাবি করছে। ফ্যাক্টওয়াচের যুক্তিপরম্পরায় মিসিং লিংক বিদ্যমান।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact3.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("বেশিরভাগ সত্য",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),  child: Text("সংবাদটুকুর অধিকাংশ তথ্যই সঠিক, কিন্তু সামান্য কিছু অংশ বানোয়াট বা ভিত্তিহীন ।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact4.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("বেশিরভাগ মিথ্যা",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),  child: Text("সংবাদটুকুর অধিকাংশ তথ্যই মনগড়া, সেটিকে গছিয়ে দেয়ার জন্য সামান্য কিছু সত্য তথ্যের সন্নিবেশ করা হয়েছে মাত্র।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact5.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("অর্ধসত্য",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),child: Text("মোটামুটিভাবে আধাআধি সত্য এবং মিথ্যা। দাবিতে সত্য এবং মিথ্যা উভয়েরই লক্ষণীয় উপস্থিতি রয়েছে।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact6.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("বিভ্রান্তিকর",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(

                                      padding: const EdgeInsets.only(bottom:10),child: Text("এই রেটিংটি ব্যবহারের ক্ষেত্র তুলনামূলকভাবে বিস্তৃত। বেশ কিছু ক্ষেত্রে এটি ব্যবহৃত হতে পারে:\n১. সংবাদটি তার সূত্র হিসেবে যা উল্লেখ করেছে, তা সত্য, কিন্তু তা দিয়ে সংবাদের দাবি সরাসরি প্রতিষ্ঠিত হয় না। যেমন, কোন বিবৃতিতে ব্যবহৃত ছবি এবং ভিডিও “সত্য” (আংশিক বা পুরোপুরি জাল নয়) হলেও, ব্যাখ্যায় বিভ্রান্তিকর উপাদান রয়েছে অথবা তাদের উত্স, প্রসঙ্গ এবং/অথবা অর্থকে ভুল বা বিকৃতরূপে প্রকাশ করা হলে আমরা এই রেটিংটি করে থাকি।\n২. অন্যদিকে, ব্যাখ্যা “সত্য” (আংশিক বা পুরোপুরি ভুল/বিকৃত নয়) হলেও, ছবি বা ভিডিওতে কোন প্রকার জালিয়াতি ( ডিজিটাল মেনিপুলেশন) ধরা পড়লেও একই রেটিং দেয়া হবে।\n৩. ব্যাখ্যার সাথে তার উত্স, প্রসঙ্গ এবং/অথবা অর্থের সামঞ্জস্যতা ব্যাহত হলে কিংবা কোন ব্যক্তি বা পরিস্থিতিকে ভুলভাবে দায়ী (এমন কথা বলেনি বা লিখেনি বা উদ্ধৃতির নির্দেশ্যরূপটি মিথ্যা বিবেচিত হলে) করলেও বার্তাটি বিভ্রান্তিকর বলে বিবেচিত হবে।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact7.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("যাচাই করা যায়নি",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:10),
                                      child: Text("সংবাদের সূত্রসমূহ কিংবা সঠিক তথ্য দিতে সক্ষম এমন ব্যক্তিবর্গ বা এজেন্সিসমূহ নানাবিধ কারণে নাগালের বাইরে। নির্ভরযোগ্য উৎসের অনুপস্থিতি অথবা তা উদ্ঘাটন প্রক্রিয়া দুরূহ বিবেচিত হলে আমরা এই রেটিংটি করে থাকি।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    ),
                    TableRow(
                        children: [
                          Row(children: [
                            Padding(padding:imageInsets,child: Image.asset('assets/fact8.png',height: 80,width: 80,)),
                            Expanded(
                              child: Padding(
                                padding: paddingInsets,
                                child: Table(children: [
                                  TableRow(children: [
                                    Padding(
                                      padding:EdgeInsets.only(top:10,bottom:5),
                                      child: Text("অপ্রমাণিত",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,fontFamily: 'BalooDa2',
                                      ),),
                                    ),
                                  ],
                                  ),
                                  TableRow(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Text("এই রেটিংটি নির্দেশ করে যে, কোন দাবির বিশ্বাসযোগ্যতা যাচাই প্রক্রিয়া সম্পন্ন হলেও অমীমাংসিত থেকে গেছে।",style: TextStyle(fontFamily: "Kalpurush"),),
                                    ),
                                  ])
                                ],),
                              ),
                            )
                          ],mainAxisAlignment: MainAxisAlignment.start,)
                        ]
                    )
                  ],
                  border: TableBorder.all(width: 1,color: Colors.black),),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5,0,0,0),
                child: Column(
                  children: [Html(
                    data: howWeWorkEnglishDescription,
                    onLinkTap: (url,_,__,___) {
                      Functionalities.launchURL(url!);
                    },
                    style: {
                      // tables will have the below background color
                      "table": Style(

                        backgroundColor: Colors.white,
                        //width: 1000,

                        width:MediaQuery. of(context). size. width,
                        border: Border.all(color: Colors.white),
                        padding: EdgeInsets.symmetric(vertical: 0),
                        margin: EdgeInsets.symmetric(vertical:0),
                        wordSpacing: 0,
                        letterSpacing: 0.1,
                        //width: double.maxFinite,
                        alignment: Alignment.topRight,
                      ),
                      // some other granular customizations are also possible
                      "tr": Style(

                        alignment: Alignment.center,
                        //width: double.infinity,
                      ),
                      "td": Style(
                        padding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        alignment: Alignment.center,
                        //width: double.maxFinite,
                      ),
                      "p": Style(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                      ),
                      "img": Style(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      "a": Style(
                        color: Colors.black,
                      ),
                  'p':Style(
                  fontFamily: "Kalpurush",
                  ),'li':Style(
                  fontFamily: "Kalpurush",
                  ),

                  'h1':Style(
                  fontFamily: "BalooDa2"
                  ),
                  'h2':Style(
                  fontFamily: "BalooDa2"
                  ),
                  'h3':Style(
                  fontFamily: "BalooDa2"
                  ),
                  'h4':Style(
                  fontFamily: "BalooDa2"
                  ),
                  'h5':Style(
                  fontFamily: "BalooDa2",
                  ),
                  'a':Style(
                  fontFamily: "Kalpurush"
                  )
                    },
                    //blacklistedElements: ['width'],

                  ),
                    Table(children: [
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact1.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("True",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),  child: Text("When a claim has been proven to be true. The underlying incident or information has been verified, information about it is accessible, and we did not encounter any missing links in our fact-checking process.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact2.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("False",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("Evidence points against the claim. It does not hold based on the information available. There are missing links in the fact-checking chronology.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact3.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("Mostly True",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("The claim is mostly true, but a small portion is misleading or unfounded.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact4.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("Mostly False",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("The claim is mostly false, but accompanied by a modicum of truth that cannot be overlooked.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact5.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("Half-Truth",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("There is significant evidence on both sides of the claim. We cannot veer toward either direction."),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact6.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("Misleading",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("This rating has a relatively wide range:\n1. The claim is based on sources that are true, but it does not support the claim directly. For example, images or videos used are real/unedited, but they have been interpreted in misleading ways, or they have been misattributed.\n2. The claim is true, but the supporting images/videos have been manipulated.\n3. If the explanation is not consistent with the source, underlying issue and/or meaning, or it attributes statements to people who have not made it, we also rate claims misleading.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact7.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("Could Not Be Verified",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("Primary sources or contacts that can verify information are beyond our reach. If we cannot find enough reliable sources to actually go through fact-checking, we rate claims as “could not be verified.”",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      ),
                      TableRow(
                          children: [
                            Row(children: [
                              Padding(padding:imageInsets,child: Image.asset('assets/fact8.png',height: 80,width: 80,)),
                              Expanded(
                                child: Padding(
                                  padding: paddingInsets,
                                  child: Table(children: [
                                    TableRow(children: [
                                      Padding(
                                        padding:EdgeInsets.only(top:10,bottom:5),
                                        child: Text("	Unproven",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,fontFamily: 'BalooDa2',
                                        ),),
                                      ),
                                    ],
                                    ),
                                    TableRow(children: [
                                      Padding(

                                        padding: const EdgeInsets.only(bottom:10),child: Text("After we have done the fact-checking, if we still cannot establish a claim even though it is not false or misleading, we rate it unproven.",style: TextStyle(fontFamily: "Kalpurush"),),
                                      ),
                                    ])
                                  ],),
                                ),
                              )
                            ],mainAxisAlignment: MainAxisAlignment.start,)
                          ]
                      )
                    ],
                      border: TableBorder.all(width: 1,color: Colors.black),),
                    SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
