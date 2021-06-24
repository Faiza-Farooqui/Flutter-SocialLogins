package com.faizafarooqui.social_logins_flutter;

import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;

import java.security.NoSuchAlgorithmException;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        GeneratedPluginRegistrant.registerWith(this);
//        generateKeyHash();
    }
   /* public void generateKeyHash() {
        try {
            PackageInfo info = getPackageManager().getPackageInfo( getPackageName(), PackageManager.GET_SIGNATURES);
            for (Signature signature : info.signatures) {
                MessageDigest md = MessageDigest.getInstance("SHA");
                md.update(signature.toByteArray());
                Log.d(">>>>>KeyHash:", Base64.encodeToString(md.digest(), Base64.DEFAULT));
            }
        } catch (PackageManager.NameNotFoundException e) {
            Log.i(">>>>>>",e.toString());
        } catch (NoSuchAlgorithmException e) {
            Log.i(">>>>",e.toString());
        }
    } */
}
