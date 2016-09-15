package com.elitecore.services;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class itext {
	
	public static final String DEST = "C:/Vatsal/EliteCoreGITProject/WebContent/xyz.pdf";
    public static final String HTML = "C:/Vatsal/EliteCoreGITProject/WebContent/sample.html";
 
    public static void main(String[] args) throws IOException, DocumentException {
        File file = new File(DEST);
        file.getParentFile().mkdirs();
        itext.createPdf(DEST,HTML);
    }
 
    public static void  createPdf(String f,String html) throws IOException, DocumentException {
    	 File file = new File(f);
         //file.getParentFile().mkdirs();
    	// step 1
        Document document = new Document();
        // step 2
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
        // step 3
        document.open();
        document.add(new Chunk("")); 
        // step 4
        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
                new FileInputStream(html));
        // step 5
        document.close();
    }
}
