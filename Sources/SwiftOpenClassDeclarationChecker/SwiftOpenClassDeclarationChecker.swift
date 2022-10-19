import Foundation
import SourceKittenFramework

@main
public enum SwiftOpenClassDeclarationChecker {
    public static func main() {
        let directory = FileManager.default.currentDirectoryPath

        let files = FileCollector().getFiles(for: ["."], in: directory)

        for fileOnDisk in files {
            let file = File(path: fileOnDisk.path)!
            let structure = try! Structure(file: file) // swiftlint:disable:this force_try
            let jsonData = structure.description.data(using: .utf8)!
            let info = try! JSONDecoder().decode(SyntaxStructure.self, from: jsonData) // swiftlint:disable:this force_try

            let rules: [Rule] = [PublicDesignatedInitForOpenClassRule()]

            let subs = info.substructure ?? []
            for check in subs {
                for rule in rules {
                    // print("\(rule.name): Processing \(check.safeName)")
                    if rule.isRelevant(for: check) {
                        // print("\(rule.name): Checking \(check.safeName)")
                        if rule.showsViolation(for: check) {
                            print("\(rule.name): Issue detected in \(check.safeName)")
                        }
                    }
                }
            }
        }
    }
}
