
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

unit cxDBShellComboBox;

{$I cxExtEdVer.inc}

interface

uses
  Messages, Controls, cxDBEdit, cxEdit, cxShellComboBox;

type
  { TcxDBShellComboBox }

  TcxDBShellComboBox = class(TcxShellComboBox)
  private
    function GetDataBinding: TcxDBTextEditDataBinding;
    procedure SetDataBinding(Value: TcxDBTextEditDataBinding);
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    class function GetDataBindingClass: TcxEditDataBindingClass; override;
  published
    property Align;
    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property Constraints;
    property DataBinding: TcxDBTextEditDataBinding read GetDataBinding write SetDataBinding;
    property DragMode;
    property Enabled;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties;
    property ShellListView;
    property ShellTreeView;
    property ShowHint;
    property Style;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property DragCursor;
    property DragKind;
    property ImeMode;
    property ImeName;
    property OnClick;
{$IFDEF DELPHI5}
    property OnContextPopup;
{$ENDIF}
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
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
    property OnEndDock;
    property OnStartDock;
  end;

implementation

{ TcxDBShellComboBox }

class function TcxDBShellComboBox.GetDataBindingClass: TcxEditDataBindingClass;
begin
  Result := TcxDBTextEditDataBinding;
end;

function TcxDBShellComboBox.GetDataBinding: TcxDBTextEditDataBinding;
begin
  Result := FDataBinding as TcxDBTextEditDataBinding;
end;

procedure TcxDBShellComboBox.SetDataBinding(Value: TcxDBTextEditDataBinding);
begin
  FDataBinding.Assign(Value);
end;

procedure TcxDBShellComboBox.CMGetDataLink(var Message: TMessage);
begin
  if DataBinding <> nil  then
    Message.Result := Integer(DataBinding.DataLink);
end;

end.
