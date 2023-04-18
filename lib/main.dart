import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLoading = true;
  var metalPrices = {};

  @override
  void initState() {
    super.initState();
    _fetchMetalPrices();
  }

  //melakukan fetch dari api yang saya pakai
  Future<void> _fetchMetalPrices() async {
    final url =
        'https://metals-api.com/api/latest?access_key=626jkclzf4yp799925b5o4lzei7i3g1parmunvhrbmlgwzcho05yplpg9913&base=IDR&symbols=XAU%2CXAG%2CXPD%2CXPT%2CXRH%2CXCU%2CXPD%2CXAU-BANG%2CXAU-COIM%2CXAG-COIM%2CXAU-AHME%2CXAG-AHME%2CXAG-BANG%2CXAU-CHEN%2CXAG-CHEN';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        metalPrices = json.decode(response.body)['rates'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load metal prices');
    }
  }

  //berfungsi mengganti nama yang  umum diketahui orang , karena api yg saya pakai menggunakan nama yg tidak lazim

  String _replaceMetalName(String name) {
    switch (name) {
      case 'XAU':
        return 'Gold';
      case 'XAU-AHME':
        return 'Ahmedabad Gold';
      case 'XAU-BANG':
        return 'Banglore Gold';
      case 'XAU-CHEN':
        return 'Chennai Gold';
      case 'XAU-COIM':
        return 'Coimbatore Gold';
      case 'XAG':
        return 'Silver';
      case 'XAG-AHME':
        return 'Ahmedabad Silver';
      case 'XAG-BANG':
        return 'Banglore Silver';
      case 'XAG-CHEN':
        return 'Chennai Silver';
      case 'XAG-COIM':
        return 'Coimbatore Silver';
      case 'XPD':
        return 'Palladium';
      case 'XPT':
        return 'Platinum';
      case 'XRH':
        return 'Rhodium';
      case 'XCU':
        return 'Chopper';
      default:
        return name;
    }
  }

  //berfungsi untuk mendefinisikan url dari gambar berdasarkan parameter nama
  String _urlMetalName(String name) {
    switch (name) {
      case 'XAU':
        return 'http://111.68.24.246:9080/FrameworkMobile/GoldImage.jpg';
      case 'XAU-AHME':
        return 'http://111.68.24.246:9080/FrameworkMobile/GoldImage.jpg';
      case 'XAU-BANG':
        return 'http://111.68.24.246:9080/FrameworkMobile/GoldImage.jpg';
      case 'XAU-CHEN':
        return 'http://111.68.24.246:9080/FrameworkMobile/GoldImage.jpg';
      case 'XAU-COIM':
        return 'http://111.68.24.246:9080/FrameworkMobile/GoldImage.jpg';
      case 'XAG':
        return 'http://111.68.24.246:9080/FrameworkMobile/SilverImage.jpg';
      case 'XAG-AHME':
        return 'http://111.68.24.246:9080/FrameworkMobile/SilverImage.jpg';
      case 'XAG-BANG':
        return 'http://111.68.24.246:9080/FrameworkMobile/SilverImage.jpg';
      case 'XAG-CHEN':
        return 'http://111.68.24.246:9080/FrameworkMobile/SilverImage.jpg';
      case 'XAG-COIM':
        return 'http://111.68.24.246:9080/FrameworkMobile/SilverImage.jpg';
      case 'XPD':
        return 'http://111.68.24.246:9080/FrameworkMobile/PaladiumImage.jpg';
      case 'XPT':
        return 'http://111.68.24.246:9080/FrameworkMobile/PlatinumImage.jpg';
      case 'XRH':
        return 'http://111.68.24.246:9080/FrameworkMobile/RhodiumImage.jpg';
      case 'XCU':
        return 'http://111.68.24.246:9080/FrameworkMobile/ChopperImage.jpg';
      default:
        return name;
    }
  }

  //berfungsi untuk memberikan descripsi berdasarkan parameter nama
  String _descMetalName(String name) {
    switch (name) {
      case 'XAU':
        return 'Gold is a chemical element with the symbol Au and atomic number 79. This makes it one of the higher–atomic-number elements that occur naturally. It is a bright, slightly orange-yellow, dense, soft, malleable, and ductile metal in a pure form. Chemically, gold is a transition metal and a group 11 element.';
      case 'XAU-AHME':
        return 'Gold is a chemical element with the symbol Au and atomic number 79. This makes it one of the higher–atomic-number elements that occur naturally. It is a bright, slightly orange-yellow, dense, soft, malleable, and ductile metal in a pure form. Chemically, gold is a transition metal and a group 11 element.';
      case 'XAU-BANG':
        return 'Gold is a chemical element with the symbol Au and atomic number 79. This makes it one of the higher–atomic-number elements that occur naturally. It is a bright, slightly orange-yellow, dense, soft, malleable, and ductile metal in a pure form. Chemically, gold is a transition metal and a group 11 element.';
      case 'XAU-CHEN':
        return 'Gold is a chemical element with the symbol Au and atomic number 79. This makes it one of the higher–atomic-number elements that occur naturally. It is a bright, slightly orange-yellow, dense, soft, malleable, and ductile metal in a pure form. Chemically, gold is a transition metal and a group 11 element.';
      case 'XAU-COIM':
        return 'Gold is a chemical element with the symbol Au and atomic number 79. This makes it one of the higher–atomic-number elements that occur naturally. It is a bright, slightly orange-yellow, dense, soft, malleable, and ductile metal in a pure form. Chemically, gold is a transition metal and a group 11 element.';
      case 'XAG':
        return 'Silver is a chemical element with the symbol Ag (from Latin argentum silver, derived from the Proto-Indo-European h₂erǵ shiny, white and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.';
      case 'XAG-AHME':
        return 'Silver is a chemical element with the symbol Ag (from Latin argentum silver, derived from the Proto-Indo-European h₂erǵ shiny, white and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.';
      case 'XAG-BANG':
        return 'Silver is a chemical element with the symbol Ag (from Latin argentum silver, derived from the Proto-Indo-European h₂erǵ shiny, white and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.';
      case 'XAG-CHEN':
        return 'Silver is a chemical element with the symbol Ag (from Latin argentum silver, derived from the Proto-Indo-European h₂erǵ shiny, white and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.';
      case 'XAG-COIM':
        return 'Silver is a chemical element with the symbol Ag (from Latin argentum silver, derived from the Proto-Indo-European h₂erǵ shiny, white and atomic number 47. A soft, white, lustrous transition metal, it exhibits the highest electrical conductivity, thermal conductivity, and reflectivity of any metal.';
      case 'XPD':
        return 'Palladium is a chemical element with the symbol Pd and atomic number 46. It is a rare and lustrous silvery-white metal discovered in 1803 by the English chemist William Hyde Wollaston.';
      case 'XPT':
        return 'Platinum is a chemical element wi the chemical seembol Pt an an atomic nummer o 78.';
      case 'XRH':
        return 'Rhodium is a chemical element with the symbol Rh and atomic number 45. It is a very rare, silvery-white, hard, corrosion-resistant transition metal. It is a noble metal and a member of the platinum group. ';
      case 'XCU':
        return 'Copper is a chemical element with the symbol Cu and atomic number 29. It is a soft, malleable, and ductile metal with very high thermal and electrical conductivity. A freshly exposed surface of pure copper has a pinkish-orange color.';
      default:
        return name;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //memberikan nama pada appBar ( kebetulan bingung kasih notenya dimana )
          title: Text('Metal Prices In IDR ( click on list )'),
          backgroundColor: Colors.blueGrey,
        ),
        //Tampilan Loading menggunakan DoubleBounce
        body: isLoading
            ? Center(
          child: SpinKitDoubleBounce(
            color: Colors.blue,
            size: 50.0,
          ),
        )
            : ListView.builder(
          itemCount: metalPrices.length,
          itemBuilder: (context, index) {
            final key = metalPrices.keys.toList()[index];
            final value = metalPrices.values.toList()[index];
            final friendlyName = _replaceMetalName(key);
            final descOfMetal = _descMetalName(key);
            final urlOfImageMetal = _urlMetalName(key);

            return ListTile(
              title: Text(friendlyName),
              trailing: Text(value.toStringAsFixed(2)),
              tileColor: Colors.blueAccent.withOpacity(0.1),
              //berfungsi untuk mengakses class MetalDetailScreen ketika list di tap/klik
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MetalDetailScreen(metalName: friendlyName, metalValue: value, metalDescription: descOfMetal, imageUrl: urlOfImageMetal ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MetalDetailScreen extends StatelessWidget {
  final String metalName;
  final double metalValue;
  final String metalDescription;
  final String imageUrl;

  MetalDetailScreen({
    required this.metalName,
    required this.metalValue,
    required this.metalDescription,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nama app bar di ambil dari variabel metalName
      appBar: AppBar(
        title: Text(metalName),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blueAccent.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Center(
                child: Image.network(
                  imageUrl,
                  height: 150.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Metal: ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                metalName,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Current Value: ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\Rp${metalValue.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Description: ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                metalDescription,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class MetalDetailScreen extends StatelessWidget {
//   final String metalName;
//   final double metalValue;
//
//   MetalDetailScreen({required this.metalName, required this.metalValue});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(metalName),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Container(
//         color: Colors.blueAccent.withOpacity(0.1), // Set the background color of the body
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 16.0),
//               Text(
//                 'Metal: ',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 metalName,
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'Current Value: ',
//                 style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 '\Rp${metalValue.toStringAsFixed(2)}',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//               SizedBox(height: 32.0),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Back'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




