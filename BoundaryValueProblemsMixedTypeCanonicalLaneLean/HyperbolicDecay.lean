import BoundaryValueProblemsMixedTypeCanonicalLaneLean.EllipticRegularity

/-!
# Hyperbolic Decay Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure HyperbolicDecayPackage where
  waveOperator : Type u
  energyEstimates : Prop
  decayRates : Prop
  lacunaryEigenvalues : Prop
  influenceDomain : Prop

structure HyperbolicDecayEvidence (H : HyperbolicDecayPackage) where
  energyEstimatesClosed : H.energyEstimates
  decayRatesClosed : H.decayRates
  lacunaryEigenvaluesClosed : H.lacunaryEigenvalues
  influenceDomainClosed : H.influenceDomain

def HyperbolicDecayClosed (H : HyperbolicDecayPackage) : Prop :=
  H.energyEstimates ∧ H.decayRates ∧ H.lacunaryEigenvalues ∧ H.influenceDomain

theorem hyperbolic_decay_closed_from_evidence (H : HyperbolicDecayPackage) (Ev : HyperbolicDecayEvidence H) :
    HyperbolicDecayClosed H := by
  exact And.intro Ev.energyEstimatesClosed (And.intro Ev.decayRatesClosed (And.intro Ev.lacunaryEigenvaluesClosed Ev.influenceDomainClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
