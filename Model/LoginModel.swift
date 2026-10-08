import SwiftUI

@Observable
final class LoginViewModel {

    var email = ""
    var password = ""

    var emailError: String? {
        ValidationService.validateEmail(email)
    }

    var passwordError: String? {
        ValidationService.validatePassword(password)
    }

    var isFormValid: Bool {
        !email.isEmpty &&
        !password.isEmpty &&
        emailError == nil &&
        passwordError == nil
    }
}
struct ValidationService {

    static func validateEmail(_ email: String) -> String? {
        let regex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#

        if email.isEmpty {
            return nil
        }

        if email.range(of: regex, options: .regularExpression) == nil {
            return "Please enter a valid email address"
        }

        return nil
    }

    static func validatePassword(_ password: String) -> String? {
        if password.isEmpty {
            return nil
        }

        if password.count < 8 {
            return "Password must be at least 8 characters"
        }

        return nil
    }
}
