//---------------------------------------------------------------------------

#ifndef UserH
#define UserH
#include <Classes.hpp>
#include <DString.h>
//---------------------------------------------------------------------------
enum UserType {utAdmin=1, utUser=2};
class TUser
{
   private:
      AnsiString Login;
      AnsiString Password;
   public:
      __fastcall TUser(AnsiString Login, AnsiString Password);
      __fastcall ~TUser();
};
#endif
