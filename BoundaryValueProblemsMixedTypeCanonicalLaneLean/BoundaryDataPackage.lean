import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure BoundaryDataPackage where
  boundaryType : Type u
  boundaryConditions : Prop
  dirichletCondition : Prop
  neumannCondition : Prop
  mixedCondition : Prop
  transmissionCondition : Prop
  compatibilityAcrossTypeChange : Prop

structure BoundaryDataEvidence (B : BoundaryDataPackage) where
  dirichletConditionClosed : B.dirichletCondition
  neumannConditionClosed : B.neumannCondition
  mixedConditionClosed : B.mixedCondition
  transmissionConditionClosed : B.transmissionCondition
  compatibilityAcrossTypeChangeClosed : B.compatibilityAcrossTypeChange

def BoundaryDataClosed (B : BoundaryDataPackage) : Prop :=
  B.dirichletCondition ∧ B.neumannCondition ∧ B.mixedCondition ∧
  B.transmissionCondition ∧ B.compatibilityAcrossTypeChange

theorem boundary_data_closed_from_evidence (B : BoundaryDataPackage)
    (E : BoundaryDataEvidence B) : BoundaryDataClosed B := by
  exact And.intro E.dirichletConditionClosed
    (And.intro E.neumannConditionClosed
      (And.intro E.mixedConditionClosed
        (And.intro E.transmissionConditionClosed E.compatibilityAcrossTypeChangeClosed)))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse