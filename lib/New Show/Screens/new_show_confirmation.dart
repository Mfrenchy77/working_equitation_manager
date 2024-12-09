import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:working_equitation_manager/Database/Models/offical.dart';
import 'package:working_equitation_manager/Database/Models/show.dart';
import 'package:working_equitation_manager/New%20Show/Cubit/show_form_cubit.dart';
import 'package:working_equitation_manager/Utils/routes.dart';

class ShowConfirmation extends StatelessWidget {
  const ShowConfirmation({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowFormCubit, ShowFormState>(builder: (context, state) {
      // FORMAT DATE AND TIME TO  month/day/year hour:minute  AM/PM

      final cubit = context.read<ShowFormCubit>();
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Show Name
            Text(
              state.competitionName ?? "Unnamed Show",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Show Information Section
            _buildSectionTitle("Show Information"),
            _buildInfoRow(
                "Date and Start Time:",
                DateFormat('MMM dd yyyy HH:mm')
                    .format(state.showStartDateAndStartTime ?? DateTime.now())),
            _buildInfoRow(
                "End Date and Time:",
                DateFormat('MMM dd yyyy HH:mm')
                    .format(state.showEndDateAndEndTime ?? DateTime.now())),
            _buildInfoRow("Facility Name:", state.facilityName),
            _buildInfoRow("Facility Address:", state.facilityAddress),
            _buildInfoRow("Facility City:", state.facilityCity),
            _buildInfoRow("Facility State:", state.facilityState),
            _buildInfoRow("Region Number:", state.regionNumber?.toString()),
            _buildInfoRow("Show Type:", state.showType?.name),

            const SizedBox(height: 16),

            _buildSectionTitle("Levels Offered"),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: state.levelsOffered
                      ?.map((level) => Text("- Level $level"))
                      .toList() ??
                  [const Text("No levels selected.")],
            ),
            _buildInfoRow("Cattle Trial Offered:",
                state.cattleTrialOffered == true ? "Yes" : "No"),

            const SizedBox(height: 16),

            // Officials Section
            _buildSectionTitle("Officials"),
            _buildSubSectionTitle("Judges"),
            ..._buildOfficialList(state.judges),

            _buildSubSectionTitle("Technical Delegates"),
            ..._buildOfficialList(state.technicalDelegates),

            _buildSubSectionTitle("Gate Steward"),
            _buildSingleOfficial(state.gateSteward),

            _buildSubSectionTitle("Show Secretary"),
            _buildSingleOfficial(state.showSecretary),

            _buildSubSectionTitle("Other Officials"),
            ..._buildOfficialList(state.otherOfficials),

            const SizedBox(height: 16),

            // License Requirement Section
            if (state.isLicenseNeeded) ...[
              _buildSectionTitle("License Request"),
              const Text(
                "This show requires a license request. Generate the license request file to submit.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // cubit.generateLicenseRequestFile();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("License request file generated!")),
                  );
                },
                child: const Text("Generate License Request File"),
              ),
            ] else if (state.showType == ShowType.Schooling) ...[
              _buildSectionTitle("Schooling Show"),
              const Text(
                "This is a schooling show. No license required.",
                style: TextStyle(fontSize: 16),
              ),
            ] else ...[
              _buildSectionTitle("Lisense Number"),
              Text(
                state.licenseNumber.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text('Finish'),
                  onPressed: () {
                    if (state.show != null) {
                      // Finalize the show and navigate to the ShowPage
                      cubit.finalizeShow();
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.show,
                        arguments: state.show,
                      );
                    } else {
                      // Handle the error, such as showing a snackbar or alert

                      cubit.error("Show is null");
                    }
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$label ",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Text(value ?? "N/A"),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleOfficial(Official? official) {
    if (official == null) {
      return const Text("No official assigned.");
    }
    return Text("- ${official.name} (${official.role.name})");
  }

  List<Widget> _buildOfficialList(List<Official> officials) {
    if (officials.isEmpty) {
      return [const Text("No officials added.")];
    }
    return officials
        .map((official) => Text("- ${official.name} (${official.role.name})"))
        .toList();
  }
}
