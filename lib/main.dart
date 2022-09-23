import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Lover',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Coffee Lover'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // globals
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // variables
  static String _dropdownWhoAmIValue =  _whoAmI.first;
  static String _infoText = "Informe os dados";
  static TextEditingController _caffeineMgController = TextEditingController();
  static final List<bool> _selectedSource = <bool>[
    true,
    false,
    false,
    false];

  // consts
  static const IconData refresh = IconData(0xe514, fontFamily: 'MaterialIcons');
  static const _buttonWidth = 350.0;
  static const _buttonHeight = 35.0;
  static const _betachildHealthyCaffeineConsumption = 100.0;
  static const _sigmaChildHealthyCaffeineConsumption  = 300.0;
  static const _sensibleHealthyCaffeineConsumption = 100.0;
  static const _pregnantHealthyCaffeineConsumption  = 200.0;
  static const _devHealthyCaffeineConsumption = 600.0;
  static const _sigmaHealthyCaffeineConsumption  = 800.0;
  static const _strondaHealthyCaffeineConsumption  = 900.0;
  static const _amandaHealthyCaffeineConsumption = 1000.0;


  static const List<String> _whoAmI = <String>[
    'Criança Beta',
    'Criança Sigma',
    'Não trabalha e não tem problema na vida (aka sensível || beta)',
    'Gestanes e Lactantes',
    'Dev Explorado',
    'Sigma (Fe)male Grindset',
    'Stronda',
    'Amanda :)'];

  static const List<Widget> _whoAmICaffeineSource = <Widget>[
    Text('Coado'),
    Text('Expresso'),
    Text('Capsula'),
    Text('Branquinha tem cafeina?'),
  ];

  final _whoAmIMap = {
  'Criança Beta' : String _betachildHealthyCaffeineConsumption() =>
  _calculateCaffeineConsumption > _betachildHealthyCaffeineConsumption ? "Dá uma maneirada né kid" : "Titia Cíntia Aprova",
  'Criança Sigma' : String _sigmaChildHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _sigmaChildHealthyCaffeineConsumption ? "É sigma, mas ainda é kid, dá uma maneirada" : "Titia Cíntia Aprova, mas tá quase virando beta",
  'Não trabalha e não tem problema na vida (aka sensível || beta)' : String _sensibleHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _sensibleHealthyCaffeineConsumption ? "Tá bebendo café demais para um vagabundo" : "Sai dessa mamatinha ai, vira gente",
  'Gestanes e Lactantes' : String _pregnantHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _pregnantHealthyCaffeineConsumption ? "Manera aí, gravidinha. A criança precisa ficar estranha que nem a Amanda" : "Cuidando do filhão, boa",
  'Dev Explorado' : String _devHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _devHealthyCaffeineConsumption ? "Bug tá foda né amigão" : "Já é senior, nem coda mais",
  'Sigma (Fe)male Grindset' : String _sigmaHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _sigmaHealthyCaffeineConsumption ? "Se for legday vai conhecer o zyzz" : "O grindset tá off",
  'Stronda' : String _strondaHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _strondaHealthyCaffeineConsumption ? "VAI GOSTAR DE CAFÉ É AGORA" : "SEU FRANGO",
  'Amanda :)' : String _amandaHealthyCaffeineConsumption() =>
      double.parse(_caffeineMgController.text) > _amandaHealthyCaffeineConsumption ? "HAHAHA O CÉU É O LIMITE" : "F, MIMIU",
};

  // functions
  get vertical => false;

  void _resetFields() {
    _formKey = GlobalKey<FormState>();
    _dropdownWhoAmIValue =  _whoAmI.first;
    _caffeineMgController.text = "";
    setState(() {
      _infoText = "Informe os dados";
    });
  }

  void _dropdownWhoAmICallback(String? selectedValue) {
    if(selectedValue is String) {
      setState(() {
        _dropdownWhoAmIValue = selectedValue;
      });
    }
  }

  double _calculateCaffeineConsumption() {
    return 0.0;
  }

  void _calculateHealthyCaffeineConsumption() {
    setState((){
      _infoText = _whoAmIMap[_whoAmI] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,
            style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: _resetFields,
              icon: const Icon(refresh))
        ],
      ),
        body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text("Você é um: $_dropdownWhoAmIValue"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: DropdownButton(
                        items: _whoAmI
                            .map<DropdownMenuItem<String>>((String item) {
                          return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item));
                        }).toList(),
                        value: _dropdownWhoAmIValue,
                        onChanged: _dropdownWhoAmICallback,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Selecione sua fonte de cafeína:"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ToggleButtons(
                        direction: vertical ? Axis.vertical : Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _selectedSource.length; i++) {
                              _selectedSource[i] = i == index;
                            }
                          });
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Colors.brown[700],
                        selectedColor: Colors.white,
                        fillColor: Colors.brown[200],
                        color: Colors.brown[400],
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedSource,
                        children: _whoAmICaffeineSource,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text("Selecione os ml's de cafeína"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: _caffeineMgController,
                        decoration: const InputDecoration(
                          labelText: "Quantidade do produto (ml)",
                        ),
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Digite uma quantidade válida";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: _buttonWidth,
                    height: _buttonHeight,
                    margin: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          _calculateHealthyCaffeineConsumption();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        backgroundColor: Theme.of(context).colorScheme.primary,),
                      child: const Text("Calcular"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(_infoText),
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
