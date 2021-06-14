import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var shares = 0
        var wallet = 0
        
        enum TradeState {
            case purchase
            case sale
        }
        
        func trade (state: TradeState, price: Int) {
            switch state {
            case .purchase:
                shares += 1
                wallet -= price
            case .sale:
                wallet += shares * price
                shares = 0
            }
        }
 
        for (day,price) in prices.enumerated() {
            
            if day == prices.count-1 {
                if(shares == 0) {continue}
                else{
                    trade(state: TradeState.sale, price: price)
                }
                continue
            }
            
            
            if price > prices[day+1...prices.count-1].max() ?? 0{
                if(shares > 0) {
                    trade(state: TradeState.sale, price: price)
                }
            }else{
                trade(state: TradeState.purchase, price: price)
            }
        }
        
        return wallet
    }
}
    
