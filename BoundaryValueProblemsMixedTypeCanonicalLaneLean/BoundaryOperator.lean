import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure BoundaryOperator where
  operatorType : Prop
  domainAdapted : Prop
  rangeSpace : Prop
  coercivityEstimate : Prop

structure BoundaryOperatorPackage where
  operator : BoundaryOperator
  regularity : operator.operatorType → Prop
  adaptation : operator.domainAdapted → Prop
  rangeInclusion : operator.rangeSpace → Prop
  coercivityBound : operator.coercivityEstimate → Prop

structure BoundaryOperatorEvidence (P : BoundaryOperatorPackage) where
  regularityClosed : ∀ (h : P.operator.operatorType), P.regularity h
  adaptationClosed : ∀ (h : P.operator.domainAdapted), P.adaptation h
  rangeInclusionClosed : ∀ (h : P.operator.rangeSpace), P.rangeInclusion h
  coercivityBoundClosed : ∀ (h : P.operator.coercivityEstimate), P.coercivityBound h

def BoundaryOperatorClosed (P : BoundaryOperatorPackage) : Prop :=
  (∀ (h : P.operator.operatorType), P.regularity h) ∧
  (∀ (h : P.operator.domainAdapted), P.adaptation h) ∧
  (∀ (h : P.operator.rangeSpace), P.rangeInclusion h) ∧
  (∀ (h : P.operator.coercivityEstimate), P.coercivityBound h)

theorem boundary_operator_closed_from_evidence (P : BoundaryOperatorPackage) (E : BoundaryOperatorEvidence P) :
    BoundaryOperatorClosed P := by
  exact And.intro E.regularityClosed
    (And.intro E.adaptationClosed
      (And.intro E.rangeInclusionClosed E.coercivityBoundClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse