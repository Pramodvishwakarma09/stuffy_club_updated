import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stuffy_club/helper/AppColor.dart';
import 'package:stuffy_club/models/profile_model.dart';
import '../const.dart';
import '../models/home_model.dart';
import '../notifaction_services/notification_service.dart';
import 'Auth/login_screen.dart';
import 'notification_screen.dart';
import 'product_by_category_Screen.dart';
import 'product_deatails.dart';
import 'see_all_screen.dart';
import 'see_all_screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future? _future;
  TextEditingController txt_searchbar = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var search_value = '';

  Future<ProfileModel> loadAssets() async {
    print('stringValue.toString()');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    ProfileModel lm;
    String url = "${AppUrl.baseUrl}/myprofile";
    http.Response response =
        await http.post(Uri.parse(url), body: {
          "id": stringValue.toString()
        }
        );
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = ProfileModel.fromJson(jsonresponse);

    // var  free&paad = data
    return lm;
  }
  Future<HomeModel> loadAssets2() async {
    print('stringValue.toString()');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var stringValue = prefs.getInt('user_id');

    HomeModel lm;
    String url = "${AppUrl.homePage}";
    http.Response response = await http.post(Uri.parse(url),
        body: {'search': "${search_value == '' ? "" : search_value}"});
    Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    lm = HomeModel.fromJson(jsonresponse);

    return lm;
  }

  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print("@@@@${value}@@@@@");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            //position at top
            top: 10,
            left: 0, right: 0, //set left right to 0 for 100% width
            child: FutureBuilder(
              future: loadAssets(),
              builder: (context, AsyncSnapshot<ProfileModel> snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: FadeInImage(
                              height: 50,
                              width: 50,
                              fadeInDuration: const Duration(milliseconds: 500),
                              fadeInCurve: Curves.easeInExpo,
                              fadeOutCurve: Curves.easeOutExpo,
                              placeholder: AssetImage(
                                "asset/images/demoprofile.png",
                              ),
                              image: NetworkImage(
                                snapshot.data!.data[0].profileImage,
                              ),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Container(
                                    child: Image.asset(
                                        "asset/images/demoprofile.png"));
                              },
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Aboshi ',
                              fontWeight: FontWeight.w600,
                              color: HexColor('#2FCB4D'),
                            ),
                          ),
                          Text(
                            snapshot.data!.data[0].fullName,
                            style:
                            TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NotificationScreen()));
                          setState(() {

                          });
                        },
                        child: SvgPicture.asset(
                            'asset/new icons/Notification.svg'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool("isLoggedIn", false);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                                (route) => false,
                          );
                        },
                        child: SvgPicture.asset('asset/new icons/Icon (6).svg'),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child:  Image.asset(
                            "asset/images/demoprofile.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Aboshi ',
                              fontWeight: FontWeight.w600,
                              color: HexColor('#2FCB4D'),
                            ),
                          ),
                          Text(
                            "Name..",
                            style:
                            TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NotificationScreen()));
                        },
                        child: SvgPicture.asset(
                            'asset/new icons/Notification.svg'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          prefs.setBool("isLoggedIn", false);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()),
                                (route) => false,
                          );
                        },
                        child: SvgPicture.asset('asset/new icons/Icon (6).svg'),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 70,
            bottom: 0,
            left: 0, right: 0,

            child: FutureBuilder(
              future: loadAssets2(),
              builder: (context, AsyncSnapshot<HomeModel> snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(height: 1),
                        // Search(),
                        //////////////////////////////////////////////////////////////////
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                search_value = value;
                                print("EXAM_VALUE" + search_value.toString());
                                loadAssets2();
                              });
                            },

                            // onChanged: (value) => _runFilter(value),
                            style: TextStyle(
                                color: HexColor('#B1B1B1'),
                                fontFamily: 'Aboshi',
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            textAlign: TextAlign.start,
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              filled: true,
                              fillColor: HexColor('#FFFFFF').withOpacity(0.15),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      loadAssets2();
                                    });
                                  },
                                  child: Icon(Icons.search,
                                      color: HexColor('#B1B1B1'))),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#CCCBCB")),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#CCCBCB")),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#CCCBCB")),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              hintStyle: TextStyle(color: HexColor('#B1B1B1')),
                              hintText: "Search for your favorite stuffy",
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////////////////////
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(
                                top: 32,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  snapshot.data!.categories.length.toInt(),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    print("###############catery id");
                                    print(snapshot.data!
                                        .categories[index].id
                                        .toString());
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductByCategoryScreen(
                                                  cname: snapshot
                                                      .data!
                                                      .categories[index]
                                                      .categoryName,
                                                  category_id: int.parse(
                                                      snapshot.data!
                                                          .categories[index].id
                                                          .toString())),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      top: 2,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 95, height: 88,
                                          // color: Colors.white,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(snapshot.data!
                                                      .categories[index].image
                                                      .toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Text(
                                              snapshot.data!.categories[index]
                                                  .categoryName,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Aboshi',
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        /////////////////////////////////////////////////////////////

                        ///////////   //Exclusive Stuffy
                        Container(
                          height: 200,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Exclusive Stuffy',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Aboshi',
                                          fontWeight: FontWeight.w400,
                                          color: HexColor('#000000'),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SeeAllScreen(),
                                              ));
                                          setState(() {

                                          });
                                        },
                                        child: Text(
                                          'See all',
                                          style: TextStyle(
                                              color: HexColor('#ED1D22'),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        snapshot.data!.exclusiveStuffy.length,
                                    padding: const EdgeInsets.only(top: 10),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          print("@@@@@@@@@@@@@@@@@@3333333333333333333${snapshot.data!.exclusiveStuffy[index].id}");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDeatailsScreen(
                                                      productId: "${snapshot.data!.exclusiveStuffy[index].id}",
                                                  imangNAME: "${snapshot.data!.exclusiveStuffy[index].qrCodeImage}",
                                                  name:
                                                      "${snapshot.data!.exclusiveStuffy[index].productName}",
                                                  Description:
                                                      "${snapshot.data!.exclusiveStuffy[index].description}",
                                                  satus:
                                                      "${snapshot.data!.exclusiveStuffy[index].status}",
                                                  images:
                                                      "${snapshot.data!.exclusiveStuffy[index].images[0].imageNames.toString()}",
                                                  x: snapshot
                                                      .data!
                                                      .exclusiveStuffy[index]
                                                      .images,
                                                ),
                                              ));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Column(children: [
                                            Container(
                                              // width: 110,
                                              // height: 70,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 110,
                                                    height: 85,
                                                    decoration: BoxDecoration(
                                                      //  borderRadius: BorderRadius.circular(15),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: HexColor(
                                                              '#03A9D6')),
                                                      image: DecorationImage(
                                                        // fit: BoxFit.cover,
                                                        scale: 0.5,
                                                        image: NetworkImage(snapshot
                                                                  .data!
                                                                  .exclusiveStuffy[
                                                                      index]
                                                                  .images[0]
                                                                  .imageNames
                                                                  .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              snapshot
                                                  .data!
                                                  .exclusiveStuffy[index]
                                                  .productName
                                                  .toString(),
                                            )
                                          ]),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        /////////////////////////////////////////////////////////////

                        // SizedBox(height: 10,),
                        // NewestStuffyRow(),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Newest Stuffy',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Aboshi',
                                        fontWeight: FontWeight.w400,
                                        color: HexColor('#000000'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SeeAllScreen2(),
                                            ));
                                      },
                                      child: Text(
                                        'See all',
                                        style: TextStyle(
                                            color: HexColor('#ED1D22'),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 200,
                              child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 2,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.newestStuffy.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        print("-____________________55555${snapshot.data!.newestStuffy[index].id}");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDeatailsScreen(
                                                    productId: "${snapshot.data!.newestStuffy[index].id}",
                                                imangNAME:
                                                    "${snapshot.data!.newestStuffy[index].qrCodeImage}",
                                                name:
                                                    "${snapshot.data!.newestStuffy[index].productName}",
                                                Description:
                                                    "${snapshot.data!.newestStuffy[index].description}",
                                                satus:
                                                    "${snapshot.data!.newestStuffy[index].status}",
                                                images:
                                                    "${snapshot.data!.newestStuffy[index].images[0].imageNames.toString()}",
                                                x: snapshot.data!
                                                    .newestStuffy[index].images,
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2,
                                            right: 2,
                                            top: 10,
                                            bottom: 2),
                                        child: SizedBox(
                                          width: 140,
                                          height: 130,
                                          child: Column(
                                            children: [

                                               ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.network(snapshot
                                                            .data!
                                                            .newestStuffy[index]
                                                            .images[0]
                                                            .imageNames
                                                            .toString(),
                                                    fit: BoxFit.fill,
                                                    height: 135,
                                                    width: 130,
                                                  )
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Text(
                                                    snapshot
                                                        .data!
                                                        .newestStuffy![index]
                                                        .productName
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Aboshi',
                                                        color: HexColor(
                                                            '#09101D'))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Text(
                                                    snapshot
                                                        .data!
                                                        .newestStuffy![index]
                                                        .productName
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Aboshi',
                                                      color:
                                                          HexColor('#03A9D6'),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(color: appcolor.primary,),
                  );
                }
              },
            ),
          ),

        ],
      )),
    );
  }
}
