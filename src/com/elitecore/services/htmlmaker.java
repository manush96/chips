package com.elitecore.services;

import java.io.File;
import java.io.IOException;

import org.jsoup.Jsoup;

import com.itextpdf.text.Document;

public class htmlmaker {
public static void creator() throws IOException
{
	File input = new File("/tmp/input.html");
	org.jsoup.nodes.Document doc = Jsoup.parse(input, "UTF-8", "http://example.com/");

}
}
