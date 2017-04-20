#include "Particle.h"

Particle::Particle()
{
  objs.clear();
}

Particle::~Particle()
{
  std::map<TString, std::vector<Particle*>* >::iterator it;
  for (it = objs.begin(); it != objs.end(); ++it)
  {
    if (it->second)
      delete (it->second);
  }
  objs.clear();
}

int Particle::NObjs(TString objname)
{
  if (!Exists(objname))
  {
    printf("Particle::NObjs() the key %s does not exist for this particle\n", objname.Data());
    return -1;
  }
  return (int) objs[objname]->size();
}

bool Particle::Exists(TString objname)
{
  //std::cout << "objs size " << objs.size() << " objname " << objname << std::endl;
  if (objs.find(objname) == objs.end())
    return false;
  else
    return true;
}

void Particle::Add(TString objname, Particle* particle)
{
  if (!Exists(objname))
  {
    printf("Particle::Add() the key %s does not exist for this particle\n", objname.Data());
    return;
  }
  if (std::find(objs[objname]->begin(), objs[objname]->end(), particle) == objs[objname]->end())
  {
    objs[objname]->push_back(particle);
  }
}

void Particle::AddVec(TString objname)
{
  if (Exists(objname))
  {
    printf("Particle::AddVec() the key %s already exist for this particle\n", objname.Data());
    return;
  }
  objs[objname] = new std::vector<Particle*>();
}

void Particle::ClearVec(TString objname)
{
  if (!Exists(objname))
  {
    printf("Particle::ClearVec() the key %s does not exist for this particle\n", objname.Data());
    return;
  }
  objs[objname]->clear();
  delete objs[objname];
}

void Particle::ClearVec()
{
  std::map<TString, std::vector<Particle* >* >::iterator it;
  for (it = objs.begin(); it != objs.end(); ++it)
  {
    ClearVec(it->first);
  }
  objs.clear();
}

Particle* Particle::Obj(TString objname, int index)
{
  if (!Exists(objname))
  {
    printf("Particle::Obj() the key %s does not exist for this particle\n", objname.Data());
    return 0;
  }
  return objs[objname]->at(index);
}


