//**Key */
import 'package:flutter/material.dart';

var formKeyLogin = GlobalKey<FormState>();
var formKeyLoginFriend = GlobalKey<FormState>();
var formKeyLeaves = GlobalKey<FormState>();
var formKeyPayroll = GlobalKey<FormState>();
var formKeyPwd = GlobalKey<FormState>();

//**Focus Node */
var fnEmail = FocusNode();
var fnEmailFriend= FocusNode();
var fnPassword = FocusNode();
var fnPasswordFriend = FocusNode();
var fnPasswordConf = FocusNode();

dynamic image;

var dataQR = TextEditingController();