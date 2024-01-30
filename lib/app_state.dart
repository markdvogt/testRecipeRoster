import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _cart =
          prefs.getStringList('ff_cart')?.map((path) => path.ref).toList() ??
              _cart;
    });
    _safeInit(() {
      _cartPriceSummary = prefs
              .getStringList('ff_cartPriceSummary')
              ?.map(double.parse)
              .toList() ??
          _cartPriceSummary;
    });
    _safeInit(() {
      _cartItems = prefs
              .getStringList('ff_cartItems')
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cartItems;
    });
    _safeInit(() {
      _shippingOptions = prefs
              .getStringList('ff_shippingOptions')
              ?.map((x) {
                try {
                  return ShippingOptionsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _shippingOptions;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference value) {
    _cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    _cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    _cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    _cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  List<double> _cartPriceSummary = [];
  List<double> get cartPriceSummary => _cartPriceSummary;
  set cartPriceSummary(List<double> value) {
    _cartPriceSummary = value;
    prefs.setStringList(
        'ff_cartPriceSummary', value.map((x) => x.toString()).toList());
  }

  void addToCartPriceSummary(double value) {
    _cartPriceSummary.add(value);
    prefs.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void removeFromCartPriceSummary(double value) {
    _cartPriceSummary.remove(value);
    prefs.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCartPriceSummary(int index) {
    _cartPriceSummary.removeAt(index);
    prefs.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void updateCartPriceSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _cartPriceSummary[index] = updateFn(_cartPriceSummary[index]);
    prefs.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCartPriceSummary(int index, double value) {
    _cartPriceSummary.insert(index, value);
    prefs.setStringList('ff_cartPriceSummary',
        _cartPriceSummary.map((x) => x.toString()).toList());
  }

  List<CartItemStruct> _cartItems = [];
  List<CartItemStruct> get cartItems => _cartItems;
  set cartItems(List<CartItemStruct> value) {
    _cartItems = value;
    prefs.setStringList(
        'ff_cartItems', value.map((x) => x.serialize()).toList());
  }

  void addToCartItems(CartItemStruct value) {
    _cartItems.add(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeFromCartItems(CartItemStruct value) {
    _cartItems.remove(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartItems(int index) {
    _cartItems.removeAt(index);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void updateCartItemsAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    _cartItems[index] = updateFn(_cartItems[index]);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartItems(int index, CartItemStruct value) {
    _cartItems.insert(index, value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  List<ShippingOptionsStruct> _shippingOptions = [
    ShippingOptionsStruct.fromSerializableMap(jsonDecode(
        '{"shippingName":"Express Delivery","description":"Get your shipment in 2-3 business days","price":"25"}')),
    ShippingOptionsStruct.fromSerializableMap(jsonDecode(
        '{"shippingName":"Standard Delivery","description":"Get your shipment in 5-7 business days","price":"10"}')),
    ShippingOptionsStruct.fromSerializableMap(jsonDecode(
        '{"shippingName":"Free Delivery","description":"Get your no rush option for recieving your package in 10-15 business days.","price":"0"}'))
  ];
  List<ShippingOptionsStruct> get shippingOptions => _shippingOptions;
  set shippingOptions(List<ShippingOptionsStruct> value) {
    _shippingOptions = value;
    prefs.setStringList(
        'ff_shippingOptions', value.map((x) => x.serialize()).toList());
  }

  void addToShippingOptions(ShippingOptionsStruct value) {
    _shippingOptions.add(value);
    prefs.setStringList('ff_shippingOptions',
        _shippingOptions.map((x) => x.serialize()).toList());
  }

  void removeFromShippingOptions(ShippingOptionsStruct value) {
    _shippingOptions.remove(value);
    prefs.setStringList('ff_shippingOptions',
        _shippingOptions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromShippingOptions(int index) {
    _shippingOptions.removeAt(index);
    prefs.setStringList('ff_shippingOptions',
        _shippingOptions.map((x) => x.serialize()).toList());
  }

  void updateShippingOptionsAtIndex(
    int index,
    ShippingOptionsStruct Function(ShippingOptionsStruct) updateFn,
  ) {
    _shippingOptions[index] = updateFn(_shippingOptions[index]);
    prefs.setStringList('ff_shippingOptions',
        _shippingOptions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInShippingOptions(
      int index, ShippingOptionsStruct value) {
    _shippingOptions.insert(index, value);
    prefs.setStringList('ff_shippingOptions',
        _shippingOptions.map((x) => x.serialize()).toList());
  }

  final _productListManager = StreamRequestManager<List<ProductsRecord>>();
  Stream<List<ProductsRecord>> productList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProductsRecord>> Function() requestFn,
  }) =>
      _productListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductListCache() => _productListManager.clear();
  void clearProductListCacheKey(String? uniqueKey) =>
      _productListManager.clearRequest(uniqueKey);

  final _transactionsManager = StreamRequestManager<List<TransactionsRecord>>();
  Stream<List<TransactionsRecord>> transactions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TransactionsRecord>> Function() requestFn,
  }) =>
      _transactionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTransactionsCache() => _transactionsManager.clear();
  void clearTransactionsCacheKey(String? uniqueKey) =>
      _transactionsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
