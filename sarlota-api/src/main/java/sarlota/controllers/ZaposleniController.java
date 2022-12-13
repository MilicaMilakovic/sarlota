package sarlota.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import sarlota.entities.Zaposleni;
import sarlota.entities.dto.ZaposleniDTO;
import sarlota.services.ZaposleniService;

import java.util.List;

@RestController
@RequestMapping("/zaposleni")
@RequiredArgsConstructor
public class ZaposleniController {
    private final ZaposleniService zaposleniService;

    @GetMapping
    public ResponseEntity<List<Zaposleni>> getAll() { return ResponseEntity.ok(zaposleniService.getAll()); }

    @GetMapping("/{id}")
    public ResponseEntity<Zaposleni> getOne(@PathVariable int id) {
        Zaposleni z = zaposleniService.getOne(id);
        return z == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(z);
    }

    @PostMapping
    public ResponseEntity<Zaposleni> add(@RequestBody ZaposleniDTO zaposleniDTO) {
        try {
            Zaposleni z = zaposleniService.add(zaposleniDTO);
            return z == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(z);
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Zaposleni> update(@PathVariable int id, @RequestBody ZaposleniDTO zaposleniDTO) {
        try {
            Zaposleni z = zaposleniService.update(id, zaposleniDTO);
            return z == null ? ResponseEntity.status(HttpStatus.NOT_FOUND).build() : ResponseEntity.ok(z);
        }
        catch (Exception e) {
            return ResponseEntity.status((HttpStatus.INTERNAL_SERVER_ERROR)).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        try {
            zaposleniService.delete(id);
            return ResponseEntity.ok().build();
        }
        catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
