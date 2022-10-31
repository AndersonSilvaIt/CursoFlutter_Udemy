package com.example.nativo_project

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    private val CHANNEL = "dbrcode.com.br/nativo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(FlutterEngine);

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result -> 

            if(call.method == "calcSum"){
                val a = call.argument<Int>("a")?.toInt() ?: 0
                val b = call.argument<Int>("b")?.toInt() ?: 0
                result.success(a+b)
            }else{
                result.notImplemented()
            }
        }

    }

}