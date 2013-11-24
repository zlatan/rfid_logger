package com.example.qrgpne;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.widget.Toast;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//setContentView(R.layout.activity_main);
		scan("Init");
	}
	
	protected void onDestroy()
	{
	android.os.Process.killProcess(android.os.Process.myPid());
	super.onDestroy();
	}
	
    public void scan(String registration)
    {
    	IntentIntegrator scanIntegrator = new IntentIntegrator(this);
		Toast toast = Toast.makeText(getApplicationContext(),
				registration, Toast.LENGTH_LONG);
		toast.show();
		scanIntegrator.initiateScan();

    }
    
    private void readStream(InputStream in) {
    	  BufferedReader reader = null;
    	  try {
    	    reader = new BufferedReader(new InputStreamReader(in));
    	    String line = "";
    	    while ((line = reader.readLine()) != null) {
    	      System.out.println(line);
    	    }
    	  } catch (IOException e) {
    	    e.printStackTrace();
    	  } finally {
    	    if (reader != null) {
    	      try {
    	        reader.close();
    	      } catch (IOException e) {
    	        e.printStackTrace();
    	        }
    	    }
    	  }
    	} 
    
	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		//retrieve result of scanning - instantiate ZXing object
		IntentResult scanningResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);
		//check we have a valid result
		if (scanningResult != null) {
			String scanContent = scanningResult.getContents();
			//Toast toast = Toast.makeText(getApplicationContext(),	"CONTENT: "+scanContent, Toast.LENGTH_LONG);
			//toast.show();
			 
			try {
				  URL url = new URL("http://www.vogella.com");
				  HttpURLConnection con = (HttpURLConnection) url
				    .openConnection();
				  readStream(con.getInputStream());
				  } catch (Exception e) {
				  e.printStackTrace();
				}

			
			scan(scanContent);
					if (scanContent == null)
					    finish();
		}
		else{
			//invalid scan data or scan canceled
			Toast toast = Toast.makeText(getApplicationContext(), 
					"No scan data received!", Toast.LENGTH_SHORT);
			toast.show();
		}
	}
}