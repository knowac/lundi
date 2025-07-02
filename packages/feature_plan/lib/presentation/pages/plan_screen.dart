import 'package:feature_plan/presentation/widgets/lundi_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared/generated/l10n.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _startLocation = TextEditingController();
  final _endLocation = TextEditingController();
  final _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 130),
      child: Container(
        padding: EdgeInsets.only(top: 130),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).planFormTitle,
                style: GoogleFonts.agdasima().copyWith(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                S.of(context).planFormExplanation,
                style: GoogleFonts.roboto().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Column(
                spacing: 16,
                children: [
                  TextFormField(
                    controller: _startDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).planDateValidationEmpty;
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 10, 12, 31),
                      );
                      setState(() {
                        if (picked != null) {
                          _startDateController.value = TextEditingValue(
                            text: _dateFormat.format(picked),
                          );
                        } else {
                          _formKey.currentState?.validate();
                        }
                      });
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      filled: true,
                      labelText: "Start date",
                      hintText: "DD/MM/YYYY",
                      border: OutlineInputBorder(gapPadding: 6),
                    ),
                  ),
                  TextFormField(
                    controller: _endDateController,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).planDateValidationEmpty;
                      }
                      return null;
                    },
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 10, 12, 31),
                      );
                      setState(() {
                        if (picked != null) {
                          _endDateController.value = TextEditingValue(
                            text: _dateFormat.format(picked),
                          );
                        } else {
                          _formKey.currentState?.validate();
                        }
                      });
                    },
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      filled: true,
                      labelText: "End date",
                      hintText: "DD/MM/YYYY",
                      border: OutlineInputBorder(gapPadding: 6),
                    ),
                  ),
                  TextFormField(
                    controller: _startLocation,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).planLocationValidationEmpty;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      filled: true,
                      labelText: "Start location",
                      hintText: "Select trip starting location",
                      border: OutlineInputBorder(gapPadding: 6),
                    ),
                  ),
                  TextFormField(
                    controller: _endLocation,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).planLocationValidationEmpty;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.onPrimary,
                      filled: true,
                      labelText: "Start location",
                      hintText: "Select trip starting location",
                      border: OutlineInputBorder(gapPadding: 6),
                    ),
                  ),
                  Text(
                    S.of(context).planFormInterestsExplanation,
                    style: GoogleFonts.roboto().copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  LundiSlider(label: S.of(context).planFormInterestsNature),
                  LundiSlider(label: S.of(context).planFormInterestsCulture),
                  LundiSlider(label: S.of(context).planFormInterestsCities),
                  LundiSlider(label: S.of(context).planFormInterestsFood),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.tertiary,
                          ],
                          stops: [0, 100],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          S.of(context).planCalculateRouteButton,
                          style: GoogleFonts.roboto().copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
