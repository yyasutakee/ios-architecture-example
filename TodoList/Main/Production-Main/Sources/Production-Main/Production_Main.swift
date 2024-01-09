import SwiftUI
import UIImpl
import LogicImpl
import PersistenceImpl

let dataAccessFactory: DataAccessFactoryImpl = DataAccessFactoryImpl()

public var viewFactory = ListViewFactoryImpl(mf: ListModelFactoryImpl(daf: dataAccessFactory))

#if DEBUG
public func resetData() {
    dataAccessFactory.deleteAllData("delete all tasks in core data")
}
#endif
