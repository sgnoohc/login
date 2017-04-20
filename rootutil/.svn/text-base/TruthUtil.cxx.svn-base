#include "TruthUtil.h"

template <typename T>
void TruthUtil::GetWeaklyDecayingBHadrons(T* truths)
{
  if (truths->mother->Exists("truthWeaklyDecayingBHadrons"))
    return;
  truths->mother->AddVec("truthWeaklyDecayingBHadrons");
  for (int itruth = 0; itruth < truths->mother->NObjs("truths"); ++itruth)
  {
    Particle* particle = truths->mother->Obj("truths", itruth);
    if (IsWeaklyDecayingBHadrons(particle->Int("pdgId")))
      truths->mother->Add("truthWeaklyDecayingBHadrons", particle);
  }
  return;
}

bool TruthUtil::IsWeaklyDecayingBHadrons(int pdgid)
{
  int abs_mc_pdgId = abs(pdgid);
  //if(abs_mc_pdgId==2224)
  //  return true;
  if( abs_mc_pdgId==511  || abs_mc_pdgId==521  || abs_mc_pdgId==531  || abs_mc_pdgId==541  ||
      abs_mc_pdgId==5112 || abs_mc_pdgId==5122 || abs_mc_pdgId==5132 || abs_mc_pdgId==5142 ||
      abs_mc_pdgId==5212 || abs_mc_pdgId==5222 || abs_mc_pdgId==5232 || abs_mc_pdgId==5242 ||
      abs_mc_pdgId==5332)
    return false;
  if (abs_mc_pdgId > 100)
    return true;
  else
    return false;
  //  return true;
  //return false;
}

void TruthUtil::GetDecayProducts(Particle* p, Particle* parent)
{
  if (!p)
    return;
  if (p->Exists("DecayProducts"))
    return;
  if (p->Exists("ChargedDecayProducts"))
    return;
  if (!parent)
  {
    parent = p;
    parent->AddVec("DecayProducts");
    parent->AddVec("ChargedDecayProducts");
  }
  for (int ichild = 0; ichild < p->NObjs("child"); ++ ichild)
  {
    Particle* child = p->Obj("child", ichild);
    if (IsFinalStateParticle(child))
    {
      parent->Add("DecayProducts", child);
      if (child->Float("charge") != 0)
        parent->Add("ChargedDecayProducts", child);
    }
    else
      GetDecayProducts(child, parent);
  }
  if (parent == p)
  {
    Particle* sumcdp = new Particle();
    Particle* sumdp = new Particle();
    for (int icdp = 0; icdp < parent->NObjs("ChargedDecayProducts"); ++icdp)
    {
      sumcdp->p += parent->Obj("ChargedDecayProducts", icdp)->p;
    }
    for (int idp = 0; idp < parent->NObjs("DecayProducts"); ++idp)
    {
      sumdp->p += parent->Obj("DecayProducts", idp)->p;
    }
    parent->AddVec("ChargedDecayProductsSum");
    parent->Add("ChargedDecayProductsSum", sumcdp);
    parent->AddVec("DecayProductsSum");
    parent->Add("DecayProductsSum", sumdp);
  }
}

bool TruthUtil::IsFinalStateParticle(Particle* p)
{
  if (!p->Exists("child"))
    return true;
  if (!p->NObjs("child"))
    return true;
  return false;
}
