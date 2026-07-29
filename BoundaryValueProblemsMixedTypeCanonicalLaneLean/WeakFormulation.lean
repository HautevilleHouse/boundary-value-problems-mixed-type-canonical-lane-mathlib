import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.MixedTypeDomain
import HautevilleHouse.BoundaryValueProblemsMixedTypeCanonicalLaneLean.PDEOperators

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure WeakFormulation (D : MixedTypeDomain) (Op : MixedTypePDEOperator D) where
  bilinearForm : (D.underlyingSet → ℝ) → (D.underlyingSet → ℝ) → ℝ
  weakSolution : Prop
  boundaryCondition : Prop

structure WeakFormulationEvidence {D : MixedTypeDomain} {Op : MixedTypePDEOperator D}
    (W : WeakFormulation D Op) where
  bilinearFormBounded : Prop
  weakSolutionExists : W.weakSolution
  boundaryConditionSatisfied : W.boundaryCondition

def WeakFormulationClosed {D : MixedTypeDomain} {Op : MixedTypePDEOperator D}
    (W : WeakFormulation D Op) : Prop :=
  W.weakSolution ∧ W.boundaryCondition

theorem weak_formulation_closed_from_evidence {D : MixedTypeDomain} {Op : MixedTypePDEOperator D}
    (W : WeakFormulation D Op) (E : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro E.weakSolutionExists E.boundaryConditionSatisfied

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse