package com.elitecore.services;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class Itext2 {
	
	public static void main(String[] args) throws FileNotFoundException, IOException, DocumentException {
		
		Document document = new Document();

		// step 2

		PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:/Vatsal/finall/ABCDEFGHIJKLMNOPQRSTUVWXYZ.pdf"));
		// step 3

		document.open();

		// step 4

		XMLWorkerHelper.getInstance().parseXHtml(writer, document,new FileInputStream("C:/Vatsal/EliteCoreGITProject/WebContent/sample.html"));

		//step 5

		 document.close();
		 
		 System.out.println("pdf created....");

	}

}
