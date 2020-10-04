import Foundation
import FoundationNetworking

struct TaylorQuote: Codable {
    var quote: String
}

// turn request into synchronous
func sendRequest() -> Data? {
  let session = URLSession.shared
  var dataReceived: Data?
  let sem = DispatchSemaphore.init(value: 0)

  let request = URLRequest(url: URL(string: "https://api.taylor.rest/")!)
    let task = session.dataTask(with: request) { data, response, error in
        defer { sem.signal() }
        if let error = error {
            print("Error -> \(error)")
            return
        }
        dataReceived = data
    }

  task.resume()
  sem.wait()

  return dataReceived
}

// cerner_2^5_2020
let taylorQuote = try JSONDecoder().decode(TaylorQuote.self, from: sendRequest()!)
print(taylorQuote.quote)