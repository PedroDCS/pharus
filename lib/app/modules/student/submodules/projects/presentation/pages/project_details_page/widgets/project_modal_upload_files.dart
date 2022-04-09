import 'package:flutter/material.dart';

class ModalUploadFiles extends StatelessWidget {
  const ModalUploadFiles(
      {required this.uploadFiles,
      required this.imageName,
      required this.getFile,
      required this.isFile,
      required this.clearData,
      Key? key})
      : super(key: key);
  final Function() getFile;
  final ValueNotifier<bool> isFile;
  final ValueNotifier<String> imageName;
  final Function() clearData;
  final Function() uploadFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 32, 25, 5),
      decoration: BoxDecoration(
        color: const Color(0xFFE1E1E1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          const Text(
            'Enviar arquivos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 24),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla bibendum elit tellus, at condimentum mauris sagittis ut. Nam auctor nunc non ipsum blandit tempus.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          GestureDetector(
            onTap: getFile,
            child: Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: const Color(0xFFC3C3C3),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Image.asset('assets/images/upload.png'),
                    const Text(
                      'Selecione os arquivos para enviar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ValueListenableBuilder(
            valueListenable: isFile,
            builder: (_, bool isFile, __) {
              return Visibility(
                visible: isFile,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/book.png',
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                              width: 220,
                              child: ValueListenableBuilder(
                                valueListenable: imageName,
                                builder: (_, String name, __) {
                                  return Text(
                                    name,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                              ))
                        ],
                      ),
                      IconButton(
                        onPressed: clearData,
                        icon: const Icon(Icons.clear),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: uploadFiles,
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFC3C3C3),
                padding:
                    const EdgeInsets.symmetric(horizontal: 27.5, vertical: 11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              child: const Text(
                "Enviar Arquivos",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
