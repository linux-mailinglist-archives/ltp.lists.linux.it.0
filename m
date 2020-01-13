Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB7813A7AC
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 11:45:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 386C93C2391
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 11:45:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 6027F3C144F
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 14:40:37 +0100 (CET)
Received: from m4a0072g.houston.softwaregrp.com
 (m4a0072g.houston.softwaregrp.com [15.124.2.130])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B2C0160098B
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 14:40:34 +0100 (CET)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 13 Jan 2020 13:39:22 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 13 Jan 2020 13:30:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 13 Jan 2020 13:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+b3oPfwWjHOG3qiqzNkbIIv6UEvfnn1gq1TyTQCjWO1RHiBETILnq+mLPg2onPm6fCAK//DlfypomYA165Qr6MBWl7wLrQ+h2pvBpa/QEBKPlmz0kylE/oG1BWBv9aO96S905fcnXHL9dqNUVDXDhkld7RMjikS+erE1YjOlS2PLddzOx+BFr2gAy/ZuzQ1RQBT1NXE8bPJk2OFGMpHftOfgy/JkBkX9nIFUE5SiJfNxCobCJWWtNxYIFlGUk6b+3mdB4FgYON63vzrYgvXxSFqjK7C3YwcNiyI+0ZJAZyGG+UPERPHPm9yHOllVYkP6VCz0Ih4E3ixnDp2AwmWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7jFKOMq+5AfJvKRSgMMA1CJu0O1USlIaeGgLvLKkhE=;
 b=TURq8SqmO3KWUJztdtU07+QkHl/jpTOnATihlWlSCm/ppZQy0xLpgCcGXKX1hsTwRa1RnpTpCd66kIo6yNyMVUu/rQTbhVnawWLCUIutewvnvB+h/BlS53hodWE3ncEU93lyb2r7oNTu2tNX0G+qZ/j6bdIMHjmsS9cAQcucEnJDU6vdhS8tYOxGgt2Javlf59V2/zLmSEgIATAUWscm9RIPp1fRLd6Yz7uocK2XFgawppeY20lQ3rMkVjsRQBWqpxvbvL12yhJszPuIDJR4J3Chj5K20FC/2CfP9ILxk1WSs8p/Fe3o/xilQ68dCE3eC/i4qRppPBE5T0o18GdnuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) by
 BY5PR18MB3155.namprd18.prod.outlook.com (10.255.136.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 13:30:08 +0000
Received: from BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::d948:61b9:971a:facd]) by BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::d948:61b9:971a:facd%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 13:30:08 +0000
Received: from [0.0.0.0] (149.28.201.231) by
 BY5PR17CA0002.namprd17.prod.outlook.com (2603:10b6:a03:1b8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.8 via Frontend
 Transport; Mon, 13 Jan 2020 13:30:06 +0000
From: Qu WenRuo <wqu@suse.com>
To: Martin Doucha <mdoucha@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v3] Use real FS block size in fallocate05
Thread-Index: AQHVxXJJ6l/rplC/DkOXFzboq1vPWKfoi6WAgAAQxwCAAAKLAIAAAUOA
Date: Mon, 13 Jan 2020 13:30:08 +0000
Message-ID: <6a4aae16-57eb-9a1d-fd64-af84d5c8cdb3@suse.com>
References: <461386048.17251961.1576663655809.JavaMail.zimbra@redhat.com>
 <20191218131533.15323-1-mdoucha@suse.cz> <20200107152108.GA27182@rei.lan>
 <6f2c4482-9a8f-1b14-be18-10b486576f13@suse.cz>
 <e684c55a-5973-af77-ff24-2dfc6a1f67b1@suse.cz>
 <4da4e1ec-d5dc-06e2-bea8-280533f5d022@suse.com>
 <f3211331-b7ec-4d14-7f3b-d8fb5c72c1fe@suse.cz>
