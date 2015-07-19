program DDuce.Demos;

uses
  Vcl.Forms,
  Demo.Contact in 'Demo.Contact.pas',
  Demo.Data in 'Demo.Data.pas' {dmData: TDataModule},
  Demo.DDuce.DBGridView in 'Demo.DDuce.DBGridView.pas' {frmDBGridView},
  Demo.DDuce.DynamicRecord in 'Demo.DDuce.DynamicRecord.pas' {frmDynamicRecords},
  Demo.DDuce.ListDataSet in 'Demo.DDuce.ListDataSet.pas' {frmListDataSet},
  Demo.DDuce.PropertyInspector in 'Demo.DDuce.PropertyInspector.pas' {frmPropertyInspector},
  Demo.DDuce.Reflect in 'Demo.DDuce.Reflect.pas' {frmReflect},
  Demo.DDuce.ScopedReference in 'Demo.DDuce.ScopedReference.pas' {frmScopedReferences},
  Demo.DDuce.VirtualDBGrid in 'Demo.DDuce.VirtualDBGrid.pas' {frmVirtualDBGrid},
  Demo.DDuce.XMLTree in 'Demo.DDuce.XMLTree.pas' {frmXMLTree},
  Demo.Factories in 'Demo.Factories.pas',
  Demo.Helpers in 'Demo.Helpers.pas',
  Demo.MainForm in 'Demo.MainForm.pas' {frmMainMenu},
  Demo.Manager in 'Demo.Manager.pas',
  Demo.Registration in 'Demo.Registration.pas',
  Demo.Utils in 'Demo.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  RegisterDemos;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.Run;
end.