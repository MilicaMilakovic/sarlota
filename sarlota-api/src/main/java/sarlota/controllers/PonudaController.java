package sarlota.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sarlota.entities.Ponuda;
import sarlota.entities.dto.PonudaDTO;
import sarlota.services.PonudaService;

import java.util.List;

@RestController
@RequestMapping("/ponuda")
@RequiredArgsConstructor
public class PonudaKontaktController {
    private final PonudaService ponudaService;

    @GetMapping
    public ResponseEntity<List<Kontakt>> getAll() {
        return ResponseEntity.ok(ponudaService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Ponuda> getOne(@PathVariable int id) {
        Ponuda ponuda = ponudaService.getOne(id);
        return ponuda == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(ponuda);
    }

    @PostMapping
    public ResponseEntity<Ponuda> add(@RequestBody PonudaDTO ponudaDTO) {
        try {
            Ponuda ponuda = ponudaService.add(ponudaDTO);
            return ponuda == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(ponuda);
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Ponuda> update(@PathVariable int id, @RequestBody PonudaDTO ponudaDTO) {
        try {
            Ponuda ponuda = ponudaService.update(id, kontaktDTO);
            return ponuda == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(ponuda);
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        try {
            ponudaService.delete(id);
            return ResponseEntity.ok().build();
        }
         catch (Exception e) {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
         }
    }
}
