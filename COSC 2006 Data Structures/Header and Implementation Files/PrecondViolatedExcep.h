//  Created by Frank M. Carrano and Timothy M. Henry.
//  Copyright (c) 2017 Pearson Education, Hoboken, New Jersey.

/** Listing 7-5.
    @file PrecondViolatedExcep.h */

#ifndef PRECOND_VIOLATED_EXCEP_
#define PRECOND_VIOLATED_EXCEP_

#include <stdexcept>
#include <string>

class PrecondViolatedExcep : public std::logic_error
{
public:
   PrecondViolatedExcep(const std::string& message = "");
}; // end PrecondViolatedExcep 
#endif
