package com.example.flutter_app_team_test

import android.app.Activity
import android.app.AppComponentFactory
import android.os.Bundle
import android.os.PersistableBundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class SecondActivity : AppCompatActivity(){

    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        val textView: TextView = findViewById(R.id.helloText) as TextView
        super.onCreate(savedInstanceState, persistentState)
        setContentView(R.layout.activity_second)
        supportActionBar?.title = "Second Activity"
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        textView.text = intent.getStringExtra("info")
    }
    override fun onSupportNavigateUp(): Boolean {
        finish()
        return super.onSupportNavigateUp()
    }
}