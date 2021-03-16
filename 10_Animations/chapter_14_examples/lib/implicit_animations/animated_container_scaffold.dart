import 'package:flutter/material.dart';

class AnimatedContainerScaffold extends StatefulWidget {
  const AnimatedContainerScaffold();

  @override
  _AnimatedContainerScaffoldState createState() =>
      _AnimatedContainerScaffoldState();
}

class _AnimatedContainerScaffoldState extends State<AnimatedContainerScaffold> {
  Map<DimensionSets, Map<Dimensions, double>> _dimensionSets = {
    DimensionSets.small: {
      Dimensions.width: 100,
      Dimensions.height: 100,
    },
    DimensionSets.large: {
      Dimensions.width: 200,
      Dimensions.height: 200,
    }
  };

  DimensionSets _currentDimensionSet;

  @override
  void initState() {
    _currentDimensionSet = DimensionSets.small;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut,
              width: _dimensionSets[_currentDimensionSet][Dimensions.width],
              height: _dimensionSets[_currentDimensionSet][Dimensions.height],
              child: Card(
                color: Colors.blue,
              ),
            ),
            Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: RaisedButton(
                child: const Text("Change Dimension"),
                onPressed: () {
                  setState(
                    () => _updateDimensionSet(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateDimensionSet() {
    if (_currentDimensionSet == DimensionSets.small) {
      _currentDimensionSet = DimensionSets.large;
    } else {
      _currentDimensionSet = DimensionSets.small;
    }
  }
}

enum DimensionSets { small, large }

enum Dimensions { width, height }
