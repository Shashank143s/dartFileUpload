import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:dropzone_angular_dart/dropzone_angular_dart.dart';


@Component(
  selector: 'app-file-upload',
  styleUrls: const ['file_upload_component.css'],
  templateUrl: 'file_upload_component.html',
  directives: const [DROPZONE_DIRECTIVES, COMMON_DIRECTIVES],
  pipes : const [COMMON_PIPES],
  providers: const [materialProviders]
)

class FileUploadComponent{
  DropzoneConfiguration dropzoneConfiguration = new DropzoneConfiguration(
      url: 'http://localhost:6969/upload' , method: 'POST' ,  addRemoveLinks: true, maxFiles: 1);
  Dropzone dropzone;
  Blob uploadedFile = null;
  String uploadResponse = null;
  NgZone zone;

  FileUploadComponent(this.zone);

  void initDropzone(Dropzone dropzone) {
    this.dropzone = dropzone;
    this.dropzone.on("success", success);
  }

  void success(Blob file, String response, Event event) {
    print('success(' + file.toString() + ", " + response + ", " +
        event.toString() + ")");
    zone.run(() {
      uploadedFile = file;
      uploadResponse = response;
    });
  }
}
