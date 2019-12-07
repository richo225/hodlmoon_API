Rake::Task['exchanges:seed_db'].invoke
Rake::Task['coins:seed_db'].invoke
Rake::Task['coin_icons:attach_files'].invoke
