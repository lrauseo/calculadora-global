import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextRenderer(style: TextRendererStyle.header1, child: Text("Calculadoras")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextRenderer(
                style: TextRendererStyle.header2,
                child: Text(
                  'Seleciona a calculadora desejada',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => Get.toNamed("/renda_fixa"),
              child: const TextRenderer(
                child: Text('Investimento Renda Fixa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
