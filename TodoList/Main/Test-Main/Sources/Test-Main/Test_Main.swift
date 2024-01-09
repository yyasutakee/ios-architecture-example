import SwiftUI
import UIImpl
import Logic
import UI
import Persistence
import LogicImpl

public var viewFactory: some ListViewFactory = ListViewFactoryImpl(mf: ListModelFactoryImpl(daf: DataAccessFactoryTest()))
