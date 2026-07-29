import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeOperatorPackage where
  operatorType : Prop   -- true if mixed type (elliptic/hyperbolic)
  principalSymbol : Prop
  ellipticityCondition : Prop
  hyperbolicityCondition : Prop
  compatibilityCondition : Prop

structure MixedTypeOperatorEvidence (P : MixedTypeOperatorPackage) where
  operatorTypeClosed : P.operatorType
  principalSymbolClosed : P.principalSymbol
  ellipticityConditionClosed : P.ellipticityCondition
  hyperbolicityConditionClosed : P.hyperbolicityCondition
  compatibilityConditionClosed : P.compatibilityCondition

def MixedTypeOperatorClosed (P : MixedTypeOperatorPackage) : Prop :=
  P.operatorType ∧ P.principalSymbol ∧
  P.ellipticityCondition ∧ P.hyperbolicityCondition ∧
  P.compatibilityCondition

theorem mixed_type_operator_closed_from_evidence
    (P : MixedTypeOperatorPackage) (E : MixedTypeOperatorEvidence P) :
    MixedTypeOperatorClosed P := by
  exact And.intro E.operatorTypeClosed
    (And.intro E.principalSymbolClosed
      (And.intro E.ellipticityConditionClosed
        (And.intro E.hyperbolicityConditionClosed
          E.compatibilityConditionClosed)))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
