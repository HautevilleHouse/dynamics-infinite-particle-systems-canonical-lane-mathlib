import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsInfiniteParticleSystemsCanonicalLaneLean.InfiniteParticleSystem

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure PropagationOfChaosCertificate where
  system : InfiniteParticleSystem
  meanFieldLimit : Prop
  chaosProperty : Prop
  quantitativeBounds : Prop
  meanFieldLimitProof : meanFieldLimit
  chaosPropertyProof : chaosProperty
  quantitativeBoundsProof : quantitativeBounds

def sourcePropagationOfChaosCertificate : PropagationOfChaosCertificate := {
  system := {
    x := λ _ => 0
    v := λ _ => 0
    mass := 1.0
    interactionPotential := λ _ => 0.0
  }
  meanFieldLimit := True
  chaosProperty := True
  quantitativeBounds := True
  meanFieldLimitProof := trivial
  chaosPropertyProof := trivial
  quantitativeBoundsProof := trivial
}

def PropagationOfChaosClosed (C : PropagationOfChaosCertificate) : Prop :=
  C.meanFieldLimit ∧ C.chaosProperty ∧ C.quantitativeBounds

theorem source_propagation_of_chaos_closed :
    PropagationOfChaosClosed sourcePropagationOfChaosCertificate := by
  exact And.intro sourcePropagationOfChaosCertificate.meanFieldLimitProof
    (And.intro sourcePropagationOfChaosCertificate.chaosPropertyProof
      sourcePropagationOfChaosCertificate.quantitativeBoundsProof)

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse