import 'package:edspert_flutter_final_project_elearning/data/model/user_registration_request.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../routes/routes.dart';
import '../../widgets/register_button.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameTextController = TextEditingController();
  final TextEditingController _schoolNameTextController =
      TextEditingController();
  String? selectedKelas;
  String jenisKelamin = '';

  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.grayscaleBackground,
          appBar: AppBar(
            backgroundColor: AppColors.grayscaleOffWhite,
            leading: IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.login);
              },
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Yuk isi data diri',
              style: TextStyle(
                  color: AppColors.grayscaleTitleActive,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 40),
              child: SizedBox.shrink(),
            ),
            shadowColor: AppColors.grayscaleLine,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller.emailTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 24),
                const Text('Nama Lengkap',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                TextFormField(
                  controller: _fullNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'contoh: Moh. Bintang Saputra',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 24),
                const Text('Jenis Kelamin',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            jenisKelamin = 'Laki-Laki';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 35),
                          decoration: BoxDecoration(
                            color: jenisKelamin == 'Laki-Laki'
                                ? Colors.green
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.grayscaleOutLine,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Laki-Laki',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: jenisKelamin == 'Laki-Laki'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            jenisKelamin = 'Perempuan';
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 35),
                          decoration: BoxDecoration(
                            color: jenisKelamin == 'Perempuan'
                                ? Colors.green
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.grayscaleOutLine,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            'Perempuan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: jenisKelamin == 'Perempuan'
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Kelas',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Container(
                  height: 56,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.grayscaleOutLine,
                        width: 1,
                      )),
                  child: DropdownButton<String?>(
                    value: selectedKelas,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text('Pilih Kelas'),
                    items: ['10', '11', '12']
                        .map((element) => DropdownMenuItem<String?>(
                            value: element, child: Text('Kelas $element')))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          selectedKelas = value;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Nama Sekolah',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                TextFormField(
                  controller: _schoolNameTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Nama Sekolah',
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(
                  height: 36,
                ),
                RegisterButton(
                    text: 'DAFTAR',
                    textColor: Colors.white,
                    backgroundColor: AppColors.primary,
                    onPressed: () async {
                      if (_formKey.currentState!.validate() == true) {
                        if (selectedKelas != null) {
                          if (jenisKelamin != '') {
                            final UserRegistrationRequest userBody =
                                UserRegistrationRequest(
                                    email: controller.emailTextController.text,
                                    fullName: _fullNameTextController.text,
                                    gender: jenisKelamin,
                                    schoolName: _schoolNameTextController.text,
                                    schoolLevel: 'SMA',
                                    schoolGrade: selectedKelas!,
                                    photoUrl:
                                        'https://avatars.githubusercontent.com/u/61449421?v=4');
                            final bool isSuccessRegister = await controller
                                .registerUser(userBody: userBody);
                            if (isSuccessRegister) {
                              Get.snackbar('Register', 'Success registered!',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.success,
                                  colorText: AppColors.grayscaleOffWhite);
                              Get.offAllNamed(Routes.dashboard);
                            } else {
                              Get.snackbar(
                                'Invalid!',
                                'User Registration Failed!',
                                backgroundColor: AppColors.warning,
                              );
                            }
                          } else {
                            Get.snackbar(
                              'Invalid!',
                              'Jenis Kelamin Harus Diisi!',
                              backgroundColor: AppColors.warning,
                            );
                          }
                        } else {
                          Get.snackbar(
                            'Invalid!',
                            'Kelas Harus Diisi!',
                            backgroundColor: AppColors.warning,
                          );
                        }
                      } else {
                        Get.snackbar(
                            'Invalid!', 'Please check Your inputed data!',
                            backgroundColor: AppColors.warning);
                      }
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
