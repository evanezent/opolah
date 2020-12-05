class PaymentCard {
  final String title;
  final String accNumber;
  final int color;
  final String image;

  PaymentCard({
    this.image,
    this.title,
    this.accNumber,
    this.color,
  });
}

final cards = <PaymentCard>[
  PaymentCard(
    title: "Mandiri",
    image:
        'http://www.charindoconsulting.co.id/wp-content/uploads/2019/08/Bank_Mandiri_logo.svg-1024x300.png',
    accNumber:
        "128 89137 0101 291",
    color: 0xFF0a3db3,
  ),
  PaymentCard(
    title: "BRI",
    image: 'http://upload.wikimedia.org/wikipedia/commons/9/97/Logo_BRI.png',
    accNumber:
        "882901 022 213",
    color: 0xFFc77f08,
  ),
  PaymentCard(
    title: "BNI",
    image:
        'https://upload.wikimedia.org/wikipedia/en/thumb/2/27/BankNegaraIndonesia46-logo.svg/1200px-BankNegaraIndonesia46-logo.svg.png',
    accNumber:
        "9910 1723 1333 22",
    color: 0xFFeb711b,
  ),
  PaymentCard(
    title: "BCA",
    image:
        'http://logos-download.com/wp-content/uploads/2017/03/BCA_logo_Bank_Central_Asia.png',
    accNumber:
        "6673 93 2000 222",
    color: 0xFF1100ed,
  ),
  PaymentCard(
    title: "Dana",
    image:
        'https://cdn-a.kmk-engineering.static6.com/assets/venture/dana-3f1e3cb31eba067a590c0ce65b4b53d978541906cb9940ccd47a861f7b061ac2.png',
    accNumber:
        "0829381049",
    color: 0xFF25deff,
  ),
  //0xFF447C12 0xFFE7668E
  PaymentCard(
    title: "OVO",
    image:
        'https://ausdroid.net/wp-content/uploads/2018/04/OVO-Colour-LOGO_preview.png',
    accNumber:
        "08891239844",
    color: 0xFF921ddc,
  ),
];
