

import UIKit

class Constant {
    let regexEmail: String =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let regxPass: String =  "(?:(?:(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_])|(?:(?=.*?[0-9])|(?=.*?[A-Z])|(?=.*?[-!@#$%&*ˆ+=_])))|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-!@#$%&*ˆ+=_]))[A-Za-z0-9-!@#$%&*ˆ+=_]{6,15}"
    
    func validateEmail(username: String) -> Bool {
           guard let regex = try? NSRegularExpression(
                   pattern: regexEmail,
                   options: [.caseInsensitive]
               )
           else {
               assertionFailure("Regex not valid")
               return false
           }

           let regexFirstMatch = regex
               .firstMatch(
                   in: username,
                   options: [],
                   range: NSRange(location: 0, length: username.count)
               )

           return regexFirstMatch != nil


       }
    
    
        func validPassword(password : String) -> Bool
            {
            guard let regex = try? NSRegularExpression(
                    pattern: regxPass,
                    options: [.caseInsensitive]
                )
            else {
                assertionFailure("Regex not valid")
                return false
            }
    
            let regexFirstMatch = regex
                .firstMatch(
                    in: password,
                    options: [],
                    range: NSRange(location: 0, length: password.count)
                )
    
            return regexFirstMatch != nil

    }
}
   
    
    
    



