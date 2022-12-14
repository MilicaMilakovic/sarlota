package sarlota.entities.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import sarlota.entities.Proizvod;
import sarlota.entities.Zaposleni;

import javax.persistence.*;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NarudzbaDTO {
    private LocalDateTime datumPrijema;
    private LocalDateTime datumIsporuke;
    private String opis;
    private Boolean aktivna;
    private Integer idZaposlenog;
}
