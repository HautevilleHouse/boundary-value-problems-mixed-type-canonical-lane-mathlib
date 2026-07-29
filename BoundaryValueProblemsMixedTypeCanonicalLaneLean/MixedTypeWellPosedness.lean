import BoundaryValueProblemsMixedType.MixedTypeInterfaceConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure WellPosednessPackage {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} {I : InterfaceConditionsPackage D} where
  existenceOfSolution : Prop
  uniquenessOfSolution : Prop
  continuousDependence : Prop
  wellPosednessClosed : Prop

structure WellPosednessEvidence {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} {I : InterfaceConditionsPackage D} (W : WellPosednessPackage I) where
  existenceOfSolutionClosed : W.existenceOfSolution
  uniquenessOfSolutionClosed : W.uniquenessOfSolution
  continuousDependenceClosed : W.continuousDependence

def WellPosednessClosed {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} {I : InterfaceConditionsPackage D} (W : WellPosednessPackage I) : Prop :=
  W.existenceOfSolution ∧ W.uniquenessOfSolution ∧ W.continuousDependence

theorem well_posedness_closed_from_evidence {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} {I : InterfaceConditionsPackage D} (W : WellPosednessPackage I) (E : WellPosednessEvidence W) : WellPosednessClosed W := by
  exact And.intro E.existenceOfSolutionClosed (And.intro E.uniquenessOfSolutionClosed E.continuousDependenceClosed)

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
