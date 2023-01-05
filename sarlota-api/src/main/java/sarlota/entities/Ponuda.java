package sarlota.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Ponuda {
    @Id@Column(name = "id")
    private Integer id;
    @Basic@Column(name = "naziv")
    private String naziv;
    @Basic@Column(name = "opis")
    private String opis;
    @Basic@Column(name = "cijena")
    private BigDecimal cijena;
    @Basic@Column(name = "trenutno_raspolozivo")
    private Integer trenutnoRaspolozivo;
    @Basic@Column(name = "tezina")
    private String tezina;
    @Basic@Column(name = "slika")
    private byte[] slika;
    @Basic
    @Column(name = "tip_proizvoda")
    private String tipProizvoda;
    @JsonIgnore
    @OneToMany(mappedBy = "ponudaByPonudaId")
    private List<Proizvod> proizvodsById;
    @JsonIgnore
    @OneToMany(mappedBy = "ponudaByPonudaId")
    private List<Recept> receptsById;
}
