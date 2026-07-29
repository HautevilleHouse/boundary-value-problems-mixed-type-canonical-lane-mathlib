import BoundaryValueProblemsMixedType.MixedTypeDomainCharacterization

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure InterfaceConditionsPackage {A : MixedTypeAdmittedObject} (D : DomainCharacterizationPackage A) where
  interfaceConditions : Prop
  boundaryConditions : Prop
  transmissionConditions : Prop
  compatibilityConditions : Prop

structure InterfaceConditionsEvidence {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} (I : InterfaceConditionsPackage D) where
  interfaceConditionsClosed : I.interfaceConditions
  boundaryConditionsClosed : I.boundaryConditions
  transmissionConditionsClosed : I.transmissionConditions
  compatibilityConditionsClosed : I.compatibilityConditions

def InterfaceConditionsClosed {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} (I : InterfaceConditionsPackage D) : Prop :=
  I.interfaceConditions ∧ I.boundaryConditions ∧ I.transmissionConditions ∧ I.compatibilityConditions

theorem interface_conditions_closed_from_evidence {A : MixedTypeAdmittedObject} {D : DomainCharacterizationPackage A} (I : InterfaceConditionsPackage D) (E : InterfaceConditionsEvidence I) : InterfaceConditionsClosed I := by
  exact And.intro E.interfaceConditionsClosed (And.intro E.boundaryConditionsClosed (And.intro E.transmissionConditionsClosed E.compatibilityConditionsClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
