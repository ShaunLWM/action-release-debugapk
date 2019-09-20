# action-release-debugapk
🕷 Build and release debug APK from your Android project

## Warning
Add a target branch (eg. master) to build the APK to prevent infinite loop (releasing the APK on the release tag will trigger a rerun of the action).

## Usage

To use the action simply add the following lines to your `.github/workflows/android.yml` and provide the required Secrets and Environment variables.

#### YML
```
name: Build & Publish Debug APK
on:
 push:
  branches:
   - master
jobs:
 build:
  runs-on: ubuntu-latest
  steps:
   - uses: actions/checkout@master
   - name: Publish Debug APK
     uses: ShaunLWM/action-release-debugapk@master
     env:
      GITHUB_TOKEN: ${{ secrets.TOKEN }}
      APP_FOLDER: app
      RELEASE_TITLE: "New Build"
```

### Secrets

You'll need to provide this secret token to use the action (for publishing the APK). Enter these secrets in your Settings > Secrets

* **TOKEN**: Create a new [access token](https://github.com/settings/tokens) with `repo` access.

I am unsure as to why using the default `GITHUB_TOKEN` provided universally will fail to authorize the user. This is the only workaround that I have found.

### Environment Variables

You'll need to provide these environment variables to specify exactly what information is needed to build the APK.

* **APP_FOLDER**: main folder to search for the apk. Most of the time, it's `app`
* **RELEASE_TITLE**: title for release

## Credits

Based off [elgohr/Github-Hub-Action](https://github.com/elgohr/Github-Hub-Action)