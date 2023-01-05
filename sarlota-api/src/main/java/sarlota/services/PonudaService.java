package sarlota.services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import sarlota.entities.Ponuda;
import sarlota.entities.dto.PonudaDTO;
import sarlota.repositories.PonudaRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PonudaService {

    private final PonudaRepository ponudaRepository;

    public List<Ponuda> getAll() {
        return ponudaRepository.findAll();
    }

    public Ponuda getOne(int id) {
        return ponudaRepository.findById(id).orElse(null);
    }

    public Ponuda add(PonudaDTO ponudaDTO) {
        Ponuda ponuda = new Ponuda();

        ponuda.setNaziv(ponudaDTO.getNaziv());
        ponuda.setOpis(ponudaDTO.getNaziv());
        ponuda.setCijena(ponudaDTO.getCijena());
        ponuda.setTrenutnoRaspolozivo(ponudaDTO.getTrenutnoRaspolozivo());
        ponuda.setSlika(ponudaDTO.getSlika());
        ponuda.setTezina(ponudaDTO.getTezina());
        ponuda.setTipProizvoda(ponudaDTO.getTipProizvoda());


        if(ponuda == null) {
            return null;
        }

        return ponudaRepository.save(ponuda);
    }

    public Ponuda update(int id, PonudaDTO ponudaDTO) {
        Ponuda p = ponudaRepository.findById(id).orElse(null);
        if (p == null) {
            return null;
        }
        p.setNaziv(ponudaDTO.getNaziv());
        p.setOpis(ponudaDTO.getOpis());
        p.setCijena(ponudaDTO.getCijena());
        p.setTrenutnoRaspolozivo(ponudaDTO.getTrenutnoRaspolozivo());
        p.setTezina(ponudaDTO.getTezina());
        p.setSlika(ponudaDTO.getSlika());
        p.setTipProizvoda(ponudaDTO.getTipProizvoda());
        return ponudaRepository.save(p);
    }

    public void delete(int id) {
        ponudaRepository.deleteById(id);
    }
}
