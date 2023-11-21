import Foundation

enum Region: String {
    case US = "us"
    case Canada = "ca"
    case Mexico = "mx"
    case UK = "gb"
    case Germany = "de"
    case France = "fr"
    case Italy = "it"
    case Spain = "es"
    case Netherlands = "nl"
    case Sweden = "se"
    case Norway = "no"
    case Denmark = "dk"
    case Finland = "fi"
    case Switzerland = "ch"
    case Austria = "at"
    case Australia = "au"
    case NewZealand = "nz"
    case Japan = "jp"
    case China = "cn"
    case HongKong = "hk"
    case Singapore = "sg"
    case SouthKorea = "kr"
    case Brazil = "br"
    case Russia = "ru"
    case India = "in"
    case SouthAfrica = "za"
    case SaudiArabia = "sa"
    case UAE = "ae"
    // 其他国家/地区可以继续添加
}


func getBundleID(appID: String, region: Region = .US) {
    let apiURL = URL(string: "https://itunes.apple.com/\(region.rawValue)/lookup?id=\(appID)")!

    do {
        let apiData = try Data(contentsOf: apiURL)
        let jsonData = try JSONSerialization.jsonObject(with: apiData, options: []) as! [String: Any]

        if let results = jsonData["results"] as? [[String: Any]],
           let bundleID = results.first?["bundleId"] as? String {
            print("Bundle ID for App ID \(appID) in \(region.rawValue.uppercased()): \(bundleID)")
        } else {
            print("Failed to retrieve Bundle ID for App ID \(appID) in \(region.rawValue.uppercased())")
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
    if let region = Region(rawValue: CommandLine.arguments[2]) {
        getBundleID(appID: appID, region: region)
    } else {
        printUsage()
    }
} else {
    printUsage()
}

