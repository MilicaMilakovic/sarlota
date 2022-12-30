package sarlota.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import sarlota.entities.Ponuda; //Ponuda entity dependency

public interface PonudaRepository extends JpaRepository<Ponuda, Integer> {
}
