#if canImport(Apptics)
    import Apptics
#endif

#if canImport(AppticsEventTracker)
    import AppticsEventTracker
#endif

@objc public enum APEventType : Int {
    case _GroupName_EventName
    case _students_studied
    case _students_logging
    case _app_group_app_event3
    case _app_group_app_event2
    case _app_group_app_event1
    case _employee_studied
    case _employee_logging
    case _employee_test1
    case _OS_update_apupdate
    case _OS_update_iOS_Login
    case _appticsGroup_appticsClick
    case _DressPurchase_purchase_done
    case _DressPurchase_purchase_cancel
    case _ios_cycle_login_log
    case _ios_cycle_logout_log
    case _ios_cycle_sign_in
    case _ios_cycle_sign_out
    case _Testwe_Tets
    case _AppLifecycle_iOS_Login
    case _PRE_GROUP_PRE_EVENT
    case _Local_group3_Local_event1
    case _Local_group3_Local_event4
    case _Local_group3_Local_event3
    case _e_cart123_test1
    case _e_cart123_add_cart12
    case _test_Test
    case _test_TestEventOne
    case _IN_APP_UPDATE_dismiss_install_alert
    case _IN_APP_UPDATE_update_install_event
    case _Log_782000001269121
    case _Log_782000001269117
    case _Log_782000001269119
    case _e_cart1_add_cart1
    case _sell_canceled
    case _sell_newcheck
    case _sell_sell_purchase
    case _sell_deletepurchase
    case _sell_Testing
    case _sell_refund
    case _purchase_update_purchase
    case _purchase_add_purchase
    case _purchase_delete_purchase
    case _bill_country_code
    case _web_cycle_logout
    case _web_cycle_login
    case _web_cycle_sign_in
    case _web_cycle_sign_out
    case _Local_group1_Local_event12
    case _Local_group1_Local_event1
    case _Local_group1_Local_event4
    case _Local_group1_Local_event2
    case _Local_group2_Local_event1
    case _Local_group2_Local_event4
    case _Local_group2_Local_event5
    case _Local_group2_Local_event2
    case _Local_group2_Local_event3
    case _Applifecyle_OS_Update
    case _PRE_TEST_EVENT_B
    case _PRE_TEST_EVENT_A
    case _Logu_LoguLogging
    case _Logu_782000000930033
    case _e_cart_add_cart
    case _e_cart_test2
    case _e_cart_update_cart
    case _e_cart_delete_cart
    case _782000001067039_782000001067041
    case _782000001067039_782000001067049
    case _app_cycle_logout
    case _app_cycle_login
    case _app_cycle_sign_in
    case _app_cycle_sign_out
    case _app_cycle_extra_sign
    case _TESTGROUP_TESTEVENT
        case None
}

extension Apptics
{

}

extension APEvent
{

    @objc class func event(forType type : APEventType) -> String?{

