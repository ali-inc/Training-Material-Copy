rspec spec/Controller --format html --out reports/unit_testing/controller_report.html
rspec spec/Model --format html --out reports/unit_testing/model_report.html
rspec spec/View --format html --out reports/unit_testing/view_report.html

cucumber features/admin_features.feature -f html -o reports/admin_features_report.html

cucumber features/profile_features.feature -f html -o reports/user_features_report.html

cucumber features/tab_features.feature -f html -o reports/tab_features_report.html