import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:wildlife_nl_app/models/animal.dart';
import 'package:wildlife_nl_app/models/interaction.dart';
import 'package:wildlife_nl_app/models/interaction_type.dart';
import 'package:wildlife_nl_app/utilities/app_colors.dart';
import 'package:wildlife_nl_app/utilities/app_icons.dart';
import 'package:wildlife_nl_app/utilities/hex_color.dart';

class ReportItemModal extends StatelessWidget {
  final Interaction interaction;
  final InteractionType type;
  final Animal? animal;

  const ReportItemModal(
      {super.key, required this.interaction, required this.type, this.animal});

  @override
  Widget build(BuildContext context) {
    var dateFormatter = intl.DateFormat.yMd().add_jm();

    return Container(
      padding: const EdgeInsets.only(bottom: 40.0),
      decoration: const BoxDecoration(
          color: AppColors.neutral_100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Text(
                  type.label,
                  style: TextStyle(
                      color: HexColor(type.color),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                    width: 75.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: HexColor(type.color),
                      shape: BoxShape.circle,
                    ),
                    child: type.typeKey == InteractionTypeKey.sighting
                        ? const Icon(
                            AppIcons.paw,
                            color: AppColors.neutral_50,
                            size: 50,
                          )
                        : type.typeKey == InteractionTypeKey.traffic
                            ? const Icon(
                                AppIcons.traffic,
                                color: AppColors.neutral_50,
                                size: 50,
                              )
                            : type.typeKey == InteractionTypeKey.damage
                                ? const Icon(
                                    AppIcons.incident,
                                    color: AppColors.neutral_50,
                                    size: 50,
                                  )
                                : type.typeKey ==
                                        InteractionTypeKey
                                            .inappropriateBehaviour
                                    ? const Icon(
                                        AppIcons.cancel,
                                        color: AppColors.neutral_50,
                                        size: 50,
                                      )
                                    : const Icon(
                                        AppIcons.maintenance,
                                        color: AppColors.neutral_50,
                                        size: 50,
                                      )),
              ],
            ),
          ),
          const SizedBox(height: 40),
          if (animal != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text(
                    "Diersoort: ",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(animal!.name),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Text(
                  "Datum: ",
                  style: TextStyle(
                      color: HexColor(type.color), fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(dateFormatter.format(interaction.time)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Text(
                  "Locatie: ",
                  style: TextStyle(
                      color: HexColor(type.color), fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text("[${interaction.lat}, ${interaction.lon}]"),
              ],
            ),
          ),
          if (interaction.animalCountUpper != null &&
              interaction.animalCountUpper != "0" &&
              interaction.animalCountUpper != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text(
                    "Volwassen: ",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(interaction.animalCountUpper!),
                ],
              ),
            ),
          if (interaction.juvenileCountUpper != null &&
              interaction.juvenileCountUpper != "0" &&
              interaction.juvenileCountUpper != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Text(
                    "Jonge: ",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(interaction.juvenileCountUpper!),
                ],
              ),
            ),
          if (interaction.trafficEvent != null &&
              interaction.trafficEvent != "")
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gebeurtenis",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(interaction.trafficEvent!)
                ],
              ),
            ),
          if (interaction.description != null && interaction.description != "")
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Omschrijving",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(interaction.description!)
                ],
              ),
            ),
          if (interaction.image != null && interaction.image != "")
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Afbeelding",
                    style: TextStyle(
                        color: HexColor(type.color),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(interaction.image!)),
                ],
              ),
            )
        ]),
      ),
    );
  }
}
