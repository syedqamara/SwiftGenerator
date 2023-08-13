//
//  File.swift
//  
//
//  Created by Apple on 06/08/2023.
//

import Foundation
import core_architecture


protocol FileSaving: Saving where Output == Result<Bool, LocalFileErrorCode> {}
