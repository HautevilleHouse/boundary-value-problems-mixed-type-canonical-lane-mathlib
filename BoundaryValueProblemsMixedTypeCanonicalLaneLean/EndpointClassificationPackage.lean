import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure EndpointClassificationPackage {O : MixedTypeOperatorPackage}
    {B : BoundaryDataPackage} {W : WeakFormulationPackage O}
    {R : RegularityPackage O W} where
  wellPosedOutcome : Prop
  spectralProperties : Prop
  solvabilityCriteria : Prop
  continuousDependence : Prop
  endpointGuarantee : Prop

structure EndpointClassificationEvidence {O : MixedTypeOperatorPackage}
    {B : BoundaryDataPackage} {W : WeakFormulationPackage O}
    {R : RegularityPackage O W} (E : EndpointClassificationPackage O B W R) where
  wellPosedOutcomeClosed : E.wellPosedOutcome
  spectralPropertiesClosed : E.spectralProperties
  solvabilityCriteriaClosed : E.solvabilityCriteria
  continuousDependenceClosed : E.continuousDependence
  endpointGuaranteeClosed : E.endpointGuarantee

def EndpointClassificationClosed {O : MixedTypeOperatorPackage}
    {B : BoundaryDataPackage} {W : WeakFormulationPackage O}
    {R : RegularityPackage O W} (E : EndpointClassificationPackage O B W R) : Prop :=
  E.wellPosedOutcome ∧ E.spectralProperties ∧ E.solvabilityCriteria ∧
  E.continuousDependence ∧ E.endpointGuarantee

theorem endpoint_classification_closed_from_evidence
    {O : MixedTypeOperatorPackage} {B : BoundaryDataPackage}
    {W : WeakFormulationPackage O} {R : RegularityPackage O W}
    (E : EndpointClassificationPackage O B W R)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.wellPosedOutcomeClosed
    (And.intro Ev.spectralPropertiesClosed
      (And.intro Ev.solvabilityCriteriaClosed
        (And.intro Ev.continuousDependenceClosed Ev.endpointGuaranteeClosed)))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse