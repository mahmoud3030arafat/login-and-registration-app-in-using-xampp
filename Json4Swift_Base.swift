

import Foundation
struct Json4Swift_Base : Codable {
	let server_response : [Server_response]?

	enum CodingKeys: String, CodingKey {

		case server_response = "server_response"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		server_response = try values.decodeIfPresent([Server_response].self, forKey: .server_response)
	}


}

struct Server_response : Codable {
    let code : String?
    let message : String?
    let email : String?
    let password : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case message = "message"
        case email = "email"
        case password = "password"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
    }

}

