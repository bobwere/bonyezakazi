import 'dart:io';

import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/application/registration_cubit/registration_cubit.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:smart_form/smart_form.dart';

class BonyezaPhoneRegistrationField extends StatelessWidget {
  const BonyezaPhoneRegistrationField(
      {Key key,
      @required this.hintText,
      @required this.onChanged,
      this.obscureText = false,
      this.maxLength,
      @required this.validationErrorText})
      : super(key: key);

  final String hintText;
  final Function(String value) onChanged;
  final String validationErrorText;
  final bool obscureText;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      widthResponsive: false,
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
          autovalidate: true,
          obscureText: obscureText,
          textAlign: TextAlign.left,
          maxLength: 9,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.h),
              isDense: true,
              hintText: hintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              border: InputBorder.none),
          validator: RequiredValidator(errorText: ''),
          onChanged: (value) => onChanged(value)),
    );
  }
}

class BonyezaRegistrationField extends StatelessWidget {
  const BonyezaRegistrationField(
      {Key key,
      @required this.hintText,
      @required this.onChanged,
      this.obscureText = false,
      @required this.validationErrorText})
      : super(key: key);

  final String hintText;
  final Function(String value) onChanged;
  final String validationErrorText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsetsResponsive.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
          autovalidate: true,
          obscureText: obscureText,
          textAlign: TextAlign.left,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 20.h, bottom: 20.h, left: 20.h),
              isDense: true,
              hintText: hintText,
              errorStyle: TextStyle(height: 0),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              border: InputBorder.none),
          validator: RequiredValidator(errorText: ''),
          onChanged: (value) => onChanged(value)),
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
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
            contentPadding: EdgeInsets.only(top: 25.h),
            helperText: ' ',
            prefixIcon:
                Icon(LineAwesomeIcons.user, color: Colors.grey.shade500),
            hintText: 'username',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(
            errorText: '                please enter your username'),
        onChanged: (value) {
          registrationCubit.usernameChanged(value);
        },
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 25.h, right: 30.h),
      margin: EdgeInsets.only(left: 10.h, right: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: SmartTextFormField(
        autovalidate: true,
        maxLength: 9,
        keyboardType: TextInputType.phone,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25.h, left: 20.h),
            helperText: ' ',
            hintText: 'phone number',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(errorText: 'please enter your number'),
        onChanged: (value) {
          registrationCubit.phoneChanged(value);
        },
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key key,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool canNotSeePassword = true;
  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: 25.h,
      ),
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
        obscureText: canNotSeePassword,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black54,
            fontSize: 21.h,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25.h),
            helperText: ' ',
            prefixIcon:
                Icon(LineAwesomeIcons.lock, color: Colors.grey.shade500),
            suffixIcon: IconButton(
                padding: EdgeInsets.only(bottom: 5.h),
                icon: canNotSeePassword
                    ? Icon(LineAwesomeIcons.eye)
                    : Icon(LineAwesomeIcons.eye_slash),
                onPressed: () {
                  setState(() {
                    canNotSeePassword = !canNotSeePassword;
                  });
                }),
            hintText: 'password',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(
            errorText: '                please enter a password'),
        onChanged: (value) {
          registrationCubit.passwordChanged(value);
        },
      ),
    );
  }
}

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({Key key, this.onTextPressed}) : super(key: key);

  final Function onTextPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTextPressed,
      child: Container(
        padding: EdgeInsets.all(20.h),
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Already have an account?',
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Sign in',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w800),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class CityField extends StatelessWidget {
  const CityField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
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
            contentPadding: EdgeInsets.only(top: 25.h),
            helperText: ' ',
            prefixIcon:
                Icon(LineAwesomeIcons.city, color: Colors.grey.shade500),
            hintText: 'city e.g Nairobi',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(
            errorText: '                please enter your city'),
        onChanged: (value) {
          registrationCubit.cityChanged(value);
        },
      ),
    );
  }
}

class LocationField extends StatelessWidget {
  const LocationField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: MediaQuery.of(context).size.width,
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
            contentPadding: EdgeInsets.only(top: 25.h),
            helperText: ' ',
            prefixIcon:
                Icon(LineAwesomeIcons.building, color: Colors.grey.shade500),
            hintText: 'Enter your location e.g Umoja',
            hintStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
            border: InputBorder.none),
        validator: RequiredValidator(
            errorText: '                please enter your location'),
        onChanged: (value) {
          registrationCubit.locationChanged(value);
        },
      ),
    );
  }
}

