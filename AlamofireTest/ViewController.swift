//
//  ViewController.swift
//  AlamofireTest
//
//  Created by quan bui on 2021/05/01.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://httpbin.org/get"
        let parameters = ["category": "Movies", "genre": "Action"]

        //getSample(url: url)
        getWithParams(url: url, params: parameters)
    }

    func getSample(url: String) {
        AF.request(url).response { response in
            debugPrint(response)
        }
    }

    func getWithParams(url: String, params: Dictionary<String, Any>) {
        AF.request(url, parameters: params).response { response in
            debugPrint(response)
        }
    }

    func anotherMethod() {
//        let url = "https://httpbin.org/"
//        AF.request(url + "post", method: .post) // post
//        AF.request(url + "put", method: .put) // put
//        AF.request(url + "delete", method: .delete) // delete
    }

    func requetWithHeader(url: String, params: Dictionary<String, Any>) {
        let headers: HTTPHeaders = [
            .authorization(username: "test", password: "test"),
            .accept("application/json")
        ]
        AF.request(url, parameters: params, headers: headers).responseJSON { (response) in
            debugPrint(response)
        }
    }
    
    func requestAuthen() {
        let credential = URLCredential(user: "test", password: "test", persistence: .forSession)
        AF.request("url")
            .authenticate(with: credential)
            .responseJSON { (response) in
                debugPrint(response)
            }
    }
}
