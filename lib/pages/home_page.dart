import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:valuecoin/pages/details_page.dart';
import 'package:valuecoin/services/http_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  HTTPService? _http;
  String _selectedCoin = 'bitcoin';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _http = GetIt.instance.get<HTTPService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _selectedCoinDropDown(),
              _dataWidgets(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropDown() {
    List<String> _coins = [
      'bitcoin',
      'ethereum',
      'tether',
      'cardano',
      'ripple'
    ];
    List<DropdownMenuItem<String>> _dropDownItems = _coins
        .map(
          (String coin) => DropdownMenuItem(
            value: coin,
            child: Text(
              coin,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
        .toList();
    return DropdownButton(
      value: _selectedCoin,
      items: _dropDownItems,
      onChanged: (dynamic _value) {
        setState(() {
          _selectedCoin = _value!;
        });
      },
      dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
      iconSize: 30,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
        color: Colors.white,
      ),
      underline: Container(),
    );
  }

  Widget _dataWidgets() {
    return FutureBuilder(
      future: _http!.get("/coins/$_selectedCoin"),
      builder: (_context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          Map _data = jsonDecode(_snapshot.data.toString());
          print("Data value is : $_data");
          num _usdPrice = _data['market_data']['current_price']['usd'];
          num _percentageChange =
              _data['market_data']['price_change_percentage_24h'];
          String _imgURL = _data['image']['large'];
          String _description = _data['description']['en'];
          Map _exchangeRates = _data['market_data']['current_price'];
          print(_exchangeRates);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext _context) {
                      return DetailsPage(rates: _exchangeRates);
                    }));
                  },
                  child: _coinImageWidget(_imgURL)),
              _currentPriceWidget(_usdPrice),
              _percentageChangeWidget(_percentageChange),
              _descriptionCardWidget(_description),
            ],
          );
        } else {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }
      },
    );
  }

  Widget _currentPriceWidget(num _rate) {
    return Text(
      "${_rate.toStringAsFixed(2)} USD",
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
    );
  }

  Widget _percentageChangeWidget(num _percentage) {
    return Text(
      "${_percentage.toStringAsFixed(2)} %",
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300),
    );
  }

  Widget _coinImageWidget(String _imgURL) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.02),
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_imgURL),
        ),
      ),
    );
  }

  Widget _descriptionCardWidget(String _description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.05),
      padding: EdgeInsets.symmetric(
          vertical: _deviceHeight! * 0.01, horizontal: _deviceWidth! * 0.03),
      height: _deviceHeight! * 0.45,
      width: _deviceWidth! * 0.95,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(83, 88, 206, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _description,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }
}
