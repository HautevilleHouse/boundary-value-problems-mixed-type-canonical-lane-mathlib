import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure LaxFriedrichsSolverPackage where
  numericalFlux : Prop
  cflCondition : Prop
  conservationProperty : Prop
  entropyDissipation : Prop

structure LaxFriedrichsSolverEvidence (L : LaxFriedrichsSolverPackage) where
  numericalFluxClosed : L.numericalFlux
  cflConditionClosed : L.cflCondition
  conservationPropertyClosed : L.conservationProperty
  entropyDissipationClosed : L.entropyDissipation

def LaxFriedrichsSolverClosed (L : LaxFriedrichsSolverPackage) : Prop :=
  L.numericalFlux ∧ L.cflCondition ∧ L.conservationProperty ∧ L.entropyDissipation

theorem lax_friedrichs_solver_closed_from_evidence
    (L : LaxFriedrichsSolverPackage) (E : LaxFriedrichsSolverEvidence L) :
    LaxFriedrichsSolverClosed L := by
  exact And.intro E.numericalFluxClosed
    (And.intro E.cflConditionClosed
      (And.intro E.conservationPropertyClosed E.entropyDissipationClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
