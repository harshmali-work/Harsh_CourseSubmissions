# Flutter Map & LatLong
-keep class flutter_map.** { *; }
-keep class latlong2.** { *; }
-dontwarn flutter_map.**
-dontwarn latlong2.**

# Keep HTTP Client & JSON parsing used by tile requests
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod
-keep class io.flutter.plugin.common.** { *; }