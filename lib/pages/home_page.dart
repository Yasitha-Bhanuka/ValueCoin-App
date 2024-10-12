import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:valuecoin/services/http_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  HTTPService? _http;

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
            ],
          ),
        ),
      ),
    );
  }

  Widget _selectedCoinDropDown() {
    List<String> _coins = ['bitcoin', 'ethereum', 'cardano'];
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
      value: _coins.first,
      items: _dropDownItems,
      onChanged: (_value) {
        print(_value);
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
}
