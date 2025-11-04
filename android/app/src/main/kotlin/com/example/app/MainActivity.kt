package com.example.app

import android.app.Activity
import android.content.pm.PackageManager
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.util.Log
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.app/native_utils"
    private lateinit var channel: MethodChannel

    private val CAMERA_PERMISSION_REQUEST_CODE = 100
    private lateinit var pendingResult: MethodChannel.Result

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "getStorageInfo" -> getStorageInfo(result)
                "requestCameraPermission" -> requestCameraPermission(result)

                "showToast" -> {
                    val message = call.argument<String>("message")
                    val duration = call.argument<Int>("duration") ?: 2

                    if (message != null) {
                        runOnUiThread {
                            val toastDuration = if (duration > 2) Toast.LENGTH_LONG else Toast.LENGTH_SHORT

                            Toast.makeText(this@MainActivity, message, toastDuration).show()
                        }
                        result.success(null)
                    } else {
                        result.error("ARG_ERROR", "Message argument is missing for showToast.", null)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun getStorageInfo(result: MethodChannel.Result) {
        try {
            val path = Environment.getDataDirectory()
            val stat = StatFs(path.path)

            val totalBytes: Long = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
                stat.totalBytes
            } else {
                stat.totalBytes
            }
            val freeBytes: Long = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
                stat.availableBytes
            } else {
                stat.availableBytes
            }

            result.success(
                mapOf(
                    "totalBytes" to totalBytes,
                    "freeBytes" to freeBytes
                )
            )
        } catch (e: Exception) {
            Log.e("NativeUtils", "Error fetching storage info", e)
            result.error("STORAGE_ERROR", "Failed to get storage info: ${e.message}", null)
        }
    }

    private fun requestCameraPermission(result: MethodChannel.Result) {
        pendingResult = result

        val permission = android.Manifest.permission.CAMERA
        val status = ContextCompat.checkSelfPermission(this, permission)

        when (status) {
            PackageManager.PERMISSION_GRANTED -> {
                result.success("granted")
            }

            PackageManager.PERMISSION_DENIED -> {
                ActivityCompat.requestPermissions(this, arrayOf(permission), CAMERA_PERMISSION_REQUEST_CODE)
            }
            else -> {
                ActivityCompat.requestPermissions(this, arrayOf(permission), CAMERA_PERMISSION_REQUEST_CODE)
            }
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        if (requestCode == CAMERA_PERMISSION_REQUEST_CODE) {
            if (::pendingResult.isInitialized) {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    pendingResult.success("granted")
                } else {
                    val permission = android.Manifest.permission.CAMERA
                    val permanentlyDenied = !ActivityCompat.shouldShowRequestPermissionRationale(this, permission)

                    if (permanentlyDenied) {
                        pendingResult.success("permanentlyDenied")
                    } else {
                        pendingResult.success("denied")
                    }
                }
            }
        }
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }
}
