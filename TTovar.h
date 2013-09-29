//---------------------------------------------------------------------------

#ifndef TTovarH
#define TTovarH
#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
class TPartner;
class TGroup;
class TTovar
{
public:
   __fastcall TTovar(int id);
   __fastcall TTovar(int id, int id_partner);
   __fastcall ~TTovar();
   void __fastcall Fill(int id);
   bool __fastcall Save();
   bool __fastcall Delete();
   __property int ID_Tovar = { read = GetID_Tovar, write = SetID_Tovar };
   __property float CinaZakup = { read = GetCinaZakup, write = SetCinaZakup };
   __property float CinaProdazh = { read = GetCinaProdazh, write = SetCinaProdazh };
   __property int ID_Partner = { read = GetID_Partner, write = SetID_Partner };
   __property int ID_Group = { read = GetID_Group, write = SetID_Group };
   __property float Ostatok = { read = GetOstatok, write = SetOstatok };
   __property AnsiString NameTovar = { read = GetNameTovar, write = SetNameTovar };
   __property TPartner * Partner = { read = GetPartner, write = SetPartner };
   __property TGroup * Group = { read = GetGroup, write = SetGroup };
   __property int KOD = { read = GetKOD, write = SetKOD };
private:
   int FID_Tovar;
   float FCinaZakup;
   float FCinaProdazh;
   int FID_Partner;
   int FID_Group;
   float FOstatok;
   AnsiString FNameTovar;
   TPartner * FPartner;
   TGroup * FGroup;
   int ID_Pokupec;
   int FKOD;
   void __fastcall SetID_Tovar(int value);
   int __fastcall GetID_Tovar();
   void __fastcall SetCinaZakup(float value);
   void __fastcall SetCinaProdazh(float value);
   void __fastcall SetID_Partner(int value);
   void __fastcall SetID_Group(int value);
   void __fastcall SetOstatok(float value);
   void __fastcall SetNameTovar(AnsiString value);
   float __fastcall GetCinaZakup();
   float __fastcall GetCinaProdazh();
   int __fastcall GetID_Partner();
   int __fastcall GetID_Group();
   float __fastcall GetOstatok();
   AnsiString __fastcall GetNameTovar();
   void __fastcall SetPartner(TPartner * value);
   TPartner * __fastcall GetPartner();
   void __fastcall SetGroup(TGroup * value);
   TGroup * __fastcall GetGroup();
   void __fastcall SetKOD(int value);
   int __fastcall GetKOD();
};
#endif
 