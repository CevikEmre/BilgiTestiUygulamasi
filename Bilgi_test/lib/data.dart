import 'package:bilgi_test/question.dart';

class Data {
late int _listIndex = 0;

  final List<Question> _questions = [


    Question(qText: "İspanya'nın başkenti Barcelonadır.", qAnswer:false),
    Question(qText: "Türkiye Avrupa Birliği ülkesidir.", qAnswer: false),
    Question(qText: "Fatih Sultan Mehmet hiç patates yememiştir.", qAnswer: true),
    Question(qText: "Kanada'nın başkenti Torontodur.", qAnswer: false),
    Question(qText: "Isı termometre ile ölçülür.", qAnswer: false),
    Question(qText: "Kaju bir meyvenin sapıdır.", qAnswer: true),
    Question(qText: "Tarih öncesi devirler tarihi devirlere göre daha kısa sürmüştür.", qAnswer: true),
    Question(qText: "İstanbul 14.yy'da keşfedilmiştir.", qAnswer: false),
    Question(qText: "İnsanlık tarihi M.S 3000 yılında yazının bulunması esas alınarak iki bölüme ayrılır.", qAnswer: true),
    Question(qText: " 1 kcal yaklaşık 4 kJ’e eşittir.", qAnswer: true),
    Question(qText: "Işık sesten daha hızlı hareket ettiği için şimşek daha duyulmadan görülür", qAnswer: true),
    Question(qText: "Melbourne, Avustralya'nın başkentidir.", qAnswer: false),
    Question(qText: "Brokoli, limondan daha fazla C vitamini içerir.", qAnswer: true),
    Question(qText: "Merkür'ün atmosferi Karbondioksitten oluşur.", qAnswer: false),
    Question(qText: "Burnunuz günde neredeyse bir litre mukus üretir.", qAnswer: true),
    Question(qText: "Tüm memeliler karada yaşar", qAnswer: false),
    Question(qText: "Bulutlardan korkmaya Koulrofobi denir", qAnswer: false)

  ];
  getAnswer(){

    return _questions[_listIndex].qAnswer;
  }

  getText() {

    return _questions[_listIndex].qText;

  }
  void indexArttir(){
    if(_listIndex < _questions.length-1){
      _listIndex +=1;
    }
  }
  endCheck(){
    if(_listIndex >= _questions.length-1){
      return true;
    }
    else {
      return false;
    }
  }
  resetIndex(){
    _listIndex=0;
  }
}