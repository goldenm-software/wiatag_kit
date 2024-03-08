package com.layrz.wiatag_kit

import android.content.Context
import com.gurtam.wiatagkit.Message
import com.gurtam.wiatagkit.MessageManager
import com.gurtam.wiatagkit.MessageSenderListener
import io.flutter.Log

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.Date

/** WiatagKitPlugin */
class WiatagKitPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  companion object {
    private const val TAG = "WiatagKitPlugin"
    var host : String = ""
    var port : Int = 0
    var unitId : String = ""
    var password : String = ""
  }

  class SenderListener : MessageSenderListener() {
    override fun onSuccess() {
      Log.d(TAG, "SenderListener.onSuccess")
    }

    override fun onFailure(errorCode: Byte) {
      Log.d(TAG, "SenderListener.onFailure")
    }
  }

  private var appContext: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wiatag_kit")
    channel.setMethodCallHandler(this)
    appContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "setServer" -> setServer(args = call.arguments, result = result)
      "getServer" -> getServer(result = result)
      "sendMessage" -> sendMessage(args = call.arguments, result = result)
      "senSos" -> senSos(result = result)
      else -> result.notImplemented()
    }
  }

  private fun setServer(args: Any?, result: Result) {
    val map = args as Map<*, *>
    host = map["host"] as String
    port = map["port"] as Int
    unitId = map["unitId"] as String
    password = map["password"] as String
    result.success(true)

    MessageManager.initWithHost(appContext!!, host, port, unitId, password, SenderListener())
  }

    private fun getServer(result: Result) {
        val map = mapOf(
                "host" to host,
                "port" to port,
                "unitId" to unitId,
                "password" to password
        )
        result.success(map)
    }

    private fun sendMessage(args: Any?, result: Result) {
        val map = args as Map<*, *>
        // pass
    }

    private fun senSos(result: Result) {
        val msg = Message().time(Date().time)
        msg.sos()
        MessageManager.sendMessage(msg, SenderListener())
        result.success(true)
    }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    Log.i(TAG, "onDetachedFromEngine")
    appContext = null
    channel.setMethodCallHandler(null)
  }
}
