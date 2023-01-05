package sarlota.entities.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProizvodDTO {
    private Integer narudzbaId;
    private Integer ponudaId;
    private Integer kolicina;
}
