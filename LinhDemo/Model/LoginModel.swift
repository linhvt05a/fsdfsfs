
import Foundation

class LoginModel : Codable {
    let success : Bool?
    let message : String?
    let userDetail: [UserList]?
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
        case userDetail = "userDetail"
    }
}

class UserList: Codable {
    let id : Int?
    let user_id : Int?
    let user_name: String?
    let email: String?
    let avatar :String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case user_id = "user_id"
        case user_name = "user_name"
        case email = "email"
        case avatar = "avatar"
    }
}
