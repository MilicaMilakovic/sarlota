package sarlota.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sarlota.entities.Proizvod;

public interface ProizvodRepository extends JpaRepository<Proizvod, Integer> {
}
