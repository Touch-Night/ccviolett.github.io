+++ 
draft = false
date = 2022-03-25T17:56:46+08:00
title = "如何使用 WebView 来制作 Web 套壳 APP？"
description = ""
slug = ""
authors = ["ccviolett"]
tags = []
categories = []
externalLink = ""
series = []
+++

## 零、前期准备

安装 Android Studio，安装对应版本 `SDK Tools`，新建项目。

## 一、代码修改

修改 `app/java/{创建时指定的包名}/MainActivity.java` 如下：

> 注意！代码第一行要改为你的包名，中间的链接要改为自己的网页链接

```java
package {创建时指定的包名};

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.View;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        this.createWebView();
    }

    @SuppressLint("SetJavaScriptEnabled")
    private void createWebView() {
        final WebView webView = (WebView) findViewById(R.id.webview);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient());
        String url = "{你要套壳的网页链接}";
        webView.loadUrl(url);

        webView.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View v, int keyCode, KeyEvent event) {
                if (keyCode == KeyEvent.KEYCODE_BACK && webView.canGoBack()) {
                    webView.goBack();
                    return true;
                }
                return false;
            }
        });
    }
}
```

修改 `app/res/layout/activity_main.xml` 如下：

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <WebView
        android:id="@+id/webview"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

修改 `app/minifests/AndroidMinifests.xml` 如下：

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="top.voluntalk.mobile">

    <uses-permission android:name="android.permission.INTERNET" />

    <application
        android:allowBackup="true"
        android:icon="@drawable/logo"
        android:label="@string/app_name"
        android:roundIcon="@drawable/logo"
        android:supportsRtl="true"
        android:usesCleartextTraffic="true"
        android:theme="@style/Theme.Voluntalk">
        <activity
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

修改 `app/res/values/styles.xml` （或 `values/Theme` 目录下的文件）如下：

```xml
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Theme.Voluntalk" parent="Theme.MaterialComponents.DayNight.DarkActionBar">
        <!-- Primary brand color. -->
        <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/white</item>
        <!-- Secondary brand color. -->
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
        <!-- Status bar color. -->
        <item name="android:statusBarColor" tools:targetApi="l">?attr/colorPrimaryVariant</item>
        <!-- Customize your theme here. -->

        <item name="windowNoTitle">true</item>
        <item name="windowActionBar">false</item>
    </style>
</resources>
```

## 二、配置图标

将图片复命名为 `logo.jpg` 或 `logo.png` 放入文件夹 `res/drawable` 下。

## 三、打包发布

顶栏 Build -> Generate Signed Bundle / APK… -> APK

随后选择一个存储 Key 的位置，输入密码配置好，即可生成 release 包。

## 四、参考资料

1. [用安卓 WebView 做一个“套壳”应用](https://blog.csdn.net/iFasWind/article/details/107776950)
2. [Android Studio进行APP图标更改的两种方式总结](https://blog.csdn.net/NYH19961125/article/details/88656695)
3. [Android Studio 打包APK（详细版）](https://blog.csdn.net/qq_38436214/article/details/112288954)

出现问题：
- [Android Studio Build窗口出现中文乱码问题](https://blog.csdn.net/u013466454/article/details/108275334)
