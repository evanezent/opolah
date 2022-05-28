import 'package:cart/models/cart.dart';
import 'package:opolah/helper/models.dart';

var item = Item.withId(
    "x80AN",
    "name 1",
    'https://m.media-amazon.com/images/I/71gM3nG+gQL._AC_SX425_.jpg',
    5,
    1200000,
    DateTime.parse("20221010T12:00:00"));

final List<Cart>? dummyCart = [
  Cart.withId("Cx80AN", "x80AN", "name_1", "5", "1200000", item),
  Cart.withId("CKl0AN", "Kl0AN", "name_2", "5", "1243522", item),
  Cart.withId("CN908a", "N908a", "name_3", "5", "1445644", item),
  Cart.withId("CBNva8", "BNva8", "name_4", "5", "2342113", item),
  Cart.withId("CS2jer", "S2jer", "name_5", "5", "1500000", item),
  Cart.withId("CnB21AS", "nB21AS", "name_6", "5", "900000", item)
];
