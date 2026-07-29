import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure BoundaryConditionsPackage where
  boundaryParts : Prop   -- e.g., Dirichlet, Neumann, mixed
  compatibilityAcrossParts : Prop
  traceOperator : Prop
  wellPosedBoundary : Prop

structure BoundaryConditionsEvidence (B : BoundaryConditionsPackage) where
  boundaryPartsClosed : B.boundaryParts
  compatibilityAcrossPartsClosed : B.compatibilityAcrossParts
  traceOperatorClosed : B.traceOperator
  wellPosedBoundaryClosed : B.wellPosedBoundary

def BoundaryConditionsClosed (B : BoundaryConditionsPackage) : Prop :=
  B.boundaryParts ∧ B.compatibilityAcrossParts ∧
  B.traceOperator ∧ B.wellPosedBoundary

theorem boundary_conditions_closed_from_evidence
    (B : BoundaryConditionsPackage) (E : BoundaryConditionsEvidence B) :
    BoundaryConditionsClosed B := by
  exact And.intro E.boundaryPartsClosed
    (And.intro E.compatibilityAcrossPartsClosed
      (And.intro E.traceOperatorClosed E.wellPosedBoundaryClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
