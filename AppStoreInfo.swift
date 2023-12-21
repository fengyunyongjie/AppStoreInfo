import Foundation

func getBundleID(appID: String, region: String = "us") {
    let apiURL = URL(string: "https://itunes.apple.com/\(region.lowercased())/lookup?id=\(appID)")!

    do {
        let apiData = try Data(contentsOf: apiURL)
        let jsonData = try JSONSerialization.jsonObject(with: apiData, options: []) as! [String: Any]
        
        if let results = jsonData["results"] as? [[String: Any]],
           let bundleID = results.first?["bundleId"] as? String {
            print("Bundle ID for App ID \(appID) in \(region.uppercased()): \(bundleID)")
        } else {
            print("Failed to retrieve Bundle ID for App ID \(appID) in \(region.uppercased())")
        }
    } catch {
        print("Error: \(error)")
    }
}

// 新增的帮助选项
func printUsage() {
    print("Usage:")
    print("To retrieve Bundle ID for a specific App ID in a region: \(CommandLine.arguments[0]) <App ID> [region]")
    print("Available regions: us (default), gb, ...") // 添加其他可用的地区
}

// Command Line Argument Handling
if CommandLine.arguments.count == 2 {
    let appID = CommandLine.arguments[1]
    getBundleID(appID: appID)
} else if CommandLine.arguments.count == 3 {
    let appID = CommandLine.arguments[1]
    let region = CommandLine.arguments[2]
    getBundleID(appID: appID, region: region)
} else {
    printUsage()
}
