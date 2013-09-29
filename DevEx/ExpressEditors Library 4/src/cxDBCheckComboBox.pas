
{********************************************************************}
{                                                                    }
{       Developer Express Visual Component Library                   }
{       ExpressEditors                                               }
{                                                                    }
{       Copyright (c) 1998-2003 Developer Express Inc.               }
{       ALL RIGHTS RESERVED                                          }
{                                                                    }
{   The entire contents of this file is protected by U.S. and        }
{   International Copyright Laws. Unauthorized reproduction,         }
{   reverse-engineering, and distribution of all or any portion of   }
{   the code contained in this file is strictly prohibited and may   }
{   result in severe civil and criminal penalties and will be        }
{   prosecuted to the maximum extent possible under the law.         }
{                                                                    }
{   RESTRICTIONS                                                     }
{                                                                    }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES            }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE     }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS    }
{   LICENSED TO DISTRIBUTE THE EXPRESSEDITORS AND ALL                }
{   ACCOMPANYING VCL CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY. }
{                                                                    }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED       }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE         }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE        }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT   }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                       }
{                                                                    }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON        }
{   ADDITIONAL RESTRICTIONS.                                         }
{                                                                    }
{********************************************************************}

unit cxDBCheckComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Graphics, cxControls, StdCtrls,
  Forms, Dialogs, 
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  cxEdit, cxDBEdit, cxCheckComboBox;

{$I cxExtEdVer.inc}

type
  { TcxDBCheckComboBox }
  TcxDBCheckComboBox = class(TcxCustomCheckComboBox)
  private
    function GetDataBinding: TcxDBEditDataBinding;
    procedure SetDataBinding(const Value: TcxDBEditDataBinding);
{$IFDEF VCL}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
{$ENDIF}
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  public
    property ItemIndex;
  published
    property DataBinding: TcxDBEditDataBinding
      read GetDataBinding write SetDataBinding;
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    {$IFDEF VCL}
    property DragCursor;
    property DragKind;
    {$ENDIF}
    property DragMode;
    property Enabled;
    {$IFDEF VCL}
    property ImeMode;
    property ImeName;
    {$ENDIF}
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
{$IFDEF VCL}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

{ TcxDBCheckComboBox }
function TcxDBCheckComboBox.GetDataBinding: TcxDBEditDataBinding;
begin
  Result := TcxDBEditDataBinding(FDataBinding);
end;

procedure TcxDBCheckComboBox.SetDataBinding(const Value: TcxDBEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

{$IFDEF VCL}
procedure TcxDBCheckComboBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(TcxDBEditDataBinding(DataBinding).DataLink);
end;
{$ENDIF}

class function TcxDBCheckComboBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBEditDataBinding;
end;
{ TcxDBCheckComboBox }

end.
