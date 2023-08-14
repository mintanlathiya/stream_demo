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
            // StreamBuilder(
            //   stream: StreamGenderHobbyBloc.ageStreamController,
            //   builder: (context, snapshot) => Slider(
            //     value: StreamGenderHobbyBloc.selectedAge,
            //     onChanged: (value) {
            //       StreamGenderHobbyBloc.ageControllerValue =
            //           StreamGenderHobbyBloc.selectedAge = value;
            //     },
            //     min: 0,
            //     max: 100,
            //   ),
            // ),
            const SizedBox(height: 5),
            StreamBuilder(
              stream: StreamGenderHobbyBloc.submitStreamController,
              builder: (context, snapshot) => ElevatedButton(
                onPressed: () {
                  StreamGenderHobbyBloc.submitControllerValue =
                      StreamGenderHobbyBloc.submited = true;

                  StreamGenderHobbyBloc.addUserData();
                  StreamGenderHobbyBloc.userDataControllerValue =
                      StreamGenderHobbyBloc.userData;
                  StreamGenderHobbyBloc.clearData();
                },
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 5),
            StreamBuilder(
              stream: StreamGenderHobbyBloc.userDataStreamController,
              builder: (context, snapshot) => StreamGenderHobbyBloc
                      .userData.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            StreamGenderHobbyBloc.selecedIndex = index;
                            StreamGenderHobbyBloc.onTapAdd();
                            StreamGenderHobbyBloc.onUpdatTapAdd();
                          },
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              StreamGenderHobbyBloc.userData.removeAt(index);
                            },
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              color: Colors.amber,
                              child: Column(
                                children: [
                                  Text(
                                      'Name : ${snapshot.data![index]['name']}'),
                                  Text(
                                      'MiddleName : ${snapshot.data![index]['middleName']}'),
                                  Text(
                                      'LastName : ${snapshot.data![index]['lastName']}'),
                                  Text(
                                      'Gender : ${snapshot.data![index]['gender']}'),
                                  Text(
                                      'Hobby : ${snapshot.data![index]['hobby']}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text('There is no data'),
            )
          ],
        ),
      ),
    );
  }
}