        var event : String?
        switch (type) {
        case ._GroupName_EventName:
            event="EventName"
            break
        case ._students_studied:
            event="studied"
            break
        case ._students_logging:
            event="logging"
            break
        case ._app_group_app_event3:
            event="app_event3"
            break
        case ._app_group_app_event2:
            event="app_event2"
            break
        case ._app_group_app_event1:
            event="app_event1"
            break
        case ._employee_studied:
            event="studied"
            break
        case ._employee_logging:
            event="logging"
            break
        case ._employee_test1:
            event="test1"
            break
        case ._OS_update_apupdate:
            event="apupdate"
            break
        case ._OS_update_iOS_Login:
            event="iOS_Login"
            break
        case ._appticsGroup_appticsClick:
            event="appticsClick"
            break
        case ._DressPurchase_purchase_done:
            event="purchase_done"
            break
        case ._DressPurchase_purchase_cancel:
            event="purchase_cancel"
            break
        case ._ios_cycle_login_log:
            event="login_log"
            break
        case ._ios_cycle_logout_log:
            event="logout_log"
            break
        case ._ios_cycle_sign_in:
            event="sign_in"
            break
        case ._ios_cycle_sign_out:
            event="sign_out"
            break
        case ._Testwe_Tets:
            event="Tets"
            break
        case ._AppLifecycle_iOS_Login:
            event="iOS_Login"
            break
        case ._PRE_GROUP_PRE_EVENT:
            event="PRE_EVENT"
            break
        case ._Local_group3_Local_event1:
            event="Local_event1"
            break
        case ._Local_group3_Local_event4:
            event="Local_event4"
            break
        case ._Local_group3_Local_event3:
            event="Local_event3"
            break
        case ._e_cart123_test1:
            event="test1"
            break
        case ._e_cart123_add_cart12:
            event="add_cart12"
            break
        case ._test_Test:
            event="Test"
            break
        case ._test_TestEventOne:
            event="TestEventOne"
            break
        case ._IN_APP_UPDATE_dismiss_install_alert:
            event="dismiss_install_alert"
            break
        case ._IN_APP_UPDATE_update_install_event:
            event="update_install_event"
            break
        case ._Log_782000001269121:
            event="782000001269121"
            break
        case ._Log_782000001269117:
            event="782000001269117"
            break
        case ._Log_782000001269119:
            event="782000001269119"
            break
        case ._e_cart1_add_cart1:
            event="add_cart1"
            break
        case ._sell_canceled:
            event="canceled"
            break
        case ._sell_newcheck:
            event="newcheck"
            break
        case ._sell_sell_purchase:
            event="sell_purchase"
            break
        case ._sell_deletepurchase:
            event="deletepurchase"
            break
        case ._sell_Testing:
            event="Testing"
            break
        case ._sell_refund:
            event="refund"
            break
        case ._purchase_update_purchase:
            event="update_purchase"
            break
        case ._purchase_add_purchase:
            event="add_purchase"
            break
        case ._purchase_delete_purchase:
            event="delete_purchase"
            break
        case ._bill_country_code:
            event="country_code"
            break
        case ._web_cycle_logout:
            event="logout"
            break
        case ._web_cycle_login:
            event="login"
            break
        case ._web_cycle_sign_in:
            event="sign_in"
            break
        case ._web_cycle_sign_out:
            event="sign_out"
            break
        case ._Local_group1_Local_event12:
            event="Local_event12"
            break
        case ._Local_group1_Local_event1:
            event="Local_event1"
            break
        case ._Local_group1_Local_event4:
            event="Local_event4"
            break
        case ._Local_group1_Local_event2:
            event="Local_event2"
            break
        case ._Local_group2_Local_event1:
            event="Local_event1"
            break
        case ._Local_group2_Local_event4:
            event="Local_event4"
            break
        case ._Local_group2_Local_event5:
            event="Local_event5"
            break
        case ._Local_group2_Local_event2:
            event="Local_event2"
            break
        case ._Local_group2_Local_event3:
            event="Local_event3"
            break
        case ._Applifecyle_OS_Update:
            event="OS_Update"
            break
        case ._PRE_TEST_EVENT_B:
            event="EVENT_B"
            break
        case ._PRE_TEST_EVENT_A:
            event="EVENT_A"
            break
        case ._Logu_LoguLogging:
            event="LoguLogging"
            break
        case ._Logu_782000000930033:
            event="782000000930033"
            break
        case ._e_cart_add_cart:
            event="add_cart"
            break
        case ._e_cart_test2:
            event="test2"
            break
        case ._e_cart_update_cart:
            event="update_cart"
            break
        case ._e_cart_delete_cart:
            event="delete_cart"
            break
        case ._782000001067039_782000001067041:
            event="782000001067041"
            break
        case ._782000001067039_782000001067049:
            event="782000001067049"
            break
        case ._app_cycle_logout:
            event="logout"
            break
        case ._app_cycle_login:
            event="login"
            break
        case ._app_cycle_sign_in:
            event="sign_in"
            break
        case ._app_cycle_sign_out:
            event="sign_out"
            break
        case ._app_cycle_extra_sign:
            event="extra_sign"
            break
        case ._TESTGROUP_TESTEVENT:
            event="TESTEVENT"
            break
        case .None:
            break
            default: break
        }
        return event

    }

    @objc class func group(forType type : APEventType) -> String?{

