class WalletInfo {
  final double balance;   // رصيد بدقة عشرية
  final String currency;

  WalletInfo({required this.balance, required this.currency});

  factory WalletInfo.fromMap(Map<String, dynamic> map) {
    final balStr = (map['balance'] ?? '0').toString();
    final bal = double.tryParse(balStr) ?? 0.0;
    final curr = (map['currency'] ?? '').toString();
    return WalletInfo(balance: bal, currency: curr);
  }
}
