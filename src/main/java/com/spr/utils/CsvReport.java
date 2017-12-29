package com.spr.utils;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.spr.model.Adoption;
import com.spr.model.Client;
import com.spr.model.Contract;
import com.sun.deploy.util.SessionState;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Catalina on 14.04.2017.
 */
public class CsvReport implements Report {
    @Override
    public void generate(Contract contract, Adoption adoption, Client client, Float total) {
        String csvFilePath = " E:\\Catalina\\AnIII_Sem2\\SD\\Project\\proiect\\src\\main\\resources\\";
        String csvFile = "Contract"+contract.getId().toString()+".csv";
        FileWriter writer = null;
        try {
            writer = new FileWriter(csvFilePath+csvFile);
            CSVUtils.writeLine(writer, Arrays.asList("Contract: ", contract.getDate().toString()));
            CSVUtils.writeLine(writer, Arrays.asList("ID ", "Adoption Id", "Description"));

            List<String> list = new ArrayList<>();
            list.add(contract.getId().toString());
            list.add(contract.getDescription());
            CSVUtils.writeLine(writer, list);

            CSVUtils.writeLine(writer, Arrays.asList("Adoption data: ", adoption.getAdoptionDate().toString()));
            CSVUtils.writeLine(writer, Arrays.asList("ID ", "Employee Id", "Description"));
            List<String> adList = new ArrayList<>();
            adList.add(adoption.getId().toString());
            adList.add(adoption.getIdEmployee().toString());
            CSVUtils.writeLine(writer, adList);

            CSVUtils.writeLine(writer, Arrays.asList("Find it in: ", csvFilePath+csvFile));

            writer.flush();
            writer.close();
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
    }
}
