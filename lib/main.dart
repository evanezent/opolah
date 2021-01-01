import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:opolah/blocs/address/address_bloc.dart';
import 'package:opolah/blocs/address/address_event.dart';
import 'package:opolah/blocs/cart/cart_bloc.dart';
import 'package:opolah/blocs/cart/cart_event.dart';
import 'package:opolah/blocs/item/item_bloc.dart';
import 'package:opolah/blocs/item/item_event.dart';
import 'package:opolah/blocs/profile/profile_bloc.dart';
import 'package:opolah/blocs/profile/profile_event.dart';
import 'package:opolah/blocs/transaction/transaction_bloc.dart';
import 'package:opolah/blocs/transaction/transaction_event.dart';
import 'package:opolah/repositories/address_repo.dart';
import 'package:opolah/repositories/cart_repo.dart';
import 'package:opolah/repositories/item_repo.dart';
import 'package:opolah/repositories/transaction_repo.dart';
import 'package:opolah/repositories/user_repo.dart';
import 'package:opolah/ui/screens/login/login_screen.dart';
import 'package:opolah/ui/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String userID;
  void getActiveUser() async {
    var prefs = await SharedPreferences.getInstance();
    print(prefs.getString("userID"));
    String id = prefs.getString("userID");

    userID = id;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getActiveUser();
    return MultiBlocProvider(
        providers: [
          BlocProvider<ItemBloc>(
            create: (context) {
              return ItemBloc(itemRepository: ItemRepository())
                ..add(LoadItems());
            },
          ),
          BlocProvider<CartBloc>(
            create: (context) {
              return CartBloc(cartRepository: CartRepository())
                ..add(LoadCart(userID));
            },
          ),
          BlocProvider<UserBloc>(
            create: (context) {
              return UserBloc(userRepo: DataRepository())
                ..add(LoadUser(userID));
            },
          ),
          BlocProvider<AddressBloc>(
            create: (context) {
              return AddressBloc(addressRepository: AddressRepository())
                ..add(LoadAddress(userID));
            },
          ),
          BlocProvider<TransactionBloc>(
            create: (context) {
              return TransactionBloc(
                  transactionRepository: TransactionRepository())
                ..add(LoadTransaction(userID));
            },
          )
        ],
        child: MaterialApp(
            theme: ThemeData(fontFamily: 'Barlow'), home: MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.id = ""}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
  final String id;
}

class _MyHomePageState extends State<MyHomePage> {
  bool available = false;
  void getActiveUser() async {
    var prefs = await SharedPreferences.getInstance();
    String id = prefs.getString("userID");

    if (id != null) {
      setState(() {
        available = true;
      });
    } else {
      setState(() {
        available = false;
      });
    }
    print(available);
  }

  @override
  void initState() {
    super.initState();
    getActiveUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomSplash(
          imagePath: 'assets/images/logo.png',
          home: available ? MainScreen() : LoginScreen(),
          animationEffect: 'zoom-in',
          duration: 2500,
          type: CustomSplashType.StaticDuration,
        ));
  }
}
