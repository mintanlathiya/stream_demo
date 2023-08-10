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
            StreamBuilder(
              stream: StreamGenderHobbyBloc.nameStreamController,
              builder: (context, snapshot) => TextField(
                controller: StreamGenderHobbyBloc.txtNameEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                  labelText: 'Name',
                ),
              ),
            ),
            const SizedBox(height: 5),
            StreamBuilder(
              stream: StreamGenderHobbyBloc.middleNameStreamController,
              builder: (context, snapshot) => TextField(
                controller:
                    StreamGenderHobbyBloc.txtMiddleNameEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'MiddleName',
                  labelText: 'MiddleName',
                ),
              ),
            ),
            const SizedBox(height: 5),
            StreamBuilder(
              stream: StreamGenderHobbyBloc.lastNameStreamController,
              builder: (context, snapshot) => TextField(
                controller: StreamGenderHobbyBloc.txtLastNameEditingController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'LastName',
                  labelText: 'LastName',
                ),
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
            StreamBuilder(
              stream: StreamGenderHobbyBloc.ageStreamController,
              builder: (context, snapshot) => Slider(
                value: StreamGenderHobbyBloc.selectedAge,
                onChanged: (value) {
                  StreamGenderHobbyBloc.ageControllerValue =
                      StreamGenderHobbyBloc.selectedAge = value;
                },
                min: 0,
                max: 100,
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                StreamGenderHobbyBloc.addUserData();

                print(StreamGenderHobbyBloc.userData);

                // StreamGenderHobbyBloc.nameControllerValue =
                //     StreamGenderHobbyBloc.txtNameEditingController.text;
                // StreamGenderHobbyBloc.middleNameControllerValue =
                //     StreamGenderHobbyBloc.txtMiddleNameEditingController.text;
                //   StreamGenderHobbyBloc.lastNameControllerValue =
                //       StreamGenderHobbyBloc.txtLastNameEditingController.text;
                //   StreamGenderHobbyBloc.selectHobbyList.clear();
                //   if (StreamGenderHobbyBloc.isCricket == true) {
                //     StreamGenderHobbyBloc.selectHobbyList.add('Cricket');
                //   }
                //   if (StreamGenderHobbyBloc.isFootball == true) {
                //     StreamGenderHobbyBloc.selectHobbyList.add('Football');
                //   }
                //   if (StreamGenderHobbyBloc.isSinging == true) {
                //     StreamGenderHobbyBloc.selectHobbyList.add('Singing');
                //   }
                //   StreamGenderHobbyBloc.selectHobbyControllerValue =
                //       StreamGenderHobbyBloc.selectHobbyList;
              },
              child: const Text('Submit'),
            ),

            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.nameStreamController,
            //   builder: (context, snapshot) => Text('Name :${snapshot.data}'),
            // ),
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.middleNameStreamController,
            //   builder: (context, snapshot) =>
            //       Text('MiddleName :${snapshot.data}'),
            // ),
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.lastNameStreamController,
            //   builder: (context, snapshot) =>
            //       Text('LastName :${snapshot.data}'),
            // ),
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.genderStreamController,
            //   builder: (context, snapshot) => Text('Gender :${snapshot.data}'),
            // ),
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.selectHobbyStreamController,
            //   builder: (context, snapshot) => Text('Hobby :${snapshot.data}'),
            // ),
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.ageStreamController,
            //   builder: (context, snapshot) => Text('Age :${snapshot.data}'),
            // ),
            const SizedBox(height: 5),
            StreamGenderHobbyBloc.submited
                ? const Text('There is not data')
                : Container(),
          ],
        ),
      ),
    );
  }
}
