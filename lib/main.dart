import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'PH Value Importance';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Why is pH value important to a farmer?'),
        ),
        body: _buildColumn(context));
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          child: _buildImage(_currentSliderValue),
        ),
        const Text('Neutral'),
        _buildSlider(context),
        Container(
          width: 300,
          child: _buildText(_currentSliderValue),
        ),
      ],
    );
  }

  double _currentSliderValue = 7;

  Widget _buildSlider(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 14,
      divisions: 14,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }

  Widget _buildImage(_currentSliderValue) {
    return Image.network((() {
      if (_currentSliderValue < 7) {
        return 'https://image.shutterstock.com/image-photo/bonsai-tree-dying-urban-city-260nw-1767522545.jpg';
      } else if (_currentSliderValue < 8) {
        return 'https://previews.123rf.com/images/thanatip/thanatip1107/thanatip110700159/10086770-the-big-green-tree-standing-on-a-white-background-.jpg';
      } else {
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ32qlJNUFWjZfPaYaoGa0JRW6yjz5tzn31Ig&usqp=CAU';
      }
    })());
  }

  Widget _buildText(_currentSliderValue) {
    var textNegative =
        "Acidic soils cause the plant to decay. Typically, rain ia slightly acidic and incresingly so around polluted areas like cities. When rain's pH falls to around 4, it's called acidic rain.";
    var textNetural =
        "pH is a measure of how acidic/basic water is. A good pH level for plants is typically between 6.5 and 7.5 (although it depends on the plant). In soil, pH is affected by a tonne of different chemicals and is an excellent proxy for soil health.";
    var textPositive =
        "Alkaline soils cause plant leaves to yellow and then die. When the soils become alkaline, the Iron is removed which is used by plants to create the green Chlorophyll we see. Interestingly, we see plants as green not becuase they use that colour, but because that's the very wavelength they don't need for photosynthesis.";
    {
      return Text((() {
        if (_currentSliderValue < 7) {
          return textNegative;
        } else if (_currentSliderValue < 8) {
          return textNetural;
        } else {
          return textPositive;
        }
      })());
    }
  }
}
