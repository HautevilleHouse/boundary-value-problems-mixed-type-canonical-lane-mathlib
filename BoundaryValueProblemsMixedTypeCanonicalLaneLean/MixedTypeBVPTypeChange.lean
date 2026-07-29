import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure TypeChangeFrontPackage where
  sonicSurface : Prop
  lavaFlowRegion : Prop
  typeTransitionCondition : Prop
  entropyCondition : Prop

structure TypeChangeFrontEvidence (T : TypeChangeFrontPackage) where
  sonicSurfaceClosed : T.sonicSurface
  lavaFlowRegionClosed : T.lavaFlowRegion
  typeTransitionConditionClosed : T.typeTransitionCondition
  entropyConditionClosed : T.entropyCondition

def TypeChangeFrontClosed (T : TypeChangeFrontPackage) : Prop :=
  T.sonicSurface ∧ T.lavaFlowRegion ∧ T.typeTransitionCondition ∧ T.entropyCondition

theorem type_change_front_closed_from_evidence
    (T : TypeChangeFrontPackage) (E : TypeChangeFrontEvidence T) :
    TypeChangeFrontClosed T := by
  exact And.intro E.sonicSurfaceClosed
    (And.intro E.lavaFlowRegionClosed
      (And.intro E.typeTransitionConditionClosed E.entropyConditionClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
