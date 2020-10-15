import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart' as load;

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact> _contacts;

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    final Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.h,
        backgroundColor: kBlueBackgroundColor,
        centerTitle: true,
        title: Txt(
          'Contacts',
          style: kAppBarTxtStyle,
        ),
      ),
      body: _contacts != null
          ? ListView.builder(
              itemCount: _contacts?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = _contacts?.elementAt(index);
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: (contact.avatar != null && contact.avatar.isNotEmpty)
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(contact.avatar),
                        )
                      : CircleAvatar(
                          child: Txt(
                            contact.initials(),
                            style: TxtStyle()
                              ..fontFamily('Avenir')
                              ..fontWeight(FontWeight.w500)
                              ..fontSize(24.sp)
                              ..textColor(Colors.white),
                          ),
                          backgroundColor: kBlueBackgroundColor,
                        ),
                  title: Txt(
                    contact.displayName ?? '',
                    style: TxtStyle()
                      ..fontFamily('Avenir')
                      ..fontWeight(FontWeight.w500)
                      ..fontSize(24.sp)
                      ..textColor(Colors.black87),
                  ),
                  trailing: MaterialButton(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.h),
                      color: kBlueBackgroundColor.withOpacity(0.8),
                      child: Txt(
                        'INVITE',
                        style: TxtStyle()
                          ..fontFamily('Avenir')
                          ..fontWeight(FontWeight.w500)
                          ..fontSize(24.sp)
                          ..textColor(Colors.white),
                      ),
                      onPressed: () async {
                        await FlutterOpenWhatsapp.sendSingleMessage(
                            contact.phones.first.value, SOCIAL_SHARE_MESSAGE);
                      }),
                );
              },
            )
          : Center(
              child: Container(
                height: 50.h,
                width: 50.h,
                child: load.LoadingIndicator(
                    indicatorType: load.Indicator.ballTrianglePath,
                    color: kBlueBackgroundColor),
              ),
            ),
    );
  }
}
