package trg.talentsprint.starterkit.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import trg.talentsprint.starterkit.model.Model;

public interface ModelRepository<T extends Model> extends JpaRepository<T, Long>
{
}
 


