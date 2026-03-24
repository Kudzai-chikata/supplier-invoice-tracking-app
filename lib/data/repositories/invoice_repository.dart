import 'package:flutter/material.dart';
import 'package:your_app/models/invoice.dart';
import 'package:your_app/data/local_data_source.dart';
import 'package:your_app/data/remote_data_source.dart';

class InvoiceRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  InvoiceRepository({required this.localDataSource, required this.remoteDataSource});

  Future<List<Invoice>> getReceivedInvoices() async {
    // First attempt to fetch invoices from the local database
    List<Invoice> invoices = await localDataSource.fetchInvoices();
    
    // Sync with remote data if there's an internet connection
    if (await remoteDataSource.isConnected()) {
      List<Invoice> remoteInvoices = await remoteDataSource.fetchInvoices();
      await localDataSource.cacheInvoices(remoteInvoices);
      invoices.addAll(remoteInvoices);
    }
    
    return invoices;
  }

  Future<void> addInvoice(Invoice invoice) async {
    await localDataSource.saveInvoice(invoice);
    if (await remoteDataSource.isConnected()) {
      await remoteDataSource.uploadInvoice(invoice);
    }
  }

  // More operations related to invoices can be added here...
}