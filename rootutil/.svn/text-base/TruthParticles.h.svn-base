#ifndef TRUTHPARTICLES_H
#define TRUTHPARTICLES_H

#include <vector>
#include "Particle.h"

#ifdef STANDALONE
template <class T>
class TruthParticles
#else
template <class T>
class TruthParticles : public TObject
#endif
{
  public:
    //members
    Particle* mother;
    T* fModule;
    // const/dest
    TruthParticles(T* module = 0);
    virtual ~TruthParticles();
    // flag functions
    bool IsModuleSet();
    // I/O
    void Load();
    void Clear();
    void LoadAllParticles();
    void BuildParticleHierarchy();
    // utilities

#ifdef STANDALONE
    // ClassDef(TruthParticles, 1);
#else
    ClassDef(TruthParticles, 1);
#endif
};

#endif
