expected_str = "[Handles, AppData] = dummyCallback(Handles, AppData)";
callback_str = ui_prepareAppCallback("dummyCallback");

assert_checktrue(callback_str == expected_str);
