import Foundation

struct PublicDesignatedInitForOpenClassRule: Rule {
    var name = "PublicDesignatedInitForOpenClass"

    var explanation = "An open class has to have at least one designated initializer that is public or open IF the class as convenience initializers"

    func isRelevant(for structure: SyntaxStructure) -> Bool {
        structure.isClassOrStruct && structure.isOpen
    }

    func showsViolation(for structure: SyntaxStructure) -> Bool {
        guard structure.hasConvenienceInitializers == true else {
            return false
        }

        var missingDesignatedInitializer = true // assuming there is a violation

        for item in structure.substructure ?? [] {
            if item.isDesignatedInitializer == true, item.isOpenOrPublic == true {
                missingDesignatedInitializer = false
            }
        }

        return missingDesignatedInitializer
    }
}
