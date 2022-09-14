package com.example;


import org.apache.camel.builder.RouteBuilder;
import org.springframework.stereotype.Component;

/**
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
**/

@Component
public class Xml2CsvRoute extends RouteBuilder {
    
    //private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

    @Override
    public void configure () throws Exception {

        /**
         * 1. Iterate over all order.xml files from different order types
         * 2. collect unique attributes from all order elements in a order.xml file
         *    and append to new order-clean.xml file
         *
         */
        from("file://input?noop=true")
                .routeId("xsl-transformation-clean")
                .to("xslt:order-clean.xsl")
                .to("file://output?fileName=order-clean.xml&fileExist=Append")
                .log("Successfully Transformed order xml files to order-clean xml file");


        /**
         * 1. Iterate over all ItemA elements in order-clean.xml file
         *    collect unique attributes
         * 2. produces order-clean-out.csv file as
         *    by adding columns for each order type and put an x
         *    in the column if the filed is used by that order type
         *
         */
        from("file://input2")
                .routeId("xsl-transformation-csv")
                .to("xslt:xml2csv.xsl")
                .to("file://output?fileName=order-clean-out.csv")
                .log("Successfully Transformed order-clean xml file to order-clean-out csv file");
                
    }

}
