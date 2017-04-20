#ifndef PARTICLE_H
#define PARTICLE_H

#include "TObject.h"
#include "TLorentzVector.h"
#include <map>
#include <vector>
#include <stdlib.h>
#include <algorithm>
#include <iostream>

#ifdef STANDALONE
class Particle
#else
class Particle : public TObject
#endif
{
  public:
    TLorentzVector p;
    std::map<TString, std::vector<Particle*>* > objs;
    std::map<TString, int> ints;
    std::map<TString, bool> bools;
    std::map<TString, float> floats;

    Particle();
    virtual ~Particle();
    int NObjs(TString objname);
    bool Exists(TString objname);
    void Add(TString objname, Particle* particle);
    void AddVec(TString objname);
    void ClearVec();
    void ClearVec(TString objname);
    Particle* Obj(TString objname, int index);

    // properties
    void Set(TString key, int val)   { ints[key] = val; }
    void Set(TString key, bool val)  { bools[key] = val; }
    void Set(TString key, float val) { floats[key] = val; }
    bool IntExists(TString key)   { if (ints.find(key) == ints.end())     return false; else return true; }
    bool BoolExists(TString key)  { if (bools.find(key) == bools.end())   return false; else return true; }
    bool FloatExists(TString key) { if (floats.find(key) == floats.end()) return false; else return true; }
    int   Int(TString key)   { if (IntExists(key))   {return ints[key];}   else {printf("Int() key %s does not exists\n", key.Data()); abort();} }
    bool  Bool(TString key)  { if (BoolExists(key))  {return bools[key];}  else {printf("Int() key %s does not exists\n", key.Data()); abort();} }
    float Float(TString key) { if (FloatExists(key)) {return floats[key];} else {printf("Int() key %s does not exists\n", key.Data()); abort();} }

#ifdef STANDALONE
    //ClassDef(Particle, 1);
#else
    ClassDef(Particle, 1);
#endif
};

#endif
