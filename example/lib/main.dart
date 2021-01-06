import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NativeAds.initialize(useHybridComposition: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Create a native ad with the default style
          NativeAd(
            height: 110,
            buildLayout: adBannerLayoutBuilder,
            loading: Text('loading'),
            error: Text('error'),
            button: AdButtonView(
              borderRadius: AdBorderRadius.vertical(bottom: 10),
              margin: EdgeInsets.only(left: 6, right: 6, bottom: 6),
              gradient:
                  AdLinearGradient(colors: [Colors.yellow[300], Colors.amber]),
            ),
          ),
          NativeAd(
            height: 100,
            buildLayout: secondBuilder,
            loading: Text('loading'),
            error: Text('error'),
            icon: AdImageView(size: 80),
            headline: AdTextView(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
            media: AdMediaView(height: 80, width: 120),
          ),
          NativeAd(
            height: 300,
            buildLayout: fullBuilder,
            loading: Text('loading'),
            error: Text('error'),
            icon: AdImageView(size: 40),
            headline: AdTextView(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 1,
            ),
            media: AdMediaView(
              height: 180,
              width: MATCH_PARENT,
            ),
            attribution: AdTextView(
              width: WRAP_CONTENT,
              height: WRAP_CONTENT,
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
              margin: EdgeInsets.only(right: 4),
              maxLines: 1,
              borderRadius: AdBorderRadius.all(10),
              text: 'Anúncio',
              border: BorderSide(color: Colors.green, width: 1),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        padding: EdgeInsets.all(10),
        // The first linear layout width needs to be extended to the
        // parents height, otherwise the children won't fit good
        width: MATCH_PARENT,
        gradient: AdLinearGradient(
          colors: [Colors.indigo[300], Colors.indigo[700]],
          orientation: AdGradientOrientation.tl_br,
        ),
        children: [
          media,
          AdLinearLayout(
            children: [
              icon,
              AdLinearLayout(children: [
                headline,
                AdLinearLayout(
                  children: [attribuition, advertiser],
                  orientation: HORIZONTAL,
                  width: MATCH_PARENT,
                ),
              ], margin: EdgeInsets.only(left: 4)),
            ],
            width: WRAP_CONTENT,
            orientation: HORIZONTAL,
            margin: EdgeInsets.only(top: 6),
          ),
          AdLinearLayout(
            children: [button],
            orientation: HORIZONTAL,
          ),
        ],
      );
    };

AdLayoutBuilder get secondBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribution, button) {
      return AdLinearLayout(
        padding: EdgeInsets.all(10),
        // The first linear layout width needs to be extended to the
        // parents height, otherwise the children won't fit good
        width: MATCH_PARENT,
        orientation: HORIZONTAL,
        gradient: AdRadialGradient(
          colors: [Colors.blue[300], Colors.blue[900]],
          center: Alignment(0.5, 0.5),
          radius: 1000,
        ),
        children: [
          icon,
          AdLinearLayout(
            children: [
              headline,
              AdLinearLayout(
                children: [attribution, advertiser, ratingBar],
                orientation: HORIZONTAL,
                width: WRAP_CONTENT,
                height: 20,
              ),
              button,
            ],
            margin: EdgeInsets.symmetric(horizontal: 4),
          ),
        ],
      );
    };
