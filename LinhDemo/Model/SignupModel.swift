
import Foundation

class SignupModel : Codable {
    let success : Bool?
    let message : String?
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
    }
}
