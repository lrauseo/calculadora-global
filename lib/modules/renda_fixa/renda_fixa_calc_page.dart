import 'package:calculadora_global/modules/renda_fixa/renda_fixa_calc_controller.dart';
import 'package:calculadora_global/shared/widget/form_text_field_standard.dart';
import 'package:calculadora_global/shared/widget/principal_button_standard.dart';
import 'package:calculadora_global/shared/widget/text_formatters/cep_formatter.dart';
import 'package:calculadora_global/shared/widget/text_formatters/currency_formatter.dart';
import 'package:calculadora_global/shared/widget/text_formatters/percent_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:intl/intl.dart';

class RendaFixaCalcPage extends StatelessWidget {
  const RendaFixaCalcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RendaFixaCalcController _controller = Get.find();
    return Scaffold(
        appBar: AppBar(
            title: const TextRenderer(
          child: Text("Calculadora Renda Fixa"),
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  child: Table(
                //defaultColumnWidth: const FixedColumnWidth(150),
                children: [
                  TableRow(
                    children: [
                      FormTextFieldStandard(
                        readOnly: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        decoration: const InputDecoration(
                            hintText: "Data do Investimento", icon: Icon(Icons.calendar_today)),
                        textInputAction: TextInputAction.next,
                        controller: _controller.dataInvestimentoController,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe a identificação do bloco";
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:
                                  DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('dd/MM/yyyy').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            // setState(() {
                            _controller.dataInvestimentoController.text =
                                formattedDate; //set foratted date to TextField value.
                            _controller.dataInvestimentoEnvioJson =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            // });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      FormTextFieldStandard(
                        readOnly: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        decoration: const InputDecoration(
                            hintText: "Vencimento do Investimento", icon: Icon(Icons.calendar_today)),
                        textInputAction: TextInputAction.next,
                        controller: _controller.dataVencimentoController,
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe a identificação do bloco";
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:
                                  DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('dd/MM/yyyy').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            // setState(() {
                            _controller.dataVencimentoController.text =
                                formattedDate; //set foratted date to TextField value.
                            _controller.dataVencimentoEnvioJson = DateFormat('yyyy-MM-dd').format(pickedDate);
                            // });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      FormTextFieldStandard(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                        decoration: const InputDecoration(
                            hintText: "Valor Inicial", icon: Icon(Icons.monetization_on)),
                        textInputAction: TextInputAction.next,
                        controller: _controller.valorInicialController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe a identificação do bloco";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  TableRow(children: [
                    FormTextFieldStandard(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      decoration:
                          const InputDecoration(hintText: "Aporte Mensal", icon: Icon(Icons.monetization_on)),
                      textInputAction: TextInputAction.next,
                      controller: _controller.aporteMensalController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a identificação do bloco";
                        }
                        return null;
                      },
                    ),
                    FormTextFieldStandard(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      decoration: const InputDecoration(hintText: "Taxa Anual", icon: Icon(Icons.percent)),
                      textInputAction: TextInputAction.next,
                      controller: _controller.taxaAnualController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a identificação do bloco";
                        }
                        return null;
                      },
                    ),
                    Container(),
                  ])
                ],
              )),
              PrincipalButtonStandard(
                onPressed: () {
                  _controller.calcularRendaFixa();
                },
                child: Text("Calcular"),
              ),
              Container(
                color: Colors.amber[50],
                child: Row(
                  children: [
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Dias de Investimento: ${_controller.responseRendaFixa.value.diasInvestimento ?? ''}"),
                        )),
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Patrimônio Bruto: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.valorTotalPatrimonioBruto ?? 0)}"),
                            ),
                          ),
                        )),
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Patrimônio Líquido: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.valorTotalPatrimonioLiquido ?? 0)}"),
                        )),
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Lucro Total: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.valorTotalLucro ?? 0)}"),
                        )),
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Aporte Total: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.valorTotalAporte ?? 0)}"),
                        )),
                  ],
                ),
              ),
              Obx(() => SizedBox(
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      crossAxisCount: 2,
                      semanticChildCount: 2,
                      mainAxisSpacing: 1,
                      childAspectRatio: 10,
                      children: List.generate(_controller.responseRendaFixa.value.investimentos?.length ?? 0,
                          (index) {
                        printInfo(info: index.toString());
                        return Container(
                          color: Colors.green[100],
                          child: Card(
                            child: ListTile(
                              isThreeLine: false,
                              title: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
                                    child: Text(
                                        '${_controller.responseRendaFixa.value.investimentos?[index].mes.toString() ?? ''}/${_controller.responseRendaFixa.value.investimentos?[index].ano.toString() ?? ''}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
                                    child: Text(
                                        ' | Taxa Anual: ${NumberFormat.percentPattern().format(_controller.responseRendaFixa.value.investimentos?[index].percentualAno ?? 0)} a.a'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
                                    child: Text(
                                        ' | Patrimônio: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.investimentos?[index].valorPatrimonio ?? 0)}'),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
                                    child: Text(
                                        ' - Aporte: ${NumberFormat.simpleCurrency(locale: 'pt-br').format(_controller.responseRendaFixa.value.investimentos?[index].valorAporte ?? 0)}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )),
            ],
          ),
        ));
  }
}
