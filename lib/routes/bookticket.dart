import 'dart:convert';
import 'dart:developer';

import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/tikect_controller.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/model/plane.dart';
import 'package:airplane/payment/input_formatters.dart';
import 'package:airplane/payment/my_strings.dart';
import 'package:airplane/payment/payment_card.dart';
import 'package:airplane/routes/your_trips.dart';
import 'package:airplane/services/auth.dart';
import 'package:airplane/widgets/dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BookTicket extends StatefulWidget {
  final FlightData data;
  const BookTicket({Key? key, required this.data}) : super(key: key);
  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final _paymentCard = PaymentCard();
  var _autoValidateMode = AutovalidateMode.disabled;
  final _card = PaymentCard();

  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    final auth = Provider.of<Auth>(context);
    return Scaffold(
        backgroundColor: color.colorofScaffoldroute(),
        key: _scaffoldKey,
        appBar: AppBar(
          title: fonts.heading5("Payment", color.textColor()),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: color.backButton(), //change your color here
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  fonts.body1(
                      "${auth.data['blrCoins'] ?? 0}", color.textColor()),
                  const SizedBox(width: 5),
                  Icon(
                    LineIcons.wallet,
                    color: color.yellow(),
                    size: 25,
                  ),
                ],
              ),
            )
          ],
          backgroundColor: color.appBarColorroute(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: color.colorofScaffoldroute(),
                              child: CachedNetworkImage(
                                imageUrl: widget.data.flightImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            fonts.heading5(
                              widget.data.fightName,
                              color.textColor(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fonts.body1(
                              widget.data.originPlace,
                              color.textColor(),
                            ),
                            fonts.body1(
                              widget.data.destinationPlace,
                              color.textColor(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fonts.subTitle1(
                              widget.data.originTime,
                              color.textColor(),
                            ),
                            fonts.subTitle1(
                              widget.data.destinationTime,
                              color.textColor(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fonts.heading4(
                              widget.data.price.toString(),
                              color.textColor(),
                            ),
                            fonts.body2(
                              '+ 500 Tax and GST',
                              color.bottomnavBarInactieIcons(),
                            ),
                            fonts.body2(
                              widget.data.refund,
                              color.warning(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: false,
                      icon: Icon(
                        Icons.person,
                        color: color.iconColor(),
                      ),
                      hintText: 'What name is written on card?',
                      labelText: 'Card Name',
                    ),
                    onSaved: (String? value) {
                      _card.name = value;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
                    ],
                    keyboardType: TextInputType.name,
                    validator: (String? value) =>
                        value!.isEmpty ? Strings.fieldReq : null,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter()
                    ],
                    controller: numberController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: false,
                      icon: CardUtils.getCardIcon(_paymentCard.type, color),
                      hintText: 'What number is written on card?',
                      labelText: 'Number',
                    ),
                    onSaved: (String? value) {
                      _paymentCard.number = CardUtils.getCleanedNumber(value!);
                    },
                    validator: CardUtils.validateCardNum,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: false,
                      icon: Image.asset(
                        'assets/images/card_cvv.png',
                        width: 25.0,
                        color: color.iconColor(),
                      ),
                      hintText: 'Number behind the card',
                      labelText: 'CVV',
                    ),
                    validator: CardUtils.validateCVV,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _paymentCard.cvv = int.parse(value!);
                    },
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      CardMonthInputFormatter()
                    ],
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: false,
                      icon: Image.asset(
                        'assets/images/calender.png',
                        width: 25.0,
                        color: color.iconColor(),
                      ),
                      hintText: 'MM/YY',
                      labelText: 'Expiry Date',
                    ),
                    validator: CardUtils.validateDate,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      List<int> expiryDate = CardUtils.getExpiryDate(value!);
                      _paymentCard.month = expiryDate[0];
                      _paymentCard.year = expiryDate[1];
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: CupertinoButton(
                      color: color.labeledButtonoutside(),
                      onPressed: () {
                        try {
                          _validateInputs();
                          showPayDialog(context, auth);
                        } catch (e) {
                          showAlertDialog(context, e.toString());
                        }
                      },
                      child: fonts.button(
                        Strings.pay,
                        color.labeledButtoninside(),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      _paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      setState(() {
        _autoValidateMode =
            AutovalidateMode.always; // Start validating on every change.
      });
      throw 'Please fix the errors in red before submitting.';
    }
  }

  Future<void> showPayDialog(BuildContext context, Auth auth) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          bool load = false;
          final FormState form = _formKey.currentState!;
          final fonts = Provider.of<TypoGraphyOfApp>(context);
          final colors = Provider.of<ColorManager>(context);

          return Theme(
              data: ThemeData(
                  brightness:
                      colors.darkmode ? Brightness.dark : Brightness.light),
              child: StatefulBuilder(builder: (context, setState) {
                return CupertinoAlertDialog(
                  title: fonts.heading6(
                      load == false ? 'Pay' : "", colors.textColor()),
                  content: fonts.body1(
                      load == false
                          ? '\u{20B9}' +
                              (int.parse(widget.data.price
                                          .split(' ')[1]
                                          .toString()) +
                                      500)
                                  .toString()
                          : "Do not Close this Window ",
                      colors.textColor()),
                  actions: load == false
                      ? [
                          CupertinoButton(
                              child: fonts.button("Pay", colors.textColor()),
                              onPressed: () async {
                                final coins = Provider.of<TicketsAndMore>(
                                    context,
                                    listen: false);

                                setState(() {
                                  load = true;
                                });
                                form.save();

                                Map<String, dynamic> x = {
                                  "email": auth.data['email'].toString(),
                                  "cardNumber": _paymentCard.number.toString(),
                                  "cardMonth": _paymentCard.month.toString(),
                                  "cardYear": _paymentCard.year.toString(),
                                  "cardType": _paymentCard.type.toString(),
                                  "cardCvv": _paymentCard.cvv.toString(),
                                  "cardholdername":
                                      _paymentCard.name.toString(),
                                  'total_price': int.parse(widget.data.price
                                          .split(' ')[1]
                                          .toString()) +
                                      500
                                };
                                var thirdMap = {};
                                thirdMap.addAll(x);
                                thirdMap.addAll(widget.data.toJson());
                                final _res = await http.post(
                                    Uri.parse(
                                        'https://serverxx.azurewebsites.net/api/booktickets/'),
                                    headers: {
                                      "Content-Type":
                                          "application/json; charset=UTF-8"
                                    },
                                    body: json.encode(thirdMap));
                                await coins.updateBLR(auth);
                                await auth.getBlrCoins();
                                log(_res.body);
                                setState(() {
                                  load = false;
                                });
                                form.dispose();
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const YourTrips()));
                              }),
                          CupertinoButton(
                              child: fonts.button("Cancel", colors.warning()),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ]
                      : [
                          const Padding(
                            padding: EdgeInsets.all(18.0),
                            child: CupertinoActivityIndicator(),
                          )
                        ],
                );
              }));
        });
  }
}
