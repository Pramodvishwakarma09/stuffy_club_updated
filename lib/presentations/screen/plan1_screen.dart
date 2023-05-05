import'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hexcolor/hexcolor.dart';


class Plans extends StatefulWidget {
  const Plans({Key? key}) : super(key: key);

  @override
  State<Plans> createState() => _PlansState();
}
class _PlansState extends State<Plans> {
  List imageModel = ['1','2'];
  int S = 0;


  PageController controller = PageController();
  int _curr = 0;
  final List<Widget> _list = <Widget>[];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: HexColor('#F5F5F5'),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: const Text('Plans', style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: 'Aboshi',
            color: colors.black1)),
        leading: IconButton(
          onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios ,
        ),
          color: colors.black1,
        ),
        actions:<Widget> [
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(
              //     builder: (_)=> Condition())
              // );
            },
            child: SvgPicture.asset('asset/new icons/Shape1.svg'),
          )
          ,const Padding(padding: EdgeInsets.only(left:35,right:2))

        ],

        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.85,width:MediaQuery.of(context).size.width,
                child: PageView(
                  allowImplicitScrolling: true,
                  children: _list,
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (num) {
                    setState(() {
                      _curr = num;
                    });
                  },
                ),

              ),
              SmoothPageIndicator(
                controller:controller,
                count:2 ,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  activeDotColor: HexColor('#999999'),
                  dotColor: HexColor('#D0D0D0'),
                  dotWidth: 13,
                  dotHeight: 8,
                ),
              ),
            ]
        ),
      ),
    );
  }
}




