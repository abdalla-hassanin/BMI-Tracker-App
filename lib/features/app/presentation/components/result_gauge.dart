import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultGauge extends StatelessWidget {
  final double bmiResult;
   const ResultGauge({super.key,required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return   SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          ticksPosition: ElementsPosition.outside,
          labelsPosition: ElementsPosition.outside,
          startAngle: 180,
          endAngle: 0,
          minimum: 10,
          maximum: 40,
          axisLabelStyle: const GaugeTextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
          majorTickStyle: const MajorTickStyle(
            length: 0.1,
            lengthUnit: GaugeSizeUnit.factor,
          ),
          labelOffset: 15,
          ranges: _getGaugeRanges(),
          pointers: <GaugePointer>[
            NeedlePointer(value: bmiResult),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Text(
                bmiResult.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              angle: 90,
              positionFactor: 0.5,
            ),
          ],
        ),
      ],
    );
  }

  List<GaugeRange> _getGaugeRanges() {
    return [
      GaugeRange(
        label: 'Underweight',
        startValue: 10,
        endValue: 18.5,
        color: Colors.grey,
        sizeUnit: GaugeSizeUnit.factor,
        startWidth: 0.25,
        endWidth: 0.25,
        labelStyle: const GaugeTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      GaugeRange(
        label: 'Normal',
        startValue: 18.5,
        endValue: 25,
        color: Colors.green,
        startWidth: 0.25,
        endWidth: 0.25,
        sizeUnit: GaugeSizeUnit.factor,
        labelStyle: const GaugeTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      GaugeRange(
        label: 'Overweight',
        startValue: 25,
        endValue: 30,
        color: Colors.yellow,
        startWidth: 0.25,
        endWidth: 0.25,
        sizeUnit: GaugeSizeUnit.factor,
        labelStyle: const GaugeTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      GaugeRange(
        label: 'Obese',
        startValue: 30,
        endValue: 45,
        color: Colors.red,
        startWidth: 0.25,
        endWidth: 0.25,
        sizeUnit: GaugeSizeUnit.factor,
        labelStyle: const GaugeTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }

}
