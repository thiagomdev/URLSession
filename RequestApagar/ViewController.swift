//
//  ViewController.swift
//  RequestApagar
//
//  Created by Thiago do Nascimento Monteiro on 10/11/21.
//

import UIKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func goToGet(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    @IBAction func goToPost(_ sender: Any) {
        let parameters = ["userName" : "@thiago", "tweet" : "HelloWorld"]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}

