
import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var counts = [String]()
        
        var tempCount = ""
        
        var repeatString = [String]()
        
        var result = ""
        
        for char in message {
            if char.isNumber {
                tempCount = "\(tempCount)\(char)"
            } else if char == "[" {
                
                if tempCount == "" {
                    counts.append("1")
                } else {
                    
                    counts.append(tempCount)
                }
                tempCount = ""
                repeatString.append(result)
                result = ""
                
            } else if char == "]" {
                var tempString = ""
                if let counts = Int(counts.popLast() ?? "1") {
                    for _ in 0..<counts {
                        tempString += result
                    }
                }
                
                result = repeatString.popLast()! + tempString
            } else if char.isLetter {
                result += String(char)
            }
        }
        
        return result
    }
}
