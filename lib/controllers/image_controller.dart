import 'dart:async';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:fabswap/controllers/feed_controller.dart';
import 'package:fabswap/controllers/utitlity.dart';
import 'package:fabswap/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/add.dart';


const String apiKey =
String.fromEnvironment('CLOUDINARY_API_KEY', defaultValue: '914928133496541');
const String apiSecret =
String.fromEnvironment('CLOUDINARY_API_SECRET', defaultValue: '73o3dtgfuet_hYE2rptFCLOszwk');
const String cloudName =
String.fromEnvironment('CLOUDINARY_CLOUD_NAME', defaultValue: 'drsx7ajms');
const String folder =
String.fromEnvironment('CLOUDINARY_FOLDER', defaultValue: 'm');
const String uploadPreset =
String.fromEnvironment('CLOUDINARY_UPLOAD_PRESET', defaultValue: 'htqoyhnp');

final cloudinary = Cloudinary.unsignedConfig(
  cloudName: cloudName,
);

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: '',);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum FileSource {
  path,
  bytes,
}

class DataTransmitNotifier {
  final String? path;
  late final ProgressCallback? progressCallback;
  final notifier = ValueNotifier<double>(0);

  DataTransmitNotifier({this.path, ProgressCallback? progressCallback}) {
    this.progressCallback = progressCallback ??
            (count, total) {
          notifier.value = count.toDouble() / total.toDouble();
        };
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static const int loadImage = 1;
  static const int doSignedUpload = 2;
  static const int doUnsignedUpload = 3;
  DataTransmitNotifier dataImages = DataTransmitNotifier();
  CloudinaryResponse cloudinaryResponses = CloudinaryResponse();
  bool loading = false;
  String? errorMessage;
  FileSource fileSource = FileSource.path;
  final TextEditingController _controllerCategory = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSize = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();


  void onUploadSourceChanged(FileSource? value) =>
      setState(() => fileSource = value!);

  Widget get uploadSourceView => Column(
    children: [
      const Text("File source"),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: RadioListTile<FileSource>(
                title: const Text("Path"),
                value: FileSource.path,
                groupValue: fileSource,
                onChanged: onUploadSourceChanged),
          ),
          Expanded(
            child: RadioListTile<FileSource>(
                title: const Text("Bytes"),
                value: FileSource.bytes,
                groupValue: fileSource,
                onChanged: onUploadSourceChanged),
          ),
        ],
      )
    ],
  );

  Widget imageFromPathView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(
            File(dataImages.path!),
            height: MediaQuery.of(context).size.width * 0.75,
            scale: 1.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),
          if (dataImages.notifier.value > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder<double>(
                key: ValueKey(dataImages.path),
                valueListenable: dataImages.notifier,
                builder: (context, value, child) {
                  if (value == 0 && !loading) return const SizedBox();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LinearProgressIndicator(
                        value: value,
                        minHeight: 8.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text('${(value * 100).toInt()} %'),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[



                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(color: Colors.white60),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                                onTap: () {
                                  Navigator.popAndPushNamed(context,MyRoutes.feedpage);
                                },
                                child: const Icon(Icons.arrow_back_ios)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "Listing Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: InkWell(
                              onTap: (){
                                uploadNewProductToFeed(context,cloudinaryResponses.secureUrl.toString() ,_controllerName.text, _controllerSize.text, _controllerPrice.text,_controllerCategory.text);
                              },
                              child: const Text(
                                "NEXT",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),




                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Photo of Product",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          dataImages.path != null
                              ? imageFromPathView()
                              : InkWell(
                            onTap: () => onClick(loadImage),

                            child: Container(
                                height: 80,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.camera),
                                    //Image(image: AssetImage(uploadImg))
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              box('Category',_controllerCategory),
                              box('Dress Name',_controllerName),
                              box('Size',_controllerSize),
                              box('Selling Price',_controllerPrice),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),

               /* if (cloudinaryResponses.secureUrl != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).bottomAppBarColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        text: TextSpan(
                          text: cloudinaryResponses.secureUrl ?? '',
                        ),
                      ),
                    ),
                  ),*/
             /*   Visibility(
                  visible: errorMessage?.isNotEmpty ?? false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$errorMessage",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 18, color: Colors.red.shade900),
                      ),
                      const SizedBox(
                        height: 128,
                      ),
                    ],
                  ),
                ),*/
                //uploadSourceView,
                const SizedBox(
                  height: 16,
                ),
              /*  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loading ? null : () => onClick(doSignedUpload),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(16.0),
                        ),
                      ),
                      child: const Text(
                        'Signed upload',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),*/
                /*const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loading ? null : () => onClick(doUnsignedUpload),
                      style: ButtonStyle(
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                      ),
                      child: const Text(
                        'Unsigned upload',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onNewImages(List<String> filePaths) {
    if (filePaths.isNotEmpty) {
      for (final path in filePaths) {
        if (path.isNotEmpty) {
          setState(() {
            dataImages = DataTransmitNotifier(path: path);
          });
        }
      }
      setState(() {});
    }
  }

  Future<List<int>> getFileBytes(String path) async {
    return await File(path).readAsBytes();
  }

  Future<void> doSingleUpload({bool signed = true}) async {
    try {
      final data = dataImages;
      List<int>? fileBytes;

      if (fileSource == FileSource.bytes) {
        fileBytes = await getFileBytes(data.path!);
      }

      CloudinaryResponse response = signed
          ? await cloudinary.upload(
        file: data.path,
        fileBytes: fileBytes,
        resourceType: CloudinaryResourceType.image,
        folder: folder,
        progressCallback: data.progressCallback,
      )
          : await cloudinary.unsignedUpload(
        file: data.path,
        fileBytes: fileBytes,
        resourceType: CloudinaryResourceType.image,
        folder: folder,
        progressCallback: data.progressCallback,
        uploadPreset: uploadPreset,
      );

      if (response.isSuccessful && response.secureUrl!.isNotEmpty) {
        setState(() {
          cloudinaryResponses = response;
        });
      } else {
        setState(() {
          errorMessage = response.error;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void onClick(int id) async {
    errorMessage = null;
    try {
      switch (id) {
        case loadImage:
          Utility.showImagePickerModal(
            context: context,
            onImageFromCamera: () async {
              onNewImages(await handleImagePickerResponse(
                  Utility.takePhoto(cameraDevice: CameraDevice.rear)));
              onClick(doUnsignedUpload);

            },
            onImageFromGallery: () async {
              onNewImages(await handleImagePickerResponse(
                  Utility.pickImageFromGallery()));
              onClick(doUnsignedUpload);

            },
          );
          break;
        case doSignedUpload:
          await doSingleUpload();
          break;
        case doUnsignedUpload:
          await doSingleUpload(signed: false);
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      loading = false;
      setState(() => errorMessage = e.toString());
    } finally {
      if (loading) hideLoading();
    }
  }

  void showLoading() => setState(() => loading = true);

  void hideLoading() => setState(() => loading = false);

  Future<List<String>> handleImagePickerResponse(Future getImageCall) async {
    Map<String, dynamic> resource =
    await (getImageCall as FutureOr<Map<String, dynamic>>);
    if (resource.isEmpty) return [];
    switch (resource['status']) {
      case 'SUCCESS':
        Navigator.pop(context);
        return resource['data'];
      default:
        Utility.showPermissionExplanation(
            context: context, message: resource['message']);
        break;
    }
    return [];
  }
}