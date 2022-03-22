## DLCOV - CLI to verify code coverage threshold (CI/CD, git hooks, etc.)

### Main features:

#### - It can be used in shell scripts, github actions, git hooks, etc, to block the app build if the code coverage is less than the value you enter as the minimum threshold.

#### - Include files in code coverage that Flutter does not natively include, improving the accuracy of code coverage threshold values.
> ℹ️ Flutter (test --coverage) doesn't include files that weren't referenced in tests, which can give a false impression of greater code coverage than it actually is, ONLY if you don't take this implicit detail into account.

#### - Remove unwanted files from code coverage reports using the following filters:
- By file name suffix
- By regular expression in the filename
- By the content/code inside the file

#### - It keeps a log of the tests in a file, being able to observe if the code coverage increased or decreased with each verification.

#### - Allows the generation of the `lcov.info` file by external tools, without direct dependencies to the Flutter SDK or other technologies.

----
### Usage Example
`dlcov --coverage=80 --include-untested-files=true --lcov-gen="flutter test --coverage" --log=true`

#### The command above does:
- `--coverage=80` Check if code coverage threshold is equal or greater than 80.0%
- `--include-untested-files=true` Generate references to untested files (defalt equals "false")
- `--lcov-gen="flutter test --coverage"` Generate `lcov.info` through the command "flutter test --coverage", it can be used with "test_cov" for dart only for example, or others if you prefer.
- `--log=true` Log every test coverage info in dlcov.log - Limit up to 1000 lines


### Install
`pub global activate dlcov` and later `dlcov -c 80`, `pub global run dlcov -c 80`  
or add as dev dependency to `pubspec.yaml`

```yaml
dev_dependencies:
  dlcov: 4.2.0

# pub run dlcov -c 80
```


#### Verify if code coverage threshold is equal or greater than 80.0%
`dlcov gen-refs && flutter test --coverage && dlcov -c 80`  
`dlcov -c 80 --lcov-gen="flutter test --coverage" --include-untested-files=true`  
`dlcov -c 80 --lcov-gen="test_cov" --include-untested-files=true`  

----
## Parameters availables
| Long | Short | Mandatory | Default | Sample | Description |
|---|---|---|---|---|---|
| --coverage | -c | false | 0 | 80.0 | min coverage threshold |
| --log | -l | false | false | true | Log every test coverage info in dlcov.log  - Limit up to 1000 lines |
| --include-untested-files |  | false | false | true | Get reports more coherent with reality, and do not ignore untested files during the analysis |
| --lcov-gen |  | false |  | "flutter test --coverage" | Generate `lcov.info` through the command "flutter test --coverage", it can be used with "test_cov" for dart only for example, or others if you prefer |
| --exclude-suffix | -e | false | .g.dart,.freezed.dart | .g.dart | Exclude files from test coverage results, using suffixes, separated by commas |
| --exclude-files |  | false |  | "\*widget\\.dart,\*\_part\_\*" | Exclude all files from test coverage results, with path names that contains "\_part\_" and path names that ends with "widget.dart" |
| --exclude-contents |  | false |  | "class\*extends StatefulWidget\*" | Exclude all files from test coverage results if those files contains this patterns. In the example it exclude all files that contains classes that extends StatefulWidget |
| --exclude-contents-path |  | false |  | "./patterns_list.txt" | Path to file that contains all patterns that will be used to exclude all files from test coverage results (This overrides `--exclude-contents`) |

Examples how to removing/ignoring files from code coverage reports:  
`dlcov --exclude-contents-path=example/patterns.txt -c 80 --lcov-gen="flutter test --coverage" --include-untested-files=true`

`dlcov --exclude-contents="class*extends StatefulWidget*" -c 80 --lcov-gen="flutter test --coverage" --include-untested-files=true`

`dlcov --exclude-files="*\.g\.dart" -c 80 --lcov-gen="flutter test --coverage" --include-untested-files=true`

`dlcov --exclude-suffix=".g.dart" -c 80 --lcov-gen="flutter test --coverage" --include-untested-files=true`  

---


| Command | Description |
|---|---|
| gen-refs | It generate test file references for all dart files under lib folder, it should be used before lcov.info file generation step. And it can be filtered, using additional parameters.|
Examples:  
`dlcov gen-refs --exclude-contents-path=example/patterns.txt`  
`dlcov gen-refs --exclude-files="lib/usecases/*,*/models/*,*\.g\.dart"` _all files under "lib/usecases/" folder, all files with "models" in the path, all files that contains ".g.dart"_

----
### Github actions

if the test coverage is less than 80, it stop the pipeline here, and abort the actions

![Screen Shot 2022-03-20 at 01 49 51](https://user-images.githubusercontent.com/3827308/159148726-41169935-54b8-42a2-9dbf-4f29a570a0fb.png)

