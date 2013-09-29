//---------------------------------------------------------------------------


#pragma hdrstop

#include "User.h"

//---------------------------------------------------------------------------
__fastcall TUser::TUser(AnsiString Login, AnsiString Password)
{
   this->Login = Login;
   this->Password = Password;
}
//---------------------------------------------------------------------------
__fastcall TUser::~TUser()
{
}
//---------------------------------------------------------------------------

#pragma package(smart_init)