class LocationRegDropDown extends StatefulWidget {
  LocationRegDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _LocationRegDropDownState createState() => _LocationRegDropDownState();
}

class _LocationRegDropDownState extends State<LocationRegDropDown> {
  String location;
  @override
  Widget build(BuildContext context) {
    RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
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
                ..height(60.h)
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
                                registrationCubit.locationChanged(value);
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

class SkillsRegDropDown extends StatefulWidget {
  SkillsRegDropDown({Key key, @required this.items}) : super(key: key);
  List<String> items;

  @override
  _SkillsRegDropDownState createState() => _SkillsRegDropDownState();
}

class _SkillsRegDropDownState extends State<SkillsRegDropDown> {
  String location;
  @override
  Widget build(BuildContext context) {
    RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    return SmartFormField(
        autovalidate: true,
        validator: (value) {
          if (value == null) return 'please select a skill';
        },
        builder: (state) {
          return Parent(
              style: ParentStyle()
                ..borderRadius(all: 15.h)
                ..background.color(Colors.white)
                ..height(60.h)
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
                      Icon(LineAwesomeIcons.identification_card,
                          color: Colors.grey.shade500),
                      SizedBox(width: 20.h),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: location,
                              isExpanded: true,
                              hint: Text("Skill",
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
                                registrationCubit.skillChanged(value);
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

class CountryCodeField extends StatelessWidget {
  const CountryCodeField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);

    return ContainerResponsive(
      height: 60,
      widthResponsive: false,
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      margin: EdgeInsets.only(left: 20.h, right: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(100.h),
          boxShadow: [
            BoxShadow(
                color: kBoxShadowColor.shade400,
                blurRadius: kBoxShadowBlur,
                offset: kBoxShadowOffset)
          ]),
      child: Center(
        child: CountryCodePicker(
          onChanged: (CountryCode countryCode) {
            FocusScope.of(context).requestFocus(new FocusNode());
            registrationCubit.dialCodeChanged(countryCode.toString());
          },
          initialSelection: '+254',
          textStyle: TextStyle(fontSize: 21.h, fontWeight: FontWeight.w400),
          favorite: ['+255', '+256'],
          showFlag: false,
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
      ),
    );
  }
}

class MultipleImagePicker extends StatefulWidget {
  MultipleImagePicker({Key key}) : super(key: key);

  @override
  _MultipleImagePickerState createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  List<Asset> images = List<Asset>();

  @override
  void initState() {
    super.initState();
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
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
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
      registrationCubit.workPhotosChanged(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        initialValue: [],
        autovalidate: true,
        validator: (value) {
          if (value.length < 2) return 'add atleast two photos of your work';
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
                      FocusScope.of(context).requestFocus(new FocusNode());
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
                            'Add Photos Of Your Work',
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

class ProfileImagePicker extends StatefulWidget {
  ProfileImagePicker({Key key}) : super(key: key);

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File _image;
  final picker = ImagePicker();

  Future<void> getImage(BuildContext context) async {
    final RegistrationCubit registrationCubit =
        BlocProvider.of<RegistrationCubit>(context);
    PickedFile pickedFile;
    try {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    } on Exception catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _image = File(pickedFile.path);
    });
    registrationCubit.photoChanged(_image);
  }

  @override
  Widget build(BuildContext context) {
    return SmartFormField(
        autovalidate: true,
        validator: (value) {
          if (value == null) return 'please add a photo';
        },
        builder: (SmartFormFieldState<File> state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    await getImage(context);
                    state.didChange(_image);
                    state.validate();
                  },
                  child: Container(
                      height: 100.h,
                      width: 100.h,
                      color: Colors.blueAccent,
                      child: _image == null
                          ? Center(
                              child: Text(
                                'Add Profile Photo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 21.h,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Image.file(_image, fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                  child: Container(
                      height: 70.h,
                      padding: EdgeInsets.only(top: 25.h),
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text(
                        state.errorText ?? '',
                        style: TextStyle(
                            color: Theme.of(context).errorColor, fontSize: 12),
                      ))),
            ],
          );
        });
  }
}

class SubmittingOverlay extends StatelessWidget {
  final bool isSubmitting;

  const SubmittingOverlay({
    Key key,
    @required this.isSubmitting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSubmitting,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color:
            isSubmitting ? Colors.black.withOpacity(0.2) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
