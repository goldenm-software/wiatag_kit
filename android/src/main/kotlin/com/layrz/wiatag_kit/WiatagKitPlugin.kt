@file:Suppress("UNCHECKED_CAST")

package com.layrz.wiatag_kit

import android.content.Context
import android.os.CountDownTimer
import com.gurtam.wiatagkit.ChatMessage
import com.gurtam.wiatagkit.Location
import com.gurtam.wiatagkit.Message
import com.gurtam.wiatagkit.MessageListener
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
  lateinit var channel : MethodChannel
  lateinit var commands: ReceiveListener
  private var timer : CountDownTimer? = null

  companion object {
    private const val TAG = "WiatagKitPlugin"
    var host : String = ""
    var port : Int = 0
    var unitId : String = ""
    var password : String = ""
    var commandSync : Int = 30
    var hasCommands : Boolean = true
  }

  class SenderListener : MessageSenderListener() {
    override fun onSuccess() {
      Log.d(TAG, "SenderListener.onSuccess")
    }

    override fun onFailure(errorCode: Byte) {
      Log.d(TAG, "SenderListener.onFailure")
    }
  }

  // This class is the listener for receiving messages from the server (aka. commands)
  // Receives one argument, the method channel to invoke when a command is received
  class ReceiveListener(
    private val channel: MethodChannel
  ) : MessageListener() {
    override fun onChatMessageReceived(messageId:String , chatMessage: ChatMessage) {
      Log.i(TAG, "onChatMessageReceived: ${chatMessage.message}")
      channel.invokeMethod("chatMessageReceived", mapOf(
        "message" to chatMessage.message,
        "title" to chatMessage.title,
        "latitude" to chatMessage.latitude,
        "longitude" to chatMessage.longitude,
        "commandId" to messageId,
      ))
    }

    override fun onStartServiceCommand(commandId: String, time: Int) {
      Log.i(TAG, "onStartServiceCommand: $commandId")
      channel.invokeMethod("startServiceCommand", mapOf(
        "commandId" to commandId,
        "time" to time,
      ))
    }

    override fun onStopServiceCommand(commandId: String) {
      Log.i(TAG, "onStopServiceCommand: $commandId")
      channel.invokeMethod("stopServiceCommand", mapOf(
        "commandId" to commandId,
      ))
    }

    override fun getPosition(commandId: String) {
      Log.i(TAG, "getPosition: $commandId")
      channel.invokeMethod("getPosition", mapOf(
          "commandId" to commandId,
      ))
    }

    override fun remoteConfigReceive(commandId: String, messageData: String) {
      Log.i(TAG, "remoteConfigReceive: $commandId")
      channel.invokeMethod("receiveConfigCommand", mapOf(
        "commandId" to commandId,
        "messageData" to messageData,
      ))
    }

    override fun remoteConfigRequest(commandId: String) {
        Log.i(TAG, "remoteConfigRequest: $commandId")
        channel.invokeMethod("remoteConfigRequest", mapOf(
            "commandId" to commandId,
        ))
    }

    override fun torch(commandId: String, state: Boolean) {
        Log.i(TAG, "torch: $commandId")
        channel.invokeMethod("torch", mapOf(
            "commandId" to commandId,
            "state" to state,
        ))
    }

  }

  private var appContext: Context? = null

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wiatag_kit")
    channel.setMethodCallHandler(this)
    commands = ReceiveListener(channel)
    appContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "setServer" -> {
        setServer(args = call.arguments, result = result)
      }
      "getServer" -> {
        getServer(result = result)
      }
      "sendMessage" -> {
        sendMessage(args = call.arguments as HashMap<String, Any>, result = result)
      }
      "sendSos" -> {
        sendSos(args = call.arguments as HashMap<String, Any>?, result = result)
      }
      "sendText" -> {
        sendText(args = call.arguments as HashMap<String, Any>, result = result)
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  private fun setServer(args: Any?, result: Result) {
    val map = args as Map<*, *>
    host = map["host"] as String
    port = map["port"] as Int
    unitId = map["unitId"] as String
    password = map["password"] as String
    commandSync = map["commandListener"] as Int
    hasCommands = map["hasCommands"] as Boolean

    result.success(true)

    MessageManager.initWithHost(appContext!!, host, port, unitId, password, SenderListener())

    if (hasCommands) {
      MessageManager.useChat(true)
      MessageManager.useCommands(true)
      MessageManager.registerMessageListener(commands)
      checkNewMessages()
    }
  }

  private fun checkNewMessages() {
    if (timer != null) {
        timer?.cancel()
        timer = null
    }

    val syncInMilliseconds: Long = (commandSync * 1000).toLong()
    timer = object : CountDownTimer(syncInMilliseconds, syncInMilliseconds) {
        override fun onTick(millisUntilFinished: Long) {
            Log.i(TAG, "Checking for new messages")
        }

        override fun onFinish() {
            Log.i(TAG, "Checking for new messages")
            MessageManager.checkUpdates(SenderListener())
            timer?.start()
            checkNewMessages()
        }
    }.start()
  }

  private fun getServer(result: Result) {
      val map = mapOf(
              "host" to host,
              "port" to port,
              "unitId" to unitId,
              "password" to password,
              "commandListener" to commandSync,
              "hasCommands" to hasCommands
      )
      result.success(map)
  }

  private fun sendMessage(args: HashMap<String, Any>?, result: Result) {
      val msg = composeMessage(args = args)
      MessageManager.sendMessage(msg, SenderListener())
      result.success(true)
  }

  private fun sendSos(args:HashMap<String, Any>?, result: Result) {
      val msg = composeMessage(args = args)
      msg.sos()
      MessageManager.sendMessage(msg, SenderListener())
      result.success(true)
  }

  private fun sendText(args:HashMap<String, Any>, result: Result) {
    val data = args["message"] as HashMap<String, Any>?
    val text = args["text"] as String

    val msg = composeMessage(args = data)
    msg.text(text)
    MessageManager.sendMessage(msg, SenderListener())
    result.success(true)
  }

  private fun composeMessage(args: HashMap<String, Any>?): Message {
    val msg = Message().time(Date().time)
    if (args == null) {
      return msg
    }

    val latitude = args["latitude"] as Double
    val longitude = args["longitude"] as Double
    val altitude = args["altitude"] as Double
    val speed = args["speed"] as Double
    val direction = args["direction"] as Double
    val satellites = args["satellites"] as Int

    val location = Location(
      latitude,
      longitude,
      altitude,
      speed.toFloat(),
      direction.toInt().toShort(),
      satellites.toByte()
    )

    msg.location(location)

    val data = args["extra"] as HashMap<String, Any>
    for ((key, value) in data) {
      if (key == "battery.level") {
        msg.batteryLevel((value as Int).toByte())
      } else if (key == "alarm.event") {
        msg.sos()
      } else if (key == "driver.message") {
        msg.text(value as String? ?: "")
      } else if (value is Boolean) {
        if (value) {
          msg.addParam(key, 1)
        } else {
          msg.addParam(key, 0)
        }
      } else if (value is Int) {
        msg.addParam(key, value)
      }else if (value is Number) {
        msg.addParam(key, value.toFloat())
      } else if (value is String) {
        msg.addParam(key, value)
      } else {
        msg.addParam(key, value.toString())
      }
    }
    return msg
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    Log.i(TAG, "onDetachedFromEngine")
    appContext = null
    channel.setMethodCallHandler(null)
  }
}
