import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure MixedTypeBVPObliqueDerivative where
  domain : Type u
  boundaryOperator : Type v
  ellipticityCondition : Prop
  obliquenessCondition : Prop
  boundaryOperatorSmooth : Prop
  signCondition : Prop

structure MixedTypeBVPObliqueDerivativeEvidence (O : MixedTypeBVPObliqueDerivative) where
  ellipticityConditionClosed : O.ellipticityCondition
  obliquenessConditionClosed : O.obliquenessCondition
  boundaryOperatorSmoothClosed : O.boundaryOperatorSmooth
  signConditionClosed : O.signCondition

def MixedTypeBVPObliqueDerivativeClosed (O : MixedTypeBVPObliqueDerivative) : Prop :=
  O.ellipticityCondition ∧ O.obliquenessCondition ∧ O.boundaryOperatorSmooth ∧ O.signCondition

theorem mixed_type_bvp_oblique_derivative_closed_from_evidence
    (O : MixedTypeBVPObliqueDerivative) (E : MixedTypeBVPObliqueDerivativeEvidence O) :
    MixedTypeBVPObliqueDerivativeClosed O := by
  exact And.intro E.ellipticityConditionClosed
    (And.intro E.obliquenessConditionClosed
      (And.intro E.boundaryOperatorSmoothClosed E.signConditionClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse