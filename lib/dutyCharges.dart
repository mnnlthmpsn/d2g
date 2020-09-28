import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'api.dart';
import 'custom_widget.dart';

class duty_charges extends StatefulWidget {
  final String temp;
  duty_charges(this.temp);

  @override
  DutyCharges createState() => DutyCharges(temp);
}

class DutyCharges extends State<duty_charges> {
  var temp;

  DutyCharges(this.temp);
  String formatted_msrp;
  String formatted_depreciated;
  String formatted_govt;
  String formatted_freight;
  String formatted_insurance;
  String formatted_cif;
  String formatted_duty;
  String formatted_vat;
  String formatted_nhil;
  String formatted_ecowas;
  String formatted_exim;
  String formatted_irs;
  String formatted_exam;
  String formatted_overage;
  String formatted_interest;
  String formatted_get_fund;
  String formatted_gcnet;
  String formatted_gcnet_vat;
  String formatted_special;
  String formatted_african;
  String formatted_other;
  String formatted_total;

  double cedi_duty;
  double cedi_vat;
  double cedi_nhil;
  double cedi_ecowas;
  double cedi_exim;
  double cedi_irs;
  double cedi_exam;
  double cedi_overage;
  double cedi_interest;
  double cedi_getfund;
  double cedi_gcnet;
  double cedi_gcnet_vat;
  double cedi_special;
  double cedi_african;
  double cedi_other;
  double cedi_total;
  double rate = 0.00;

