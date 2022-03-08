## DLCOV - CLI to add code coverage threshold (CI/CD, git hooks, etc.)

### Usage Example
#### Long
`dlcov --coverage=80 --exclude-suffix=.g.dart,.freezed.dart --log=true`
#### Short
`dlcov -c 80 -e .g.dart,.freezed.dart -l true`

#### Using Flutter defaults
`dlcov -c 80`

### Install
`pub global activate dlcov`

## Parameters availables
| Long | Short | Mandatory | Default | Sample | Description |
|---|---|---|---|---|---|
| --coverage | -c | true |  | 80.0 | min coverage target |
| --package-name | -p | false | current dir name | dlcov | Use this, if root folder is not the same as the package name |
| --log | -l | false | false | true | Log every test coverage info in dlcov.log  - Limit up to 1000 lines |
| --exclude-suffix | -e | false | .g.dart,.freezed.dart | .g.dart | Remove generated files from test coverage results, separated by commas |

### Github actions

if the test coverage is less than 80, it stop the pipeline here, and abort the actions

<img width="605" alt="ScreenShot" src="https://user-images.githubusercontent.com/3827308/137652713-497c726a-5f56-4a63-b59b-3c135d6921ec.png">
