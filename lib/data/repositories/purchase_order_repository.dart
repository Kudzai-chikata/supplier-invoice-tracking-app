import 'package:flutter/foundation.dart';
import 'package:your_project_name/data/remote/purchase_order_remote_data_source.dart';
import 'package:your_project_name/data/local/purchase_order_local_data_source.dart';
import 'package:your_project_name/models/purchase_order.dart';

class PurchaseOrderRepository {
  final PurchaseOrderRemoteDataSource remoteDataSource;
  final PurchaseOrderLocalDataSource localDataSource;

  PurchaseOrderRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<PurchaseOrder> getPurchaseOrder(String id) async {
    try {
      // First try to fetch from the remote data source
      final remotePurchaseOrder = await remoteDataSource.getPurchaseOrder(id);
      // Optionally save to local cache
      await localDataSource.cachePurchaseOrder(remotePurchaseOrder);
      return remotePurchaseOrder;
    } catch (e) {
      // If remote fetch fails, try local data source
      return await localDataSource.getPurchaseOrder(id);
    }
  }

  Future<List<PurchaseOrder>> getAllPurchaseOrders() async {
    try {
      final remotePurchaseOrders = await remoteDataSource.getAllPurchaseOrders();
      // Optionally cache them locally
      await localDataSource.cachePurchaseOrders(remotePurchaseOrders);
      return remotePurchaseOrders;
    } catch (e) {
      // If remote fetch fails, fallback to local data source
      return await localDataSource.getAllPurchaseOrders();
    }
  }

  Future<void> createPurchaseOrder(PurchaseOrder purchaseOrder) async {
    // First, try to create it on the remote data source
    await remoteDataSource.createPurchaseOrder(purchaseOrder);
    // Optionally add it to the local data source
    await localDataSource.cachePurchaseOrder(purchaseOrder);
  }

  Future<void> updatePurchaseOrder(PurchaseOrder purchaseOrder) async {
    await remoteDataSource.updatePurchaseOrder(purchaseOrder);
    // Optionally update the local cache
    await localDataSource.updatePurchaseOrder(purchaseOrder);
  }

  Future<void> deletePurchaseOrder(String id) async {
    await remoteDataSource.deletePurchaseOrder(id);
    // Optionally delete from local cache
    await localDataSource.deletePurchaseOrder(id);
  }
}
