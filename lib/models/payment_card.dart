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
        "Goku is the main protagonist in the Dragon Ball franchise and one of the strongest fighters in the universe. He is a Saiyan warrior whose original name was Kakarot, son of Bardock. He is the husband of Chi Chi, and the father of Gohan and Goten. He is also Grandfather to Pan.",
    color: 0xFFFFFFF,
  ),
  PaymentCard(
    title: "BRI",
    image: 'http://upload.wikimedia.org/wikipedia/commons/9/97/Logo_BRI.png',
    accNumber:
        "The Prince of all Saiyans, Vegeta is an incredibly strong elite Saiyan warrior. In his constant struggle to surpass his eternal rival Goku, he has become one of the most powerful fighters in the universe.",
    color: 0xFF238ED0,
  ),
  PaymentCard(
    title: "BNI",
    image:
        'https://upload.wikimedia.org/wikipedia/en/thumb/2/27/BankNegaraIndonesia46-logo.svg/1200px-BankNegaraIndonesia46-logo.svg.png',
    accNumber:
        "Gohan is Goku's son and one of the heroes in the Dragon Ball Z universe. He is also the protagonist of the Cell Saga, where he is the first to reach the Super Saiyan 2 form, through immense anger and emotion. In his later Ultimate form, he is considered the most powerful warrior in Dragon Ball Z. He is Goten's older brother and the father of Pan. His wife is Videl and his grandfathers are Ox-king and Bardock, respectively.",
    color: 0xFF447C12,
  ),
  PaymentCard(
    title: "BCA",
    image:
        'http://logos-download.com/wp-content/uploads/2017/03/BCA_logo_Bank_Central_Asia.png',
    accNumber:
        "In the Dragon Ball Z universe, Frieza is one of the first villains to really test Goku.",
    color: 0xFFE7668E,
  ),
  PaymentCard(
    title: "Dana",
    image:
        'https://cdn-a.kmk-engineering.static6.com/assets/venture/dana-3f1e3cb31eba067a590c0ce65b4b53d978541906cb9940ccd47a861f7b061ac2.png',
    accNumber:
        "Cell is an android constructed from cells taken from various fighters of the Dragon Ball Z universe. He is the main antagonist of the Android Saga of Dragon Ball.",
    color: 0xFF238BD0,
  ),
  //0xFF447C12 0xFFE7668E
  PaymentCard(
    title: "OVO",
    image:
        'https://ausdroid.net/wp-content/uploads/2018/04/OVO-Colour-LOGO_preview.png',
    accNumber:
        "One of Dragon Ball Z's most ferocious and transformation-happy of PaymentCards, Majin Buu is the last major enemy in the Dragon Ball Z storyline. With the ability to absorb foes, learn moves, and deliver a serious punch, Majin Buu is one of Goku and friends' most challenging of enemies.",
    color: 0xFF6F2B62,
  ),
];
