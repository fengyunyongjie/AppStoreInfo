import Foundation

func getBundleID(appID: String) {
    let apiURL = URL(string: "https://itunes.apple.com/lookup?id=\(appID)")!

    do {
        let apiData = try Data(contentsOf: apiURL)
        let jsonData = try JSONSerialization.jsonObject(with: apiData, options: []) as! [String: Any]

        if let results = jsonData["results"] as? [[String: Any]],
           let bundleID = results.first?["bundleId"] as? String {
            print("Bundle ID for App ID \(appID): \(bundleID)")
        } else {
            print("Failed to retrieve Bundle ID for App ID \(appID)")
        }
    } catch {
        print("Error: \(error)")
    }
}

// Command Line Argument Handling
if CommandLine.arguments.count == 2 {
    let appID = CommandLine.arguments[1]
    getBundleID(appID: appID)
} else {
    print("Usage: \(CommandLine.arguments[0]) <App ID>")
}

