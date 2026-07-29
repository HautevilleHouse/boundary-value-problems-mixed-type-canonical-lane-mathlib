import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure WeakFormulationPackage {O : MixedTypeOperatorPackage} where
  testFunctionSpace : Type u
  bilinearForm : Type v
  coercivity : Prop
  boundedness : Prop
  infSupCondition : Prop
  wellPosedness : Prop

structure WeakFormulationEvidence {O : MixedTypeOperatorPackage}
    (W : WeakFormulationPackage O) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  infSupConditionClosed : W.infSupCondition
  wellPosednessClosed : W.wellPosedness

def WeakFormulationClosed {O : MixedTypeOperatorPackage}
    (W : WeakFormulationPackage O) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.infSupCondition ∧ W.wellPosedness

theorem weak_formulation_closed_from_evidence {O : MixedTypeOperatorPackage}
    (W : WeakFormulationPackage O) (E : WeakFormulationEvidence W) :
    WeakFormulationClosed W := by
  exact And.intro E.coercivityClosed
    (And.intro E.boundednessClosed
      (And.intro E.infSupConditionClosed E.wellPosednessClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse