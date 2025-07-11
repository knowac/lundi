import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LundiSlider extends StatefulWidget {
  const LundiSlider({required this.label, super.key});
  final String label;

  @override
  State<LundiSlider> createState() => _LundiSliderState();
}

class _LundiSliderState extends State<LundiSlider> {
  var _value = 3;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
          trackShape: const RoundedRectSliderTrackShape(),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 14,
            pressedElevation: 8,
          ),
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveTrackColor: Theme.of(context).colorScheme.primaryContainer,
          activeTickMarkColor: Theme.of(context).colorScheme.primaryContainer,
          inactiveTickMarkColor: Theme.of(context).colorScheme.primary,
          tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 4),
          trackHeight: 8,
          overlayColor: Theme.of(
            context,
          ).colorScheme.secondary.withAlpha((0.2 * 255).round()),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Theme.of(context).colorScheme.primary,
          valueIndicatorTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 20,
          ),
        ),
        child: Slider(
          label: '$_value',
          value: _value.roundToDouble(),
          divisions: 4,
          onChanged: (value) {
            setState(() {
              _value = value.round();
            });
          },
          max: 5,
        ),
      ),
    ],
  );
}
