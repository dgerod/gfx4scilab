// ==========================================================
// loader.sce
// ==========================================================

dir_path = get_absolute_file_path("start_app.sce");
cd(dir_path);

// Load toolbox (dependencies)
exec("../../../loader.sce", -1);

// Application
getd("./data");
getd("./ctrl");
getd("./view");
exec("./theApp.sce", -1);

// ==========================================================
