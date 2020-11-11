package com.example.flutter_app_team_test

import android.content.Intent
import android.provider.AlarmClock.EXTRA_MESSAGE
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.jetbrains.annotations.NotNull

class MainActivity: FlutterActivity() ,MethodChannel.MethodCallHandler{
    private val CHANNEL = "flutter_app_team_test/mychannel";
    override fun configureFlutterEngine(@NotNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler(this)
    }

    fun getData() :String{
        return "Message from Android";
    }
    private fun openSecondActivity(info: String) {
        val intent = Intent(this, SecondActivity::class.java)
        val message = info

        intent.putExtra(EXTRA_MESSAGE, message)
        startActivity(intent)
    }
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val args = call.arguments as List<*>
        val param = args.first() as String

        when(call.method) {
            "getData" -> {
                val message = getData()
                result.success(message)

            }
            "openPage" -> {
                openSecondActivity(param)
            } else -> result.notImplemented()
        }
    }
}