In-Reply-To: <f3211331-b7ec-4d14-7f3b-d8fb5c72c1fe@suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To BY5PR18MB3266.namprd18.prod.outlook.com
 (2603:10b6:a03:1a1::15)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [149.28.201.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73044214-a027-481c-a5c7-08d7982cb516
x-ms-traffictypediagnostic: BY5PR18MB3155:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB31559C2CBE1083FE52EBFF21D6350@BY5PR18MB3155.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(86362001)(54906003)(5660300002)(6486002)(6706004)(31686004)(316002)(16576012)(110136005)(4326008)(478600001)(26005)(2906002)(186003)(16526019)(956004)(53546011)(2616005)(66446008)(107886003)(81166006)(81156014)(8676002)(66556008)(36756003)(31696002)(8936002)(66946007)(66476007)(64756008)(52116002)(71200400001)(78286006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3155;
 H:BY5PR18MB3266.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lclt+jy/OvLlQmSOxvNLrskdszICUkuWzEaDPw9xsV9X33jOPzezkZ9oH5oQLdTNgq1fRNfaQgBrrX72BarM/o8s9Am43cK5mlcxrU/QYUYl1dn4gJa6kc12f4g3T9pWzPByBBs2k3mjlmJRSYPpus0XAI0vH+FOf4DyTt4NkzOfGeBp5WeUpcKm6wRpbYtDMwYpL/ElbCVdMujL3Mqw/t+Iu8g4tji9HlqnvvPn/balv6wxsfYbn6oY8zuPu9GGZmol/jGMknZbl7rplHrDySGuq/+GBnkgxfJ/RRi3LYy3J3wULN7t/O+6r0qUV+B8/MArncCNRMYvn61UKMO+AArvuIBnQnKEEVGY3p0AwHsOixV51Ie4LHe8RE9qhmdheAG/YrL+ikqscT6EXzlfSQdH1FA8aaWdFtpE1Ba3qMjlAh2lI6dZSIdjFGVAM0RXPn8Of9kqiFXZBTouf3O6BU9KpO66YVKgFbwjJZdVkib3tdhjr3Sinfc/ueMslYTh
Content-ID: <355558A2C7CF044CA16A89BC7EEA2972@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73044214-a027-481c-a5c7-08d7982cb516
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 13:30:08.1886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdYDMm9q7M1aokERorCiIQeObOl/INmL0L1eb2/OTA4lH7ryZXNqxfvlRmKk2QRu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3155
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 14 Jan 2020 11:44:56 +0100
Subject: Re: [LTP] [PATCH v3] Use real FS block size in fallocate05
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: David Sterba <DSterba@suse.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNCk9uIDIwMjAvMS8xMyDkuIvljYg5OjI1LCBNYXJ0aW4gRG91Y2hhIHdyb3RlOg0KPiBPbiAx
LzEzLzIwIDI6MTYgUE0sIFF1IFdlblJ1byB3cm90ZToNCj4+IEp1c3QgYSBzbWFsbCB0aXAsIGJ0
cmZzIGRlZmF1bHRzIHRvIGRhdGEgQ29XLCBhbmQgdW5saWtlIG90aGVyIENvVyBmcw0KPj4gKGxp
a2UgeGZzKSwgYnRyZnMgaGFzIGFuIGV4dGVudCBib29raW5nIGJlaGF2aW9yLCB0aGF0IGV2ZW4g
b25seSBwYXJ0IG9mDQo+PiBhIGxhcmdlIGV4dGVudCAoZS5nIDEyOE1pQikgaXMgcmVmZXJyZWQs
IHRoZSB3aG9sZSBleHRlbnQgd2lsbCBub3QgYmUgZnJlZWQuDQo+IA0KPiBJIGtub3csIEkgcmVw
b3J0ZWQgdGhlIGJ1ZyB3aGVyZSB3ZSBkaXNjdXNzZWQgdGhpcy4NCj4gDQo+Pj4+IFdoYXQncyB0
aGUgbWluaW11bSBibG9jayBkZXZpY2Ugc2l6ZQ0KPj4+PiB3aGVyZSBCdHJmcyB3aWxsIHVzZSB0
aGUgc2FtZSBjb2RlIHBhdGhzIGFzIGluIHJlYWwtd29ybGQgdXNlIGNhc2VzPw0KPj4NCj4+IE1r
ZnMuYnRyZnMgbm8gbG9uZ2VyIGVuYWJsZXMgLS1taXhlZCBmb3Igc21hbGwgZnMuDQo+Pg0KPj4g
QnV0IGJ0cmZzIHN0aWxsIGhhcyBhIHByZXR0eSBjb21wbGV4IG1pbmltYWwgZGV2aWNlIHNpemUs
IGl0IGRlcGVuZHMgb24NCj4+IHByb2ZpbGUgKC1tIGFuZCAtZCBvcHRpb25zKS4NCj4+DQo+PiBJ
ZiBMVFAgZ3V5cyB3YW50IHRvIGJlIHNhZmUgZm9yIHNpbmdsZSBkZXZpY2UsIGl0IG5lZWRzIDI1
Nk1pQiBmb3INCj4+IGBta2ZzLmJ0cmZzIC1tIGR1cCAtZCBkdXBgIHRvIHJ1biBzdWNjZXNzZnVs
bHkuDQo+Pg0KPj4gSWYgb25seSBkZWZhdWx0IGNhc2UgKC1tIGR1cCAtZCBzaW5nbGUpIGlzIG5l
ZWRlZCwgdGhlbiAxMjhNaUIgaXMgZW5vdWdoLg0KPiANCj4gU29ycnkgYnV0IG15IHF1ZXN0aW9u
IHdhcyBub3QgYWJvdXQgdGhlIG1pbmltdW0gZm9yIG1rZnMuIE15IHF1ZXN0aW9uDQo+IHdhcyBh
Ym91dCB0aGUgbWluaW11bSBkZXZpY2Ugc2l6ZSBzbyB0aGF0IHRoZSBrZXJuZWwgZHJpdmVyIHdp
bGwgdXNlIHRoZQ0KPiBzYW1lIGJsb2NrIGFsbG9jYXRpb24gbG9naWMgYXMgb24gYSAxMDBHQisg
cGFydGl0aW9uIChpbnN0ZWFkIG9mIHNvbWUNCj4gc3BlY2lhbCBjYXNlIGFsbG9jYXRpb24gbG9n
aWMgZm9yIHRpbnkgYmxvY2sgZGV2aWNlcykuDQoNClRoZW4gdGhlIG1lYW5pbmdmdWwgYm91bmRh
cnkgaXMgNTBHLg0KDQpTbWFsbGVyIDUwRywgbWV0YWRhdGEgY2h1bmsgaXMgbGltaXRlZCB0byAy
NTZNLCBvdGhlcndpc2UgbWV0YWRhdGEgY2h1bmsNCmNhbiBiZSAxRyBzaXplZC4NCkRlc3BpdGUg
Y2h1bmsgc2l6ZSwgdGhlcmUgc2hvdWxkbid0IGJlIG11Y2ggZGlmZmVyZW5jZSBpbiB0aGUgY29k
ZSBwYXRoLg0KDQpJIGd1ZXNzIHlvdSdyZSB0YWxraW5nIGFib3V0IHRoZSBvbGQgYG1peGVkYCBi
ZWhhdmlvciwgd2hpY2ggaXMgbm8NCmxvbmdlciB0aGUgZGVmYXVsdCBvcHRpb24gZm9yIGFueSBm
cyBzaXplLg0KDQpUaGFua3MsDQpRdQ0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9s
aXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