  @override
  Widget build(BuildContext context) {

    print(temp);
    List temp_final = json.decode(temp);
    var vehicle_details = temp_final.elementAt(0);
    var duty_details = temp_final.elementAt(1);
    print(vehicle_details);
    print(duty_details);

    var block1 = duty_details['block_1'];
    var block2 = duty_details['block_2'];

    var temp1 = json.decode(temp);
    String vin = vehicle_details["vin"];
    String year = vehicle_details["year1"];
    String displacement = vehicle_details["cc"];
    String msrp = vehicle_details["msrp"];
    String fuel_type = vehicle_details["f_type"];
    String body_type = vehicle_details["v_type"];
    String total = duty_details["total"].toString();

    String vehicle_age = (duty_details["vehicle_age"] / 12).toStringAsFixed(1);
    String Depreciated = block1["Depreciated Value"].toString();
    String govt_sub = block1["Less 30% Govt Disc"].toString();
    String Freight = block1["Freight"].toString();
    String Insurance = block1["Insurance"].toString();
    String CIF = block1["CIF"].toString();

    String import_duty = block2["Import Duty"].toString();
    String import_vat = block2["Import VAT"].toString();
    String nhil = block2["NHIL"].toString();
    String ecowas = block2["Ecowas Levy"].toString();
    String Exim = block2["Exim"].toString();
    String IRS = block2["*IRS"].toString();
    String exam = block2["Vehicle Exam"].toString();
    String overage = block2["Over-Age Penalty"].toString();
    String interest = block2["Interest"].toString();
    String get_fund = block2["GET Fund Levy"].toString();
    String gcnet = block2["GCNet Charge"].toString();
    String gcnet_vat = block2["VAT\u0026NHIL on Netw."].toString();
    String special_import_levy = block2["Special Import Levy"].toString();
    String african_union = block2["African Union Import Levy"].toString();
    String other_charges = block2["Other Charges"].toString();


    if(rate == 0) {
      formatted_msrp =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(msrp));
      formatted_depreciated =
          NumberFormat.currency(name: "\$ ").format(
              double.tryParse(Depreciated));
      formatted_govt =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(govt_sub));
      formatted_freight =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(Freight));
      formatted_insurance =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(Insurance));
      formatted_cif =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(CIF));
      formatted_duty =
          NumberFormat.currency(name: "\$ ").format(
              double.tryParse(import_duty));
      formatted_vat =
          NumberFormat.currency(name: "\$ ").format(
              double.tryParse(import_vat));
      formatted_nhil =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(nhil));
      formatted_ecowas =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(ecowas));
      formatted_exim =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(Exim));
      formatted_irs =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(IRS));
      formatted_exam =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(exam));
      formatted_overage =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(overage));
      formatted_interest =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(interest));
      formatted_get_fund =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(get_fund));
      formatted_gcnet =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(gcnet));
      formatted_gcnet_vat =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(gcnet_vat));
      formatted_special = NumberFormat.currency(name: "\$ ")
          .format(double.tryParse(special_import_levy));
      formatted_african = NumberFormat.currency(name: "\$ ")
          .format(double.tryParse(african_union));
      formatted_other = NumberFormat.currency(name: "\$ ")
          .format(double.tryParse(other_charges));
      formatted_total =
          NumberFormat.currency(name: "\$ ").format(double.tryParse(total));
    }else{

      cedi_duty = rate * (double.tryParse(import_duty));
      cedi_vat = rate * (double.tryParse(import_vat));
      cedi_nhil = rate * (double.tryParse(nhil));
      cedi_ecowas = rate * (double.tryParse(ecowas));
      cedi_exim = rate * (double.tryParse(Exim));
      cedi_irs = rate * (double.tryParse(IRS));
      cedi_exam = rate * (double.tryParse(exam));
      cedi_overage = rate * (double.tryParse(overage));
      cedi_interest = rate * (double.tryParse(interest));
      cedi_getfund = rate * (double.tryParse(get_fund));
      cedi_gcnet = rate * (double.tryParse(gcnet));
      cedi_gcnet_vat = rate * (double.tryParse(gcnet_vat));
      cedi_special =
          rate * (double.tryParse(special_import_levy));
      cedi_african = rate * (double.tryParse(african_union));
      cedi_other = rate * (double.tryParse(other_charges));
      cedi_total = rate * (double.tryParse(total));

      setState(() {

      formatted_duty =
          NumberFormat.currency(name: "¢ ").format(cedi_duty);
      formatted_vat =
          NumberFormat.currency(name: "¢ ").format(cedi_vat);
      formatted_nhil =
          NumberFormat.currency(name: "¢ ").format(cedi_nhil);
      formatted_ecowas =
          NumberFormat.currency(name: "¢ ").format(cedi_ecowas);
      formatted_exim =
          NumberFormat.currency(name: "¢ ").format(cedi_exim);
      formatted_irs =
          NumberFormat.currency(name: "¢ ").format(cedi_irs);
      formatted_exam =
          NumberFormat.currency(name: "¢ ").format(cedi_exam);
      formatted_overage =
          NumberFormat.currency(name: "¢ ").format(cedi_overage);
      formatted_interest =
          NumberFormat.currency(name: "¢ ").format(cedi_interest);
      formatted_get_fund =
          NumberFormat.currency(name: "¢ ").format(cedi_getfund);
      formatted_gcnet =
          NumberFormat.currency(name: "¢ ").format(cedi_gcnet);
      formatted_gcnet_vat =
          NumberFormat.currency(name: "¢ ").format(cedi_gcnet_vat);
      formatted_special =
          NumberFormat.currency(name: "¢ ").format(cedi_special);
      formatted_african =
          NumberFormat.currency(name: "¢ ").format(cedi_african);
      formatted_other =
          NumberFormat.currency(name: "¢ ").format(cedi_other);
      formatted_total =
          NumberFormat.currency(name: "¢ ").format(cedi_total);

      });

      print('8888888888888888888888888888888888888888888888');
      print(formatted_total);

    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        centerTitle: true,
        title: Text(
          'Duty Charges',
          style: TextStyle(fontFamily: 'Nexa', fontSize: 16),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 1)),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      'Logo Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nexa',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'VIN',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(
                  'Date',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  vin,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  getdate().toString(),
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Year of Manf.',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(
                  'Fuel Type',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  year,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  fuel_type,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Engine Displacement',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(
                  'Vehicle Age',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  displacement,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  vehicle_age + " year(s)",
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MSRP',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(
                  'Vehicle Type',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  formatted_msrp,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                Text(
                  body_type,
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MSRP',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_msrp,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Depreciated Value',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_depreciated,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Less 30% Govt Disc',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_govt,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Freight',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_freight,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Insurance',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_insurance,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'CIF',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_cif,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Import Duty',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_duty,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Import Vat',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_vat,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'NHIL',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_nhil,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Ecowas Levy',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_ecowas,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Exim',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_exim,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '*IRS',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_irs,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Vehicle Exam',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_exam,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Over-Age Penalty',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_overage,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Interest',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_interest,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'GET Fund Levy',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_get_fund,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'GCNet Charge',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_gcnet,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'VAT&NHIL on Netw.',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_gcnet_vat,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Special Import Levy',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_special,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'African Union Import Levy',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_african,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Other Charges',
                  style: TextStyle(fontFamily: 'Nexa', fontSize: 12),
                ),
                Text(formatted_other,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Payable',
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(formatted_total,
                    style: TextStyle(
                        fontFamily: 'Nexa',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'No Interest, Demorage, Shipping Line or Terminal Handling Chareges are represented in the Total. The values presented here are an Estimation of Taxes Payable in accordance to HS-CET(ACT 905, 2015). *Importers with valid Tax Clearance Certificates will be exempted from the IRS Tax Deposit of 1% of CIF',
                          style: TextStyle(fontFamily: 'Nexa', fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Current Exchange Rate is ' + rate.toString(),
                          style: TextStyle(fontFamily: 'Nexa', fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
            child: CustomButton2(
              onBtnPressed: () async {
               var result_rate = await getRate();
               setState(() {
                  rate = result_rate;
               });

              },
              btnText: "GH Cedis",
            ),
          ),
        ],
      ),
    );
  }

}
