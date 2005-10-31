/***************************************************************************
                              logical_inv.cpp
                             -----------------
    begin                : Wed Sep 28 2005
    copyright            : (C) 2005 by Michael Margraf
    email                : michael.margraf@alumni.tu-berlin.de
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include <stdlib.h>

#include "logical_inv.h"
#include "qucsdoc.h"
#include "node.h"

Logical_Inv::Logical_Inv()
{
  Type = isComponent;   // both analog and digital
  Description = QObject::tr("logical inverter");

  // the list order must be preserved !!!
  Props.append(new Property("V", "1 V", false,
		QObject::tr("voltage of high level")));
  Props.append(new Property("t", "0", false,
		QObject::tr("delay time")));

  // this must be the last property in the list !!!
  Props.append(new Property("Symbol", "old", false,
		QObject::tr("schematic symbol")+" [old, DIN40900]"));

  createSymbol();
  tx = x1+4;
  ty = y2+4;
  Model = "Inv";
  Name  = "Y";
}

// -------------------------------------------------------
QString Logical_Inv::VHDL_Code()
{
  if(!isActive) return QString("");   // should it be simulated ?

  QString s = "  " + Ports.getLast()->Connection->Name + " <= not " +
              Ports.getFirst()->Connection->Name;

  if(strtod(Props.at(1)->Value.latin1(), 0) != 0.0)  // delay time
    s += " after " + Props.current()->Value;

  s += ';';
  return s;
}

// -------------------------------------------------------
void Logical_Inv::createSymbol()
{
  int xr;

  if(Props.getLast()->Value.at(0) == 'D') {  // DIN symbol
    Lines.append(new Line( 15,-20, 15, 20,QPen(QPen::darkBlue,2)));
    Lines.append(new Line(-15,-20, 15,-20,QPen(QPen::darkBlue,2)));
    Lines.append(new Line(-15, 20, 15, 20,QPen(QPen::darkBlue,2)));
    Lines.append(new Line(-15,-20,-15, 20,QPen(QPen::darkBlue,2)));

    Texts.append(new Text(-11,-17, "1", QPen::darkBlue, 15.0));
    xr =  15;
  }
  else {   // old symbol
    Lines.append(new Line(-10,-20,-10,20, QPen(QPen::darkBlue,2)));
    Arcs.append(new Arc(-30,-20, 40, 30,  0, 16*90,QPen(QPen::darkBlue,2)));
    Arcs.append(new Arc(-30,-10, 40, 30,  0,-16*90,QPen(QPen::darkBlue,2)));
    Lines.append(new Line( 10,-5, 10, 5,QPen(QPen::darkBlue,2)));
    xr =  10;
  }

  Ellips.append(new Area(xr,-4, 8, 8,
                QPen(QPen::darkBlue,0), QBrush(QPen::darkBlue)));

  Lines.append(new Line( xr, 0, 30, 0, QPen(QPen::darkBlue,2)));
  Lines.append(new Line(-30, 0,-xr, 0, QPen(QPen::darkBlue,2)));
  Ports.append(new Port(-30, 0));
  Ports.append(new Port( 30, 0));

  x1 = -30; y1 = -23;
  x2 =  30; y2 =  23;
}

// -------------------------------------------------------
Component* Logical_Inv::newOne()
{
  Logical_Inv* p = new Logical_Inv();
  p->Props.getLast()->Value = Props.getLast()->Value;
  p->recreate(0);
  return p;
}

// -------------------------------------------------------
Element* Logical_Inv::info(QString& Name, char* &BitmapFile, bool getNewOne)
{
  Name = QObject::tr("Inverter");
  BitmapFile = "inverter";

  if(getNewOne)  return new Logical_Inv();
  return 0;
}

// -------------------------------------------------------
void Logical_Inv::recreate(QucsDoc *Doc)
{
  if(Doc) {
    Doc->Comps->setAutoDelete(false);
    Doc->deleteComp(this);
  }

  Ellips.clear();
  Ports.clear();
  Lines.clear();
  Texts.clear();
  Arcs.clear();
  createSymbol();
  performModification();  // rotate and mirror

  if(Doc) {
    Doc->insertRawComponent(this);
    Doc->Comps->setAutoDelete(true);
  }
}
