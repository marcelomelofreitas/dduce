program DDuce.Demos;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  Vcl.SysStyles,
  MidasLib,
  Demo.Contact in 'Demo.Contact.pas',
  Demo.Data in 'Demo.Data.pas' {dmData: TDataModule},
  Demo.DDuce.DBGridView in 'Demo.DDuce.DBGridView.pas' {frmDBGridView},
  Demo.DDuce.DynamicRecord in 'Demo.DDuce.DynamicRecord.pas' {frmDynamicRecords},
  Demo.DDuce.PropertyInspector in 'Demo.DDuce.PropertyInspector.pas' {frmPropertyInspector},
  Demo.DDuce.Reflect in 'Demo.DDuce.Reflect.pas' {frmReflect},
  Demo.DDuce.ScopedReference in 'Demo.DDuce.ScopedReference.pas' {frmScopedReferences},
  Demo.DDuce.XMLTree in 'Demo.DDuce.XMLTree.pas' {frmXMLTree},
  Demo.Factories in 'Demo.Factories.pas',
  Demo.MainForm in 'Demo.MainForm.pas' {frmMainMenu},
  Demo.Manager in 'Demo.Manager.pas',
  Demo.Registration in 'Demo.Registration.pas',
  Demo.Utils in 'Demo.Utils.pas',
  Demo.DDuce.Logger in 'Demo.DDuce.Logger.pas' {frmLogger},
  Demo.DDuce.Inspector in 'Demo.DDuce.Inspector.pas' {frmInspector},
  Demo.DDuce.GridView in 'Demo.DDuce.GridView.pas' {frmGridView},
  Demo.DDuce.Editor in 'Demo.DDuce.Editor.pas' {frmEditor},
  Demo.Resources in 'Demo.Resources.pas',
  Demo.DDuce.VirtualTrees in 'Demo.DDuce.VirtualTrees.pas' {frmVirtualTrees},
  Demo.DDuce.ValueList in 'Demo.DDuce.ValueList.pas' {frmValueListDemo};

{$R *.res}

begin
  {$WARNINGS OFF}
  ReportMemoryLeaksOnShutdown := DebugHook > 0;
  {$WARNINGS ON}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterDemos;
  if DemoManager.ItemList.Count = 1 then
  begin
    DemoManager.Execute(DemoManager.ItemList.Single);
  end
  else
  begin
    Application.CreateForm(TfrmMainMenu, frmMainMenu);
  end;
  Application.Run;
end.
