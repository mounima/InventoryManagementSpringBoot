package trg.talentsprint.starterkit.repository;

import trg.talentsprint.starterkit.model.Sequence;

public interface SequenceRepository extends ModelRepository<Sequence>
{
  /**
   * Finds a sequence with a specified name.
   *
   * @param name The sequence name to find.
   * @return A {@link Sequence} if one with the specified name is found,
   * {@code null} otherwise.
   */
  Sequence findByName(String name);
}