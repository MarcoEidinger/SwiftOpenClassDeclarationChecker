import Foundation

protocol Rule {
    var name: String { get }
    var explanation: String { get }
    func isRelevant(for structure: SyntaxStructure) -> Bool
    func showsViolation(for structure: SyntaxStructure) -> Bool
}
