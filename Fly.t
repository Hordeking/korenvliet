#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

/*
 *   New action: fly
 */
DefineTAction(Fly);
VerbRule(Fly)
  ('fly') singleDobj
  : FlyAction
  verbPhrase = 'fly/flying (what)'
;

modify Thing
  dobjFor(Fly)
  {
    preCond = [touchObj]
    verify() { illogical(cannotFlyMsg); }
  }
  cannotFlyMsg = '{That dobj/he} {is} not something {you/he} can fly. '
;
