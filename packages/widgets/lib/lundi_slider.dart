import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LundiSlider extends StatefulWidget {
  final String label;

  const LundiSlider({
    super.key,
    required this.label,
  });

  @override
  State<LundiSlider> createState() => _LundiSliderState();
}

class _LundiSliderState extends State<LundiSlider> {
  int _value = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.roboto().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackShape: RoundedRectSliderTrackShape(),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 14.0,
              pressedElevation: 8.0,
            ),
            activeTrackColor: Theme.of(context).colorScheme.primary,
            inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
            activeTickMarkColor: Theme.of(context).colorScheme.primaryContainer,
            inactiveTickMarkColor: Theme.of(context).colorScheme.primary,
            tickMarkShape: RoundSliderTickMarkShape(
              tickMarkRadius: 4,
            ),
            trackHeight: 8,
            overlayColor: Theme.of(context)
                .colorScheme
                .secondary
                .withAlpha((0.2 * 255).round()),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 16.0,
            ),
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Theme.of(context).colorScheme.primary,
            valueIndicatorTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 20.0,
            ),
          ),
          child: Slider(
            label: '${_value.round()}',
            value: _value.roundToDouble(),
            divisions: 4,
            onChanged: (value) {
              setState(() {
                _value = value.round();
              });
            },
            min: 0,
            max: 5,
          ),
        ),
      ],
    );
  }
}
