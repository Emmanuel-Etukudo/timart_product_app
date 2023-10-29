import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';
import 'package:http/http.dart' as http;

part 'database_model.g.dart';

// tables
const SqfEntityTable tableProducts = SqfEntityTable(
    tableName: 'products',
    primaryKeyName: 'id',
    useSoftDeleting: false,
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    fields: [
      SqfEntityField('name', DbType.text),
      SqfEntityField('quantity', DbType.integer),
      SqfEntityField('cost_price', DbType.real),
      SqfEntityField('selling_price', DbType.real),
    ]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

// database
@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'MyAppDatabaseModel',
    databaseName: 'product_manager',
    sequences: [seqIdentity],
    databaseTables: [tableProducts]);
