import 'dart:convert';
import 'package:flutter/material.dart';
import 'Member.dart';
import 'MemberTile.dart';
import 'MediaButtons.dart';

class MemberList extends StatelessWidget {
  MemberList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(title),
            ),
            Text(
              'Debut Oct. 29, 2018',
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
          ],
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/izone.json'),
          builder: (context, snapshot) {
            var members = json.decode(snapshot.data.toString());
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.15,
                maxCrossAxisExtent: 256,
              ),
              itemCount: members == null ? 0 : members.length,
              itemBuilder: (context, index) {
                return MemberTile(
                  member: Member(
                    id: members[index]['ID'],
                    birthplace: members[index]['BIRTHPLACE'],
                    dateOfBirth: members[index]['DATEOFBIRTH'],
                    fullName: members[index]['FULLNAME'],
                    fullNameKorean: members[index]['FULLNAME_KR'],
                    nationality: members[index]['NATIONALITY'],
                    stageName: members[index]['STAGENAME'],
                    stageNameKorean: members[index]['STAGENAME_KR'],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
