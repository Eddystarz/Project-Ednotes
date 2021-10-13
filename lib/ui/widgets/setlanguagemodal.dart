
import 'package:edtech/ui/screens/courses/ttsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetLanguageDialog extends StatefulWidget {
  @override
  _SetLanguageDialogState createState() => _SetLanguageDialogState();
}

class _SetLanguageDialogState extends State<SetLanguageDialog> {
  Widget _buildSliders() {
    return Column(
      children: [_volume(), _pitch(), _rate()],
    );
  }

  Widget _volume() {
    return Slider(
        value: Provider.of<TTSProvider>(context, listen: true).volume!,
        onChanged: (newVolume) {
          Provider.of<TTSProvider>(context, listen: false).setVolume(newVolume);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        activeColor: Colors.blue,
        label: "Volume: ${Provider.of<TTSProvider>(context, listen: true).volume!}");
  }

  Widget _pitch() {
    return Slider(
      value: Provider.of<TTSProvider>(context, listen: true).pitch!,
      onChanged: (newPitch) {
        Provider.of<TTSProvider>(context, listen: false).setPitch(newPitch);
      },
      min: 0.5,
      max: 2.0,
      divisions: 15,
      label: "Pitch: ${Provider.of<TTSProvider>(context, listen: true).pitch!}",
        activeColor: Colors.blue,
    );
  }

  Widget _rate() {
    return Slider(
      value: Provider.of<TTSProvider>(context, listen: true).rate!,
      onChanged: (newRate) {
        Provider.of<TTSProvider>(context, listen: false).setRate(newRate);
      },
      min: 0.0,
      max: 1.0,
      divisions: 10,
      label: "Rate: ${Provider.of<TTSProvider>(context, listen: true).rate!}",
      activeColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //height: 500,
        child: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close, color: Colors.black,),
                    )
                  ],
                ),
              ),

              _buildSliders(),

              Column(
                children: List.generate(Provider.of<TTSProvider>(context, listen: true).languages.length, (index) =>
                    ListTile(
                      onTap: (){
                        String lang = Provider.of<TTSProvider>(context, listen: false).resolveLanguageToAbbr(
                            Provider.of<TTSProvider>(context, listen: false).languages[index]
                        );
                        Provider.of<TTSProvider>(context, listen: false).setSelectedLanguage(lang);
                        Navigator.of(context).pop();
                      },
                      title: Text(Provider.of<TTSProvider>(context, listen: false).resolveLanguageToFull(Provider.of<TTSProvider>(context, listen: true).languages[index]),
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
