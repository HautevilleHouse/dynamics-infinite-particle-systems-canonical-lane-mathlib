import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInfiniteParticleSystemsCanonicalLaneLean

structure ParticleSystemState where
  particlePositions : List ℝ
  particleVelocities : List ℝ
  particleMasses : List ℝ
  time : ℝ

def zeroParticleSystemState : ParticleSystemState := {
  particlePositions := []
  particleVelocities := []
  particleMasses := []
  time := 0
}

structure ParticleSystemStateCertificate where
  state : ParticleSystemState
  positionsFinite : state.particlePositions.length > 0
  velocitiesFinite : state.particleVelocities.length = state.particlePositions.length
  massesPositive : ∀ m ∈ state.particleMasses, m > 0

end DynamicsInfiniteParticleSystemsCanonicalLaneLean
end HautevilleHouse