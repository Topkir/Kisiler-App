import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/ui/cubit/detay_sayfa_cubit.dart';
import '../../data/entity/kisiler.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;

  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisi_ad;
    tfKisiTel.text = kisi.kisi_tel;

    /// initState kayıt sayfasındaki bilgileri detay sayfası açıldığında bize gösterecek.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //sayfanın yukarı taşmasını engeller.
      appBar: AppBar(
        title: const Text('Detay Sayfa'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(hintText: 'Kişi Ad'),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: 'Kişi Tel'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<DetaySayfaCubit>().guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTel.text);
                },
                child: Text('Güncelle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
