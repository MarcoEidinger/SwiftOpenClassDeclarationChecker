import Foundation

extension SyntaxStructure {
    var isClassOrStruct: Bool {
        return kind == .class || kind == .struct
    }

    var isOpen: Bool {
        return accessibility == .open
    }

    var isOpenOrPublic: Bool {
        return accessibility == .open || accessibility == .public
    }

    var isDesignatedInitializer: Bool {
        var isInitializer = false
        let name = self.name ?? ""

        guard !safeAttributes.contains(where: { element in
            element.attribute == "source.decl.attribute.convenience"
        }) else {
            return isInitializer
        }

        if name.contains("init") {
            if kind == .functionMethodInstance {
                isInitializer = true
            }
        }
        return isInitializer
    }

    var isConvenienceInitializer: Bool {
        if safeAttributes.contains(where: { element in
            element.attribute == "source.decl.attribute.convenience"
        }) {
            return true
        } else {
            return false
        }
    }

    var hasConvenienceInitializers: Bool {
        if isConvenienceInitializer {
            return true
        } else {
            for check in safeSubStructure {
                if check.isConvenienceInitializer {
                    return true
                }
            }
        }

        return false
    }

    var safeName: String {
        name ?? ""
    }

    var safeAttributes: [SyntaxStructure] {
        attributes ?? []
    }

    var safeSubStructure: [SyntaxStructure] {
        substructure ?? []
    }
}
