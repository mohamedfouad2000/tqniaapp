class Lead {
  String? id;
  String? companyName;
  String? lastUpdate;
  String? type;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;
  String? createdDate;
  String? website;
  String? phone;
  String? currencySymbol;
  String? starredBy;
  String? groupIds;
  String? deleted;
  String? isLead;
  String? leadStatusId;
  String? ownerId;
  String? createdBy;
  String? sort;
  String? leadSourceId;
  String? lastLeadStatus;
  String? clientMigrationDate;
  String? vatNumber;
  String? currency;
  String? disableOnlinePayment;
  dynamic followDate;
  dynamic primaryContact;
  dynamic primaryContactId;
  dynamic contactAvatar;
  dynamic totalProjects;
  String? paymentReceived;
  dynamic cfv1;
  dynamic cfv15;
  dynamic cfv5;
  String? invoiceValue;
  dynamic clientGroups;
  String? leadStatusTitle;
  String? leadStatusColor;
  String? ownerName;
  String? ownerAvatar;
  dynamic lastNoteTitle;
  dynamic lastReachTitle;
  dynamic lastReachDate;
  String? note;
  String? region;
  String? industry;
  String? sourceTitle;

  Lead(
      {this.id,
      this.companyName,
      this.lastUpdate,
      this.type,
      this.address,
      this.city,
      this.state,
      this.zip,
      this.country,
      this.createdDate,
      this.website,
      this.phone,
      this.currencySymbol,
      this.starredBy,
      this.groupIds,
      this.deleted,
      this.isLead,
      this.leadStatusId,
      this.ownerId,
      this.createdBy,
      this.sort,
      this.leadSourceId,
      this.lastLeadStatus,
      this.clientMigrationDate,
      this.vatNumber,
      this.currency,
      this.disableOnlinePayment,
      this.followDate,
      this.primaryContact,
      this.primaryContactId,
      this.contactAvatar,
      this.totalProjects,
      this.paymentReceived,
      this.cfv1,
      this.cfv15,
      this.cfv5,
      this.invoiceValue,
      this.clientGroups,
      this.leadStatusTitle,
      this.leadStatusColor,
      this.ownerName,
      this.ownerAvatar,
      this.lastNoteTitle,
      this.lastReachTitle,
      this.lastReachDate,
      this.note,
      this.region,
      this.industry,
      this.sourceTitle});

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json['id'] as String?,
        companyName: json['company_name'] as String?,
        lastUpdate: json['last_update'] as String?,
        type: json['type'] as String?,
        address: json['address'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        zip: json['zip'] as String?,
        country: json['country'] as String?,
        createdDate: json['created_date'] as String?,
        website: json['website'] as String?,
        phone: json['phone'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        starredBy: json['starred_by'] as String?,
        groupIds: json['group_ids'] as String?,
        deleted: json['deleted'] as String?,
        isLead: json['is_lead'] as String?,
        leadStatusId: json['lead_status_id'] as String?,
        ownerId: json['owner_id'] as String?,
        createdBy: json['created_by'] as String?,
        sort: json['sort'] as String?,
        leadSourceId: json['lead_source_id'] as String?,
        lastLeadStatus: json['last_lead_status'] as String?,
        clientMigrationDate: json['client_migration_date'] as String?,
        vatNumber: json['vat_number'] as String?,
        currency: json['currency'] as String?,
        disableOnlinePayment: json['disable_online_payment'] as String?,
        followDate: json['follow_date'] as dynamic,
        primaryContact: json['primary_contact'] as dynamic,
        primaryContactId: json['primary_contact_id'] as dynamic,
        contactAvatar: json['contact_avatar'] as dynamic,
        totalProjects: json['total_projects'] as dynamic,
        paymentReceived: json['payment_received'] as String?,
        cfv1: json['cfv_1'] as dynamic,
        cfv15: json['cfv_15'] as dynamic,
        cfv5: json['cfv_5'] as dynamic,
        invoiceValue: json['invoice_value'] as String?,
        clientGroups: json['client_groups'] as dynamic,
        leadStatusTitle: json['lead_status_title'] as String?,
        leadStatusColor: json['lead_status_color'] as String?,
        ownerName: json['owner_name'] as String?,
        ownerAvatar: json['owner_avatar'] as String?,
        lastNoteTitle: json['last_note_title'] as dynamic,
        lastReachTitle: json['last_reach_title'] as dynamic,
        lastReachDate: json['last_reach_date'] as dynamic,
        note: json['note'] as dynamic,
        region: json['region'] as dynamic,
        industry: json['industry'] as dynamic,
        sourceTitle: json['source_title'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'note': note,
        'company_name': companyName,
        'last_update': lastUpdate,
        'type': type,
        'address': address,
        'city': city,
        'state': state,
        'zip': zip,
        'country': country,
        'created_date': createdDate,
        'website': website,
        'phone': phone,
        'currency_symbol': currencySymbol,
        'starred_by': starredBy,
        'group_ids': groupIds,
        'deleted': deleted,
        'is_lead': isLead,
        'lead_status_id': leadStatusId,
        'owner_id': ownerId,
        'created_by': createdBy,
        'sort': sort,
        'lead_source_id': leadSourceId,
        'last_lead_status': lastLeadStatus,
        'client_migration_date': clientMigrationDate,
        'vat_number': vatNumber,
        'currency': currency,
        'disable_online_payment': disableOnlinePayment,
        'follow_date': followDate,
        'primary_contact': primaryContact,
        'primary_contact_id': primaryContactId,
        'contact_avatar': contactAvatar,
        'total_projects': totalProjects,
        'payment_received': paymentReceived,
        'cfv_1': cfv1,
        'cfv_15': cfv15,
        'cfv_5': cfv5,
        'invoice_value': invoiceValue,
        'client_groups': clientGroups,
        'lead_status_title': leadStatusTitle,
        'lead_status_color': leadStatusColor,
        'owner_name': ownerName,
        'owner_avatar': ownerAvatar,
        'last_note_title': lastNoteTitle,
        'last_reach_title': lastReachTitle,
        'last_reach_date': lastReachDate,
        'region': region,
        'sourceTitle': sourceTitle,
      };
}
