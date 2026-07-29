import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure RegularityPackage {O : MixedTypeOperatorPackage}
    {W : WeakFormulationPackage O} where
  solutionSpace : Type u
  interiorRegularity : Prop
  boundaryRegularity : Prop
  weightedSobolevEstimates : Prop
  cornerRegularity : Prop
  smoothnessUpToBoundary : Prop

structure RegularityEvidence {O : MixedTypeOperatorPackage}
    {W : WeakFormulationPackage O} (R : RegularityPackage O W) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  weightedSobolevEstimatesClosed : R.weightedSobolevEstimates
  cornerRegularityClosed : R.cornerRegularity
  smoothnessUpToBoundaryClosed : R.smoothnessUpToBoundary

def RegularityClosed {O : MixedTypeOperatorPackage}
    {W : WeakFormulationPackage O} (R : RegularityPackage O W) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.weightedSobolevEstimates ∧
  R.cornerRegularity ∧ R.smoothnessUpToBoundary

theorem regularity_closed_from_evidence {O : MixedTypeOperatorPackage}
    {W : WeakFormulationPackage O} (R : RegularityPackage O W)
    (E : RegularityEvidence R) : RegularityClosed R := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryRegularityClosed
      (And.intro E.weightedSobolevEstimatesClosed
        (And.intro E.cornerRegularityClosed E.smoothnessUpToBoundaryClosed)))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse