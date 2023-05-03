import Foundation
import UIKit

struct Profile {
    let name: String
    let surname: String
    let job: String
    let description: String
    let image: UIImage?
    
    var fullname: String {
        self.name + " " + self.surname
    }   
}
