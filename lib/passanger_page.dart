import 'package:flutter/material.dart';
import 'package:flutter_task14endterm/passager.dart';



class PassengerPage extends StatefulWidget {
  @override
  _PassengerPageState createState() => _PassengerPageState();
}

class _PassengerPageState extends State<PassengerPage> {
  List<Passenger> passengers = [
    Passenger(
      name: 'Aigerim',
      placeNumber: '0 A',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'Arlan',
      placeNumber: '0 B',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'Assel',
      placeNumber: '1',
      placeType: PlaceType.down,
      buyType: BuyType.online,
    ),
    Passenger(
      name: 'Temirlan',
      placeNumber: '1',
      placeType: PlaceType.up,
      buyType: BuyType.online,
    ),
  ];

  List<Passenger> emptyPlaces = [
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 A',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 B',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
  ];

  Widget childWidget(context, name, placeNumber, placeType, passenger) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: mWidth,
        height: mHeight * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Информация о пассажире',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            TextFieldCard(
              text: name,
              color: Colors.black,
            ),
            TextFieldCard(
              text: '87012345678',
              color: Colors.black,
            ),
            TextFieldCard(
              text: 'Почта',
              color: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Место',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Цена',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldCard(
                    text: placeType == PlaceType.up
                        ? '$placeNumber верхний'
                        : '$placeNumber нижний',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextFieldCard(
                    text: '3000',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ИЗМЕНИТЬ',
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ОТПРАВИТЬ ЧЕК',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: SheetButton(
                title: 'ОТМЕНИТЬ ПОКУПКУ БИЛЕТА',
                onTap: () {
                  Navigator.pop(context);
                  Widget cancelButton = FlatButton(
                      child: Text(
                        "НЕТ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      });
                  Widget continueButton = FlatButton(
                      child: Text(
                        "ДА",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          passengers.remove(passenger);
                          emptyPlaces.insert(
                            0,
                            Passenger(
                              name: 'Нет Имени',
                              placeNumber: placeNumber,
                              placeType: placeType,
                              buyType: BuyType.noType,
                            ),
                          );
                        });
                        Navigator.pop(context);
                      });

                  AlertDialog alert = AlertDialog(
                      content: Text(
                        "Вы хотите отменить покупку билета?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0),
                      ),
                      actions: [cancelButton, continueButton]);
                  showDialog(context: context, builder: (context) => alert);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Пассажиры',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Имя',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Место',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Тип',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: passengers
                      .map(
                        (passenger) => listElement(passenger, () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return childWidget(
                            context,
                            passenger.name,
                            passenger.placeNumber,
                            passenger.placeType,
                            passenger,
                          );
                        },
                      );
                    }),
                  )
                      .toList(),
                ),
                Text(
                  'Свободные места',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: emptyPlaces
                      .map(
                        (emptyPlace) => listElement(emptyPlace, () {}),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class TextFieldCard extends StatelessWidget {
  final String text;
  final Color color;
  const TextFieldCard({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 20,
        child: TextFormField(
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
          initialValue: text,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}


Widget listTile(text, icon, onTap) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: ListTile(
      leading: IconTheme(data: IconThemeData(size: 40), child: icon),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    ),
  );
}

Widget listElement(Passenger passenger, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            width: 130,
            child: Text(
              passenger.name,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                passenger.placeNumber,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
              passenger.placeType == PlaceType.up
                  ? Text('верхний')
                  : Text('нижний'),
            ],
          ),
          ButtonTheme(
            minWidth: 130,
            child: RaisedButton(
              child: passenger.buyType == BuyType.online
                  ? Text(
                'ONLINE',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
                  : passenger.buyType == BuyType.offline
                  ? Text(
                'OFFLINE',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
                  : Text(
                'no type',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              color: passenger.buyType == BuyType.online
                  ? Colors.green
                  : passenger.buyType == BuyType.offline
                  ? Colors.grey
                  : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          )
        ],
      ),
    ),
  );
}



class SheetButton extends StatelessWidget {
  const SheetButton({this.title, this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
        color: Colors.green,
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}



