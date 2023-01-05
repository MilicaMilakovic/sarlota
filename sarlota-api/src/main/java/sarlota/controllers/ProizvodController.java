package sarlota.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sarlota.entities.Proizvod;
import sarlota.entities.dto.ProizvodDTO;
import sarlota.services.ProizvodService;

import java.util.List;

@RestController
@RequestMapping("/proizvod")
@RequiredArgsConstructor
public class ProizvodController {
    private final ProizvodService proizvodService;

    @GetMapping
    public ResponseEntity<List<Proizvod>> getAll() {
        return ResponseEntity.ok(proizvodService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Proizvod> getOne(@PathVariable int id) {
        Proizvod proizvod = proizvodService.getOne(id);
        return proizvod == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(proizvod);
    }

    @PostMapping
    public ResponseEntity<Proizvod> add(@RequestBody ProizvodDTO proizvodDTO) {
        try {
            Proizvod ponuda = proizvodService.add(proizvodDTO);
            return ponuda == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(ponuda);
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Proizvod> update(@PathVariable int id, @RequestBody ProizvodDTO ponudaDTO) {
        try {
            Proizvod proizvod = proizvodService.update(id, ponudaDTO);
            return proizvod == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(proizvod);
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        try {
            proizvodService.delete(id);
            return ResponseEntity.ok().build();
        }
         catch (Exception e) {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
         }
    }
}
