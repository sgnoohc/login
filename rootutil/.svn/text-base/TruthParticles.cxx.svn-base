#include "TruthParticles.h"

template <class T>
TruthParticles<T>::TruthParticles(T* module)
{
  mother = new Particle();
  fModule = module;
}

template <class T>
TruthParticles<T>::~TruthParticles()
{
}

template <class T>
bool TruthParticles<T>::IsModuleSet()
{
  return fModule;
}

template <class T>
void TruthParticles<T>::Load()
{
  Clear();
  LoadAllParticles();
  BuildParticleHierarchy();
}

template <class T>
void TruthParticles<T>::Clear()
{
  mother->ClearVec();
}

template <class T>
void TruthParticles<T>::LoadAllParticles()
{
  if (!IsModuleSet())
    return;

  if (!mother->Exists("truths"))
    mother->AddVec("truths");

  for (int iparticle = 0; iparticle < fModule->mc_n; ++iparticle)
  {
    Particle* particle = new Particle();
    float pt  = fModule->mc_pt->at(iparticle);
    float eta = fModule->mc_eta->at(iparticle);
    float phi = fModule->mc_phi->at(iparticle);
    float m   = fModule->mc_m->at(iparticle);
    int pdgid = fModule->mc_pdgId->at(iparticle);
    float charge = fModule->mc_charge->at(iparticle);
    particle->p.SetPtEtaPhiM(pt, eta, phi, m);
    particle->Set("pdgId", pdgid);
    particle->Set("charge", charge);
    mother->Add("truths", particle);
  }
}

template <class T>
void TruthParticles<T>::BuildParticleHierarchy()
{
  if (!IsModuleSet())
    return;

  for (int iparticle = 0; iparticle < mother->NObjs("truths"); ++iparticle)
  {
    Particle* particle = mother->Obj("truths", iparticle);
    particle->AddVec("child");
    for (unsigned int ichild = 0; ichild < fModule->mc_child_index->at(iparticle).size(); ++ichild)
    {
      int index = fModule->mc_child_index->at(iparticle).at(ichild);
      particle->Add("child", mother->Obj("truths", index));
    }
  }
}
