import BoundaryValueProblemsMixedType.MixedTypeAdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure DomainCharacterizationPackage (A : MixedTypeAdmittedObject) where
  hyperbolicRegion : Set A.domain
  parabolicRegion : Set A.domain
  ellipticRegion : Set A.domain
  typeChangeSurface : Set A.domain
  smoothnessOfCoefficients : Prop
  characterizationClosed : Prop

structure DomainCharacterizationEvidence (P : DomainCharacterizationPackage) where
  hyperbolicRegionClosed : P.hyperbolicRegion ≠ ∅
  parabolicRegionClosed : P.parabolicRegion ≠ ∅
  ellipticRegionClosed : P.ellipticRegion ≠ ∅
  typeChangeSurfaceClosed : P.typeChangeSurface ≠ ∅
  smoothnessOfCoefficientsClosed : P.smoothnessOfCoefficients

def DomainCharacterizationClosed (P : DomainCharacterizationPackage) : Prop :=
  (P.hyperbolicRegion ≠ ∅) ∧ (P.parabolicRegion ≠ ∅) ∧ (P.ellipticRegion ≠ ∅) ∧ (P.typeChangeSurface ≠ ∅) ∧ P.smoothnessOfCoefficients

theorem domain_characterization_closed_from_evidence (P : DomainCharacterizationPackage) (E : DomainCharacterizationEvidence P) : DomainCharacterizationClosed P := by
  exact And.intro E.hyperbolicRegionClosed (And.intro E.parabolicRegionClosed (And.intro E.ellipticRegionClosed (And.intro E.typeChangeSurfaceClosed E.smoothnessOfCoefficientsClosed)))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
