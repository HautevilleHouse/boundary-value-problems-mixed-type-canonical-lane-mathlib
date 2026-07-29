import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeOperatorPackage where
  operatorType : Type u
  domainSpace : Type v
  ellipticPart : Prop
  hyperbolicPart : Prop
  parabolicPart : Prop
  principalSymbol : Type w
  ellipticityCondition : Prop
  hyperbolicityCondition : Prop
  parabolicityCondition : Prop

structure MixedTypeOperatorEvidence (O : MixedTypeOperatorPackage) where
  ellipticityConditionClosed : O.ellipticityCondition
  hyperbolicityConditionClosed : O.hyperbolicityCondition
  parabolicityConditionClosed : O.parabolicityCondition

def MixedTypeOperatorClosed (O : MixedTypeOperatorPackage) : Prop :=
  O.ellipticityCondition ∧ O.hyperbolicityCondition ∧ O.parabolicityCondition

theorem mixed_type_operator_closed_from_evidence (O : MixedTypeOperatorPackage)
    (E : MixedTypeOperatorEvidence O) : MixedTypeOperatorClosed O := by
  exact And.intro E.ellipticityConditionClosed (And.intro E.hyperbolicityConditionClosed E.parabolicityConditionClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse