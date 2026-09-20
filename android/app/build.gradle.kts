import java.util.Properties
import java.io.FileInputStream
import org.jetbrains.kotlin.gradle.dsl.JvmTarget

plugins {
    id ("com.android.application")
    // START: FlutterFire Configuration
    id ("com.google.gms.google-services")
    id ("com.google.firebase.firebase-perf")
    id ("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id ("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id ("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
val hasKeystore = keystorePropertiesFile.exists()
if (hasKeystore) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.example.portfolio"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    buildFeatures {
        // AGP 9 defaults this off; the flavors below declare app_name via
        // resValue, which silently stops being generated without it.
        resValues = true
    }

    flavorDimensions += "default"

    productFlavors {
        create("staging") {
            dimension = "default"
            resValue(type = "string", name = "app_name", value = "Proftfolio (staging)")
        }

        create("prod") {
            dimension = "default"
            resValue(type = "string", name = "app_name", value = "Proftfolio")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.portfolio"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        // key.properties is gitignored, so it is absent on a fresh clone and
        // in CI. Casting its missing values fails configuration for *every*
        // task, debug included, so only declare the config when it is there.
        if (hasKeystore) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = keystoreProperties["storeFile"]?.let { file(it) }
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }

        release {
            // Without the keystore a release build is debug-signed rather than
            // unbuildable — shippable artifacts still require key.properties.
            signingConfig = signingConfigs.getByName(
                if (hasKeystore) "release" else "debug"
            )
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
