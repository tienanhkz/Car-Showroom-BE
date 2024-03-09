package com.vti.testing.json;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CustomDateDeserializer extends StdDeserializer<Date> {

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");

    public CustomDateDeserializer() {
        this(null);
    }

    public CustomDateDeserializer(Class<?> vc) {
        super(vc);
    }

    @Override
    public Date deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException {
        JsonNode node = jsonParser.getCodec().readTree(jsonParser);
        String dateStr = node.textValue();

        try {
            java.util.Date date = dateFormat.parse(dateStr);
            return new Date(date.getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