        var group : String?
        switch (type) {
        case ._GroupName_EventName:
            group="GroupName"
            break
        case ._students_studied:
            group="students"
            break
        case ._students_logging:
            group="students"
            break
        case ._app_group_app_event3:
            group="app_group"
            break
        case ._app_group_app_event2:
            group="app_group"
            break
        case ._app_group_app_event1:
            group="app_group"
            break
        case ._employee_studied:
            group="employee"
            break
        case ._employee_logging:
            group="employee"
            break
        case ._employee_test1:
            group="employee"
            break
        case ._OS_update_apupdate:
            group="OS_update"
            break
        case ._OS_update_iOS_Login:
            group="OS_update"
            break
        case ._appticsGroup_appticsClick:
            group="appticsGroup"
            break
        case ._DressPurchase_purchase_done:
            group="DressPurchase"
            break
        case ._DressPurchase_purchase_cancel:
            group="DressPurchase"
            break
        case ._ios_cycle_login_log:
            group="ios_cycle"
            break
        case ._ios_cycle_logout_log:
            group="ios_cycle"
            break
        case ._ios_cycle_sign_in:
            group="ios_cycle"
            break
        case ._ios_cycle_sign_out:
            group="ios_cycle"
            break
        case ._Testwe_Tets:
            group="Testwe"
            break
        case ._AppLifecycle_iOS_Login:
            group="AppLifecycle"
            break
        case ._PRE_GROUP_PRE_EVENT:
            group="PRE_GROUP"
            break
        case ._Local_group3_Local_event1:
            group="Local_group3"
            break
        case ._Local_group3_Local_event4:
            group="Local_group3"
            break
        case ._Local_group3_Local_event3:
            group="Local_group3"
            break
        case ._e_cart123_test1:
            group="e_cart123"
            break
        case ._e_cart123_add_cart12:
            group="e_cart123"
            break
        case ._test_Test:
            group="test"
            break
        case ._test_TestEventOne:
            group="test"
            break
        case ._IN_APP_UPDATE_dismiss_install_alert:
            group="IN_APP_UPDATE"
            break
        case ._IN_APP_UPDATE_update_install_event:
            group="IN_APP_UPDATE"
            break
        case ._Log_782000001269121:
            group="Log"
            break
        case ._Log_782000001269117:
            group="Log"
            break
        case ._Log_782000001269119:
            group="Log"
            break
        case ._e_cart1_add_cart1:
            group="e_cart1"
            break
        case ._sell_canceled:
            group="sell"
            break
        case ._sell_newcheck:
            group="sell"
            break
        case ._sell_sell_purchase:
            group="sell"
            break
        case ._sell_deletepurchase:
            group="sell"
            break
        case ._sell_Testing:
            group="sell"
            break
        case ._sell_refund:
            group="sell"
            break
        case ._purchase_update_purchase:
            group="purchase"
            break
        case ._purchase_add_purchase:
            group="purchase"
            break
        case ._purchase_delete_purchase:
            group="purchase"
            break
        case ._bill_country_code:
            group="bill"
            break
        case ._web_cycle_logout:
            group="web_cycle"
            break
        case ._web_cycle_login:
            group="web_cycle"
            break
        case ._web_cycle_sign_in:
            group="web_cycle"
            break
        case ._web_cycle_sign_out:
            group="web_cycle"
            break
        case ._Local_group1_Local_event12:
            group="Local_group1"
            break
        case ._Local_group1_Local_event1:
            group="Local_group1"
            break
        case ._Local_group1_Local_event4:
            group="Local_group1"
            break
        case ._Local_group1_Local_event2:
            group="Local_group1"
            break
        case ._Local_group2_Local_event1:
            group="Local_group2"
            break
        case ._Local_group2_Local_event4:
            group="Local_group2"
            break
        case ._Local_group2_Local_event5:
            group="Local_group2"
            break
        case ._Local_group2_Local_event2:
            group="Local_group2"
            break
        case ._Local_group2_Local_event3:
            group="Local_group2"
            break
        case ._Applifecyle_OS_Update:
            group="Applifecyle"
            break
        case ._PRE_TEST_EVENT_B:
            group="PRE_TEST"
            break
        case ._PRE_TEST_EVENT_A:
            group="PRE_TEST"
            break
        case ._Logu_LoguLogging:
            group="Logu"
            break
        case ._Logu_782000000930033:
            group="Logu"
            break
        case ._e_cart_add_cart:
            group="e_cart"
            break
        case ._e_cart_test2:
            group="e_cart"
            break
        case ._e_cart_update_cart:
            group="e_cart"
            break
        case ._e_cart_delete_cart:
            group="e_cart"
            break
        case ._782000001067039_782000001067041:
            group="782000001067039"
            break
        case ._782000001067039_782000001067049:
            group="782000001067039"
            break
        case ._app_cycle_logout:
            group="app_cycle"
            break
        case ._app_cycle_login:
            group="app_cycle"
            break
        case ._app_cycle_sign_in:
            group="app_cycle"
            break
        case ._app_cycle_sign_out:
            group="app_cycle"
            break
        case ._app_cycle_extra_sign:
            group="app_cycle"
            break
        case ._TESTGROUP_TESTEVENT:
            group="TESTGROUP"
            break
        case .None:
            break
            default: break
        }
        return group

    }

    @objc class public func trackEvent(withType type : APEventType, andProperties : [String : Any]?) {
        if let event = self.event(forType: type), let group = self.group(forType: type){
        APEvent.trackEvent(event, andGroupName: group, withProperties: andProperties ?? [:])
        }
    }

    @objc class public func trackEvent(withType type : APEventType) {
        self.trackEvent(withType: type, andProperties: nil)
    }

    @objc class public func startTimedEvent(withType type : APEventType, andProperties : [String : Any]?){
        if let event = self.event(forType: type), let group = self.group(forType: type){
        APEvent.startTimedEvent(event, group: group, andProperties: andProperties ?? [:])
        }
    }

    @objc class public func endTimedEvent(withType type : APEventType){
        if let event = self.event(forType: type){
        APEvent.endTimedEvent(event)
        }
    }

}

