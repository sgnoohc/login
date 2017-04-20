#ifndef TRUTHPARTICLESSELECTOR_H
#define TRUTHPARTICLESSELECTOR_H

#include "TruthParticles.h"

#ifdef STANDALONE
template <class T>
class TruthParticlesSelector
#else
template <class T>
class TruthParticlesSelector : public TObject
#endif
{
  public:
    TruthParticlesSelector();
    virtual ~TruthParticlesSelector();
    TruthParticlesSelector<T>* GetWeaklyDecayingBHadrons(TruthParticles<T>* truths);

#ifdef STANDALONE
    // ClassDef(TruthParticlesSelector, 1);
#else
    ClassDef(TruthParticlesSelector, 1);
#endif
};

#endif
