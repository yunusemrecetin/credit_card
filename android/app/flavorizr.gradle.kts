import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("default")

    productFlavors {
        create("dev") {
            dimension = "default"
            applicationId = "app.solike.dev"
            resValue(type = "string", name = "app_name", value = "Dev So Like App")
        }
        create("beta") {
            dimension = "default"
            applicationId = "app.solike.beta"
            resValue(type = "string", name = "app_name", value = "Beta So Like App")
        }
        create("prod") {
            dimension = "default"
            applicationId = "app.solike"
            resValue(type = "string", name = "app_name", value = "So Like App")
        }
    }
}