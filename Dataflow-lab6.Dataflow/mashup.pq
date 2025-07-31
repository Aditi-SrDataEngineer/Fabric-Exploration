[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "3311b742-3f58-4090-bb92-97cbf996f60f"]}[Data]{[lakehouseId = "4cb6e4e7-27d4-412a-8615-2f0353e7624a"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "orders_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "SalesOrderID", DestinationColumnName = "SalesOrderID"], [SourceColumnName = "OrderDate", DestinationColumnName = "OrderDate"], [SourceColumnName = "CustomerID", DestinationColumnName = "CustomerID"], [SourceColumnName = "LineItem", DestinationColumnName = "LineItem"], [SourceColumnName = "ProductID", DestinationColumnName = "ProductID"], [SourceColumnName = "OrderQty", DestinationColumnName = "OrderQty"], [SourceColumnName = "LineItemTotal", DestinationColumnName = "LineItemTotal"], [SourceColumnName = "MonthNo", DestinationColumnName = "MonthNo"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared orders = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/orders.csv"), [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type}, {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}),
  #"Added custom" = Table.TransformColumnTypes(Table.AddColumn(#"Changed column type", "MonthNo", each Date.Month([OrderDate])), {{"MonthNo", Int64.Type}})
in
  #"Added custom";
shared orders_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "3311b742-3f58-4090-bb92-97cbf996f60f"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "4cb6e4e7-27d4-412a-8615-2f0353e7624a"]}[Data],
  TableNavigation = Navigation_2{[Id = "orders", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
