//
//  Assembler.swift
//  NewsApps
//
//  Created by Jimmi on 12/01/23.
//

import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([PresentationAssembly(), DomainAssembly(), DataAssembly()], container: container)
        return assembler
    }()
}
