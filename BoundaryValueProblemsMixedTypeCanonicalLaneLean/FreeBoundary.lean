import BoundaryValueProblemsMixedTypeCanonicalLaneLean.HyperbolicDecay

/-!
# Free Boundary Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure FreeBoundaryPackage where
  interfaceType : Type u
  transmissionConditions : Prop
  signoriniCondition : Prop
  stefanCondition : Prop
  wellPosedness : Prop

structure FreeBoundaryEvidence (F : FreeBoundaryPackage) where
  transmissionConditionsClosed : F.transmissionConditions
  signoriniConditionClosed : F.signoriniCondition
  stefanConditionClosed : F.stefanCondition
  wellPosednessClosed : F.wellPosedness

def FreeBoundaryClosed (F : FreeBoundaryPackage) : Prop :=
  F.transmissionConditions ∧ F.signoriniCondition ∧ F.stefanCondition ∧ F.wellPosedness

theorem free_boundary_closed_from_evidence (F : FreeBoundaryPackage) (Ev : FreeBoundaryEvidence F) :
    FreeBoundaryClosed F := by
  exact And.intro Ev.transmissionConditionsClosed (And.intro Ev.signoriniConditionClosed (And.intro Ev.stefanConditionClosed Ev.wellPosednessClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
