import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/job_journey/client_job_description_cubit/job_description_cubit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:smart_form/smart_form.dart';

class BookingTitleField extends StatelessWidget {
  const BookingTitleField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 65.h,
      padding: EdgeInsets.only(top: 25.h),
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25.h, left: 25.h),
            helperText: ' ',
            hintText: 'work title e.g. Plumbing Kitchen',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(errorText: 'please enter a title'),
        onChanged: (value) {
          clientJobDescriptonCubit.workTitleChanged(value);
        },
      ),
    );
  }
}

class BookingDescriptionField extends StatelessWidget {
  const BookingDescriptionField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(15.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        maxLines: null,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(25.h, 20.h, 25.h, 20.h),
            helperText: ' ',
            hintText: 'Describe work to be done...',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator:
            RequiredValidator(errorText: 'please enter your description'),
        onChanged: (value) {
          clientJobDescriptonCubit.descriptionChanged(value);
        },
      ),
    );
  }
}

class LocationBookingDropDown extends StatefulWidget {
  LocationBookingDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _LocationBookingDropDownState createState() =>
      _LocationBookingDropDownState();
}

class _LocationBookingDropDownState extends State<LocationBookingDropDown> {
  String location;
  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return SmartFormField(
        autovalidate: true,
        validator: (value) {
          if (value == null) return 'please select a location';
        },
        builder: (state) {
          return Parent(
              style: ParentStyle()
                ..borderRadius(all: 15.h)
                ..background.color(Colors.white)
                ..height(65.h)
                ..padding(left: 20.h, right: 20.h)
                ..margin(horizontal: 20.h)
                ..ripple(true)
                ..boxShadow(
                    color: kBoxShadowColor.shade400,
                    blur: kBoxShadowBlur,
                    offset: kBoxShadowOffset),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Icon(LineAwesomeIcons.building,
                          color: Colors.grey.shade500),
                      SizedBox(width: 20.h),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: location,
                              isExpanded: true,
                              hint: Text("Location",
                                  style: TextStyle(
                                      fontSize: 21.h,
                                      fontWeight: FontWeight.w400)),
                              items: [...widget.items]
                                  .map((location) => DropdownMenuItem(
                                        value: location,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('$location',
                                              style: TextStyle(
                                                  fontSize: 21.sp,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  location = value;
                                });

                                state.didChange(location);
                                state.validate();
                                clientJobDescriptonCubit.locationChanged(value);
                              }),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      height: 70.h,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(left: 50.h),
                      child: Text(
                        state.errorText ?? ' ',
                        style: TextStyle(
                            color: Theme.of(context).errorColor, fontSize: 12),
                      ))
                ],
              ));
        });
  }
}

class BookingMultipleImagePicker extends StatefulWidget {
  BookingMultipleImagePicker({Key key}) : super(key: key);

  @override
  _BookingMultipleImagePickerState createState() =>
      _BookingMultipleImagePickerState();
}

class _BookingMultipleImagePickerState
    extends State<BookingMultipleImagePicker> {
  List<Asset> images;

  @override
  void initState() {
    super.initState();
    images = [];
  }

  Widget buildGridView(BuildContext context) {
    return SizedBox(
      height: images.length == 0 ? 0.h : 120.h,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20.h),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          Asset asset = images[index];
          return Container(
            margin: EdgeInsets.only(right: 20.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.h),
              child: Container(
                child: AssetThumb(
                  asset: asset,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> loadAssets(BuildContext context) async {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 8,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#0095D8",
          actionBarTitle: "Select Images",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#0095D8",
        ),
      );
    } on Exception catch (e) {}

    if (!mounted) return;

    setState(() {
      images = resultList;
      clientJobDescriptonCubit.workTodoPhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        autovalidate: true,
        validator: (value) {
          if (value.length == 0) return 'please add atleast one photo';
        },
        builder: (state) {
          return Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 12),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.h),
                  child: GestureDetector(
                    onTap: () async {
                      await loadAssets(context);
                      state.didChange(images);
                      state.validate();
                    },
                    child: Container(
                        height: 100.h,
                        width: 100.h,
                        color: Colors.blueAccent,
                        child: Center(
                          child: Text(
                            'Add Photos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21.h,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ),
                buildGridView(context)
              ],
            ),
          );
        });
  }
}

class BookingDatePicker extends StatelessWidget {
  const BookingDatePicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 65.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.only(left: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(15.h),
        boxShadow: [
          BoxShadow(
              color: kBoxShadowColor.shade400,
              blurRadius: kBoxShadowBlur,
              offset: kBoxShadowOffset)
        ],
      ),
      child: DateTimePicker(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          border: InputBorder.none,
          labelText: "Select date for service to be delivered",
          labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 21.sp,
              color: Colors.black54),
        ),
        type: DateTimePickerType.date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        dateMask: 'yyyy/MM/dd',
        initialValue: DateTime.now().toString(),
        onChanged: (val) {
          clientJobDescriptonCubit.bookingDateChanged(val);
        },
      ),
    );
  }
}

class BookingTimePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JobDescriptionCubit clientJobDescriptonCubit =
        BlocProvider.of<JobDescriptionCubit>(context);
    return Container(
      height: 65.h,
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.only(left: 25.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(15.h),
        boxShadow: [
          BoxShadow(
              color: kBoxShadowColor.shade400,
              blurRadius: kBoxShadowBlur,
              offset: kBoxShadowOffset)
        ],
      ),
      child: DateTimePicker(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5, bottom: 5),
          border: InputBorder.none,
          labelText: "Select time for service to be delivered",
          labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 21.sp,
              color: Colors.black54),
        ),
        type: DateTimePickerType.time,
        initialValue: DateFormat('HH:mm').format(DateTime.now()),
        onChanged: (val) {
          clientJobDescriptonCubit.bookingTimeChanged(val);
        },
      ),
    );
  }
}
