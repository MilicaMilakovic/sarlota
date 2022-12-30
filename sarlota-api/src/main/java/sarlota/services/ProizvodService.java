package sarlota.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sarlota.entities.Narudzba;
import sarlota.entities.Proizvod;
import sarlota.entities.Ponuda;
import sarlota.entities.dto.ProizvodDTO;
import sarlota.repositories.NarudzbaRepository;
import sarlota.repositories.PonudaRepository;
import sarlota.repositories.ProizvodRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProizvodService {

    private final NarudzbaRepository narudzbaRepository;
    //private final PonudaRepository ponudaRepository; //Commented, can be used later if necessary
    private final ProizvodRepository proizvodRepository;
    private final PonudaRepository ponudaRepository;

    public List<Proizvod> getAll() {
        return proizvodRepository.findAll();
    }

    public Proizvod getOne(int id) {
        return proizvodRepository.findById(id).orElse(null);
    }

    public Proizvod add(ProizvodDTO proizvodDTO) {
        Narudzba narudzba = narudzbaRepository.findById(proizvodDTO.getNarudzbaId()).orElse(null);
        //Ponuda ponuda = ponudaRepository.findById(proizvodDTO.getPonudaId()).orElse(null);

       // if(narudzba == null || ponuda == null) {
       //     return null;
       // }
        Proizvod proizvod = new Proizvod(
                proizvodDTO.getKolicina(),
                null,
                narudzba,
                null //Can replace with ponuda if ponuda object is uncommented
        );
        return proizvodRepository.save(proizvod);
    }

    public Proizvod update(int id, ProizvodDTO proizvodDTO) {
        Proizvod proizvod = proizvodRepository.findById(id).orElse(null);
        if (proizvod == null) {
            return null;
        }
        proizvod.setKolicina(proizvodDTO.getKolicina());

        return proizvodRepository.save(proizvod);
    }

    public void delete(int id) {
        proizvodRepository.deleteById(id);
    }
}
