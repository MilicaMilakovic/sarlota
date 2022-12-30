package sarlota.entities.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class KontaktDTO {
    private String naziv;
    private String opis;
    private BigDecimal cijena;
    private Integer trenutnoRaspolozivo;
    private String tezina;
    private byte[] slika;
    private string tipProizvoda;
}
