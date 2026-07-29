import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure EllipticParabolicBalancePackage where
  ellipticRegion : Prop
  parabolicRegion : Prop
  interfaceCondition : Prop
  energyEstimate : Prop

structure EllipticParabolicBalanceEvidence (P : EllipticParabolicBalancePackage) where
  ellipticRegionClosed : P.ellipticRegion
  parabolicRegionClosed : P.parabolicRegion
  interfaceConditionClosed : P.interfaceCondition
  energyEstimateClosed : P.energyEstimate

def EllipticParabolicBalanceClosed (P : EllipticParabolicBalancePackage) : Prop :=
  P.ellipticRegion ∧ P.parabolicRegion ∧ P.interfaceCondition ∧ P.energyEstimate

theorem elliptic_parabolic_balance_closed_from_evidence
    (P : EllipticParabolicBalancePackage) (E : EllipticParabolicBalanceEvidence P) :
    EllipticParabolicBalanceClosed P := by
  exact And.intro E.ellipticRegionClosed
    (And.intro E.parabolicRegionClosed
      (And.intro E.interfaceConditionClosed E.energyEstimateClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
