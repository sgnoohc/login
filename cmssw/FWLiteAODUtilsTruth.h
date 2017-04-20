#ifndef FWLiteAODUtilsTruth_h
#define FWLiteAODUtilsTruth_h

// FWLite
// #include ... " reco::GenParticle " #TODO

// ROOT
#include "TLorentzVector.h"

// C++
#include <stdlib.h>

namespace FwliteUtils
{
  void print_particle_column_header();
  void print_particle(const reco::GenParticle& p, unsigned int indent = 0);
  const reco::GenParticle& get_mother(const reco::GenParticle& p, unsigned int mother_idx);
  const reco::GenParticle& get_daughter(const reco::GenParticle& p, unsigned int daughter_idx);
  void print_mother(const reco::GenParticle& p, unsigned int mother_idx = 0);
  void print_daughter(const reco::GenParticle& p, unsigned int mother_idx = 0);
  void print_mothers_recursive(const reco::GenParticle& p, unsigned int indent = 0, int maxdepth = -1);
  void print_daughters_recursive(const reco::GenParticle& p, unsigned int indent = 0, int maxdepth = -1);
  void print_mothers(const reco::GenParticle& p);
  void print_daughters(const reco::GenParticle& p);
  TLorentzVector get_p4(const reco::GenParticle& p);
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_particle_column_header()
{
  std::cout << setw(10) << "pdgId ()" << ":";
  std::cout << setw(10) << "status()" << ":";
  std::cout << setw(15) << "pt    ()" << ":";
  std::cout << setw(15) << "eta   ()" << ":";
  std::cout << setw(15) << "phi   ()" << ":";
  std::cout << setw(15) << "energy()" << ":";
  std::cout << setw(15) << "mass  ()" << ":";
  std::cout << setw(15) << "NMothers  ()" << ":";
  std::cout << setw(15) << "NDaughters()" << ":";
  std::cout << std::endl;
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_particle(const reco::GenParticle& p, unsigned int indent)
{
  // Add an indent
  std::cout << setw(indent) << "";
  std::cout << setw(10) << p.pdgId () << ":";
  std::cout << setw(10) << p.status() << ":";
  std::cout << setw(15) << p.pt    () << ":";
  std::cout << setw(15) << p.eta   () << ":";
  std::cout << setw(15) << p.phi   () << ":";
  std::cout << setw(15) << p.energy() << ":";
  std::cout << setw(15) << p.mass  () << ":";
  std::cout << setw(15) << p.numberOfMothers  () << ":";
  std::cout << setw(15) << p.numberOfDaughters() << ":";
  std::cout << std::endl;
}

//________________________________________________________________________________________________________
//
const reco::GenParticle& FwliteUtils::get_mother(const reco::GenParticle& p, unsigned int mother_idx)
{
  if (p.numberOfMothers() > 0)
  {
    const reco::GenParticle& mother =
      (*dynamic_cast<const reco::GenParticle*>(p.mother(mother_idx)));
    return mother;
  }
  else
  {
    std::cout << "CRITICAL ERROR: Asked for a mother, when the particle has none." << std::endl;
    print_particle(p);
    abort();
  }
}

//________________________________________________________________________________________________________
//
const reco::GenParticle& FwliteUtils::get_daughter(const reco::GenParticle& p, unsigned int daughter_idx)
{
  if (p.numberOfMothers() > 0)
  {
    const reco::GenParticle& daughter =
      (*dynamic_cast<const reco::GenParticle*>(p.daughter(daughter_idx)));
    return daughter;
  }
  else
  {
    std::cout << "CRITICAL ERROR: Asked for a daughter, when the particle has none." << std::endl;
    print_particle(p);
    abort();
  }
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_mother(const reco::GenParticle& p, unsigned int mother_idx)
{
  // If it has a mother
  if (p.numberOfMothers() > 0)
  {
    // Retreive the mother
    const reco::GenParticle mother =
      (*dynamic_cast<const reco::GenParticle*>(p.mother(mother_idx)));

    // Print the mother particle
    print_particle(mother);
  }
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_daughter(const reco::GenParticle& p, unsigned int mother_idx)
{
  // If it has a mother
  if (p.numberOfMothers() > 0)
  {
    // Retreive the mother
    const reco::GenParticle mother =
      (*dynamic_cast<const reco::GenParticle*>(p.mother(mother_idx)));

    // Print the mother particle
    print_particle(mother);
  }
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_mothers_recursive(const reco::GenParticle& p, unsigned int indent, int maxdepth)
{
  // If it has a mother
  if (p.numberOfMothers() > 0)
  {

    // Loop over mothers
    for (unsigned int idx = 0; idx < p.numberOfMothers(); ++idx)
    {
      // Retreive the mother
      const reco::GenParticle mother =
        (*dynamic_cast<const reco::GenParticle*>(p.mother(idx)));

      // Print the mother particle
      print_particle(mother, indent);

      // Recursive print on the mother
      if (maxdepth < 0 || 2*maxdepth > indent)
        print_mothers_recursive(mother, indent + 2, maxdepth);

    }
  }
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_daughters_recursive(const reco::GenParticle& p, unsigned int indent, int maxdepth)
{
  // If it has a daughter
  if (p.numberOfDaughters() > 0)
  {

    // Loop over daughters
    for (unsigned int idx = 0; idx < p.numberOfDaughters(); ++idx)
    {
      // Retreive the daughter
      const reco::GenParticle daughter =
        (*dynamic_cast<const reco::GenParticle*>(p.daughter(idx)));

      // Print the daughter particle
      print_particle(daughter, indent);

      // Recursive print on the daughter upto the maxdepth
      if (maxdepth < 0 || 2*maxdepth > indent)
        print_daughters_recursive(daughter, indent + 2, maxdepth);

    }
  }
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_mothers(const reco::GenParticle& p)
{
  // print only the immediate mothers
  FwliteUtils::print_mothers_recursive(p, 0, 0);
}

//________________________________________________________________________________________________________
//
void FwliteUtils::print_daughters(const reco::GenParticle& p)
{
  // print only the immediate daughters
  FwliteUtils::print_daughters_recursive(p, 0, 0);
}

//________________________________________________________________________________________________________
//
TLorentzVector FwliteUtils::get_p4(const reco::GenParticle& p)
{
  TLorentzVector tlv;
  tlv.SetPtEtaPhiM(p.pt(), p.eta(), p.phi(), p.mass());
  return tlv;
}


#endif
