import 'package:flutter/material.dart';

class NewMatch extends StatefulWidget {
  const NewMatch({super.key});

  @override
  State<NewMatch> createState() => _NewMatchState();
}

class _NewMatchState extends State<NewMatch> {
  bool isAdvancedEnabled = false;
  bool additionalStatistics = false;
  bool rallyLength = false;
  bool trackChallenge = false;
  bool autoSwitchPlayer = false;

  void toggleAdvanced(bool value) {
    setState(() {
      isAdvancedEnabled = value;


      if (value) {
        additionalStatistics = true;
        rallyLength = true;
        trackChallenge = true;
      }
    });
  }

  void toggleOption(String option, bool value) {
    setState(() {
      switch (option) {
        case "additionalStatistics":
          additionalStatistics = value;
          break;
        case "rallyLength":
          rallyLength = value;
          break;
        case "trackChallenge":
          trackChallenge = value;
          break;
        case "autoSwitchPlayer":
          autoSwitchPlayer = value;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),

                // Tournament and Match ID
                const Row(
                  children: [
                    Expanded(child: CustomInputField(label: "Tournament ID")),
                    SizedBox(width: 10),
                    Expanded(child: CustomInputField(label: "Match ID")),
                  ],
                ),

                // Player Inputs
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Player 1', style: TextStyle(fontSize: 15)),
                ),
                const CustomInputField(label: "Enter Player 1 Name"),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Player 2', style: TextStyle(fontSize: 15)),
                ),
                const CustomInputField(label: "Enter Player 2 Name"),

                // Pro Set Input
                const CustomInputField(label: "Pro Set"),

                // Custom Rules Note
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Custom rules can be created in Settings',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),

                // Advanced Options Toggle
                SwitchListTile(
                  title: const Text(
                    'Advanced',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  value: isAdvancedEnabled,
                  onChanged: toggleAdvanced,
                ),

                // Show Advanced Options if Enabled
                if (isAdvancedEnabled)
                  Column(
                    children: [
                      CustomSwitch(
                        title: "Additional Statistics",
                        value: additionalStatistics,
                        onChanged: (value) => toggleOption("additionalStatistics", value),
                      ),
                      CustomSwitch(
                        title: "Rally Length",
                        value: rallyLength,
                        onChanged: (value) => toggleOption("rallyLength", value),
                      ),
                      CustomSwitch(
                        title: "Track Challenge",
                        value: trackChallenge,
                        onChanged: (value) => toggleOption("trackChallenge", value),
                      ),
                    ],
                  ),

                // Auto Switch Player Toggle
                CustomSwitch(
                  title: "Auto Switch Player",
                  value: autoSwitchPlayer,
                  onChanged: (value) => toggleOption("autoSwitchPlayer", value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
     return Container(
      height: 50,
      width: double.infinity,
      color: Colors.purple[300],
      child: Row(
        children:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(child: Icon(Icons.arrow_back, color: Colors.white),onTap: (){
              Navigator.pop(context);
            },),
          ),
          Text(
            'Start Match',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}


// Header Section Widget


// Custom Input Field Widget
class CustomInputField extends StatelessWidget {
  final String label;

  const CustomInputField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

// Custom Switch Widget
class CustomSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
