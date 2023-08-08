import 'package:flutter/material.dart';
import 'package:stream_demo/gender_hobby_app_stream/gender_hobby_stream.dart';

class GenderHobbyDemoUi extends StatelessWidget {
  const GenderHobbyDemoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: StreamGenderHobbyBloc.txtNameEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: StreamGenderHobbyBloc.txtLastNameEditingController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'LastName',
                labelText: 'LastName',
              ),
            ),
            const SizedBox(height: 5),
            StreamBuilder(
              stream: StreamGenderHobbyBloc.genderStreamController,
              builder: (context, snapshot) => Row(
                children: [
                  const Text('Gender :  '),
                  const Text('Male'),
                  Radio(
                    value: StreamGenderHobbyBloc.male,
                    groupValue: StreamGenderHobbyBloc.gender,
                    onChanged: (value) {
                      StreamGenderHobbyBloc.genderControllerValue =
                          StreamGenderHobbyBloc.gender = value!;
                    },
                  ),
                  const Text('Female'),
                  Radio(
                    value: StreamGenderHobbyBloc.feMale,
                    groupValue: StreamGenderHobbyBloc.gender,
                    onChanged: (value) {
                      StreamGenderHobbyBloc.genderControllerValue =
                          StreamGenderHobbyBloc.gender = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('Hobby :   '),
                StreamBuilder(
                  stream: StreamGenderHobbyBloc.hobbyCricketStreamController,
                  builder: (context, snapshot) => Checkbox(
                    value: StreamGenderHobbyBloc.isCricket,
                    onChanged: (value) {
                      StreamGenderHobbyBloc.hobbyCricketControllerValue =
                          StreamGenderHobbyBloc.isCricket = value!;
                    },
                  ),
                ),
                const Text('Cricket'),
                StreamBuilder(
                  stream: StreamGenderHobbyBloc.hobbyFootballStreamController,
                  builder: (context, snapshot) => Checkbox(
                    value: StreamGenderHobbyBloc.isFootball,
                    onChanged: (value) {
                      StreamGenderHobbyBloc.hobbyFootballControllerValue =
                          StreamGenderHobbyBloc.isFootball = value!;
                    },
                  ),
                ),
                const Text('Football'),
                StreamBuilder(
                  stream: StreamGenderHobbyBloc.hobbySingingStreamController,
                  builder: (context, snapshot) => Checkbox(
                    value: StreamGenderHobbyBloc.isSinging,
                    onChanged: (value) {
                      StreamGenderHobbyBloc.hobbySingingControllerValue =
                          StreamGenderHobbyBloc.isSinging = value!;
                    },
                  ),
                ),
                const Text('Singing'),
              ],
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                StreamGenderHobbyBloc.submitControllerValue =
                    StreamGenderHobbyBloc.submited =
                        !StreamGenderHobbyBloc.submited;
                StreamGenderHobbyBloc.addUserData();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 5),
            StreamBuilder(
              builder: (context, snapshot) =>
                  StreamGenderHobbyBloc.userData.isEmpty
                      ? const Text('There is not data')
                      : Expanded(
                          child: ListView.builder(
                            itemCount: StreamGenderHobbyBloc.userData.length,
                            itemBuilder: (context, index) => Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.tealAccent,
                              child: Column(
                                children: [
                                  StreamBuilder(
                                    stream: StreamGenderHobbyBloc
                                        .genderStreamController,
                                    builder: (context, snapshot) => Text(
                                      StreamGenderHobbyBloc.userData[index]
                                          ['gender'],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
