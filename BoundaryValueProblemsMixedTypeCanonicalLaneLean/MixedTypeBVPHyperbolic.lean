import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure HyperbolicComponentPackage where
  waveOperator : Prop
  characteristicSurface : Prop
  initialDataSmooth : Prop
  finiteSpeedPropagation : Prop

structure HyperbolicComponentEvidence (H : HyperbolicComponentPackage) where
  waveOperatorClosed : H.waveOperator
  characteristicSurfaceClosed : H.characteristicSurface
  initialDataSmoothClosed : H.initialDataSmooth
  finiteSpeedPropagationClosed : H.finiteSpeedPropagation

def HyperbolicComponentClosed (H : HyperbolicComponentPackage) : Prop :=
  H.waveOperator ∧ H.characteristicSurface ∧ H.initialDataSmooth ∧ H.finiteSpeedPropagation

theorem hyperbolic_component_closed_from_evidence
    (H : HyperbolicComponentPackage) (E : HyperbolicComponentEvidence H) :
    HyperbolicComponentClosed H := by
  exact And.intro E.waveOperatorClosed
    (And.intro E.characteristicSurfaceClosed
      (And.intro E.initialDataSmoothClosed E.finiteSpeedPropagationClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse
