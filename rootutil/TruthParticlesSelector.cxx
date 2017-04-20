#include "TruthParticlesSelector.h"

template <class T>
TruthParticlesSelector<T>::TruthParticlesSelector()
{
}

template <class T>
TruthParticlesSelector<T>::~TruthParticlesSelector()
{
}

template <class T>
TruthParticles<T>* TruthParticlesSelector<T>::GetWeaklyDecayingBHadrons(TruthParticles<T>* truths)
{
  for (int itruth = 0; itruth < truths->mother->NObjs("truths"); ++itruth)
  {
    Particle* particle = truths->mother->Obj("truths", itruth);
    particle->Int("pdgId");
  }
}

// eof
