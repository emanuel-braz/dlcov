## DLCOV - CLI app to verify flutter test coverage target in CI/CD pipeline

### Usage Example
#### Long
`dlcov --file=path/to/lcov.info --coverage=80 --exclude-sufix=.g.dart,.freezed.dart --log=true`  
#### Short
`dlcov -f ./lcov.info -c 80 -e .g.dart,.freezed.dart -l true`
  
#### Using Flutter defaults
`dlcov -c 80`

### Install 
`pub global activate dlcov`

## Parameters availables
| Long | Short | Mandatory | Default | Sample | Description |
|---|---|---|---|---|---|
| --coverage | -c | true |  | 80.0 | min coverage target |
| --file | -f | false | coverage/lcov.info | ./lcov.info | relative lcov file path |
| --log | -l | false | false | true | Log every test coverage info in dlcov.log  - Limit up to 1000 lines |
| --exclude-sufix | -e | false | .g.dart,.freezed.dart | .g.dart | Remove generated files from test coverage results, separated by commas |

### Github actions  
  
if the test coverage is less than 80, it stop the pipeline here, and abort the actions  
  
<img width="605" alt="ScreenShot" src="https://user-images.githubusercontent.com/3827308/137652713-497c726a-5f56-4a63-b59b-3c135d6921ec.png">
