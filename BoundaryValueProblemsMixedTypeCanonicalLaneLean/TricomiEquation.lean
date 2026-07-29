import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsMixedTypeCanonicalLaneLean

structure TricomiEquation where
  characteristicForm : Prop
  mixedTypeCondition : Prop
  boundaryData : Prop
  solutionRegularity : Prop

structure TricomiEquationPackage where
  equation : TricomiEquation
  characteristicCondition : equation.characteristicForm → Prop
  typeChange : equation.mixedTypeCondition → Prop
  dataCompatibility : equation.boundaryData → Prop
  smoothness : equation.solutionRegularity → Prop

structure TricomiEquationEvidence (P : TricomiEquationPackage) where
  characteristicConditionClosed : ∀ (h : P.equation.characteristicForm), P.characteristicCondition h
  typeChangeClosed : ∀ (h : P.equation.mixedTypeCondition), P.typeChange h
  dataCompatibilityClosed : ∀ (h : P.equation.boundaryData), P.dataCompatibility h
  smoothnessClosed : ∀ (h : P.equation.solutionRegularity), P.smoothness h

def TricomiEquationClosed (P : TricomiEquationPackage) : Prop :=
  (∀ (h : P.equation.characteristicForm), P.characteristicCondition h) ∧
  (∀ (h : P.equation.mixedTypeCondition), P.typeChange h) ∧
  (∀ (h : P.equation.boundaryData), P.dataCompatibility h) ∧
  (∀ (h : P.equation.solutionRegularity), P.smoothness h)

theorem tricomi_equation_closed_from_evidence (P : TricomiEquationPackage) (E : TricomiEquationEvidence P) :
    TricomiEquationClosed P := by
  exact And.intro E.characteristicConditionClosed
    (And.intro E.typeChangeClosed
      (And.intro E.dataCompatibilityClosed E.smoothnessClosed))

end BoundaryValueProblemsMixedTypeCanonicalLaneLean
end HautevilleHouse