Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25A13A7AB
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 11:45:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2A753C234E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 11:44:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7B4773C0ECB
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 14:23:56 +0100 (CET)
Received: from m9a0014g.houston.softwaregrp.com
 (m9a0014g.houston.softwaregrp.com [15.124.64.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 45CB5600CFA
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 14:23:53 +0100 (CET)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0014g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 13 Jan 2020 13:23:08 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 13 Jan 2020 13:16:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 13 Jan 2020 13:16:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg3o7MKHoB0GdfuAq7vEAtsJW+LW8io4f46Bgo/R+clF2GGzBaC4GD8/Lwsa8ofKHNq1y8EDZuoIzHaNcygCKrfWVnAeFvHzqM3vkuYzx+qzIPwJhQcYen+MW5mg+s45nnpOUYwalbRXpP6a+09iYJy1VWmJBDmVVZ5YW9m7lNaARca9zm4x3CstPLJcmXJM/ZD1ha+kvNrgK3CxtdxX8qwmS0OVzcKJONn2bIKAYy1kvRhwygct6McrErNDVZ2UQbRmI9xL6NH114QEJW6ol/oYDABMZiN3W360u29kZpze5hgFlOnWP/AqrAFjkppd4IvvQyUHYMJVu6+vrmTkQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=se38paOyVQxZ4J0f76R1NhpcqZjq8HWdgjzpXE2gsoY=;
 b=LFORsQLmEzVEa9QTPGpPeNQS9r31yeL4eQWNyAonvOHC+rZ2yl9aJzhv5eyX12KHAA9TsEAd4357ZchCEU09FWO7Cg8tkWzbVyj8PtcFGUbTCmUzu0A5Hj535i+UO8ucUlwIEnEYtktmwDj0ekB02r5h66hLssfa670yi6W9OCayneRDp8cvE+0EWvTvsvgqOeqBij2qz+bx0eHfS4CouI6Vsw109XmrKDLP23LB+KpaBQAfFETT114us7zKSIQJv/z0NhC3oN4jmp/wCjkAeyZzdAA04rpHdpQP+pVPFDZjOCyv3hKCkPyxDAQx09rKAI+E5LsPUHllKO7h3vl2TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) by
 BY5PR18MB3283.namprd18.prod.outlook.com (10.255.139.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 13:16:31 +0000
Received: from BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::d948:61b9:971a:facd]) by BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::d948:61b9:971a:facd%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 13:16:31 +0000
Received: from [0.0.0.0] (149.28.201.231) by
 BY5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:1e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Mon, 13 Jan 2020 13:16:29 +0000
From: Qu WenRuo <wqu@suse.com>
To: Martin Doucha <mdoucha@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v3] Use real FS block size in fallocate05
Thread-Index: AQHVxXJJ6l/rplC/DkOXFzboq1vPWKfoi6WAgAAQxwA=
Date: Mon, 13 Jan 2020 13:16:31 +0000
Message-ID: <4da4e1ec-d5dc-06e2-bea8-280533f5d022@suse.com>
References: <461386048.17251961.1576663655809.JavaMail.zimbra@redhat.com>
 <20191218131533.15323-1-mdoucha@suse.cz> <20200107152108.GA27182@rei.lan>
 <6f2c4482-9a8f-1b14-be18-10b486576f13@suse.cz>
 <e684c55a-5973-af77-ff24-2dfc6a1f67b1@suse.cz>
In-Reply-To: <e684c55a-5973-af77-ff24-2dfc6a1f67b1@suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To BY5PR18MB3266.namprd18.prod.outlook.com
 (2603:10b6:a03:1a1::15)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [149.28.201.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee85ed0c-35a7-41b0-c537-08d7982acdff
x-ms-traffictypediagnostic: BY5PR18MB3283:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB32831CD6955E817B1D1B9DA8D6350@BY5PR18MB3283.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(199004)(189003)(6666004)(54906003)(316002)(8936002)(110136005)(16576012)(71200400001)(5660300002)(6486002)(8676002)(81166006)(81156014)(2616005)(956004)(31686004)(2906002)(6706004)(52116002)(26005)(66946007)(16526019)(186003)(66476007)(66556008)(64756008)(66446008)(53546011)(107886003)(4326008)(36756003)(478600001)(31696002)(86362001)(78286006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3283;
 H:BY5PR18MB3266.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7BHcoaYn0JhSsOR4rGo/1hzULrC8PApMmbjiJiaKMSCFGbRJNXlb8wlL5RzQEenLjiWo0kODqDSDCzkQs7647wCyehgTqNaLXcww3wKq3o5nN8zwwFWONGj6/tVXBMGQu/wv+5PWeCo7RiEyawcUO0G+btIlrwBFtt0gOYN0NJLKeYtX84laSGqSp/rNrAOcWq7ABfGpeWTzgjF7cruDgFlgXK+RFxZ4zEaavnztO6Pc4Nllb6ujlb3z33PG6GzWj14Pp3tNlQUhkoVBuxBAAPHqL/eZO542RGgWUj/2LhDnSq/xSUOiKzNkAgiPRsbYO78dJQ/GQK+jBpuqPizCjymFgsQqVOBFk2EdLV98/vWEn/fLUt5w64hRPByI/lMb7dCuNMttQPtOmvqAgIX46MxIkHSsDvPCskSnhzUUQ0lb5DOf6GoDn8IPGmGmf3mtay5cVu0ftX5qCHyVHJReCEGM9C2PEGAQ7V4LXfbvwr7lkj/9CjLurHHONx5z+/z
Content-ID: <7A086D46A5450F4282F3C88F2567CA44@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ee85ed0c-35a7-41b0-c537-08d7982acdff
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 13:16:31.0213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAkOAQwOSo85FPi4FC8zhyBO7r1V6WFE5wgiT4FLZh2DNYc2Bd1QJHT0MqQ8HdO7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3283
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

DQoNCk9uIDIwMjAvMS8xMyDkuIvljYg4OjE2LCBNYXJ0aW4gRG91Y2hhIHdyb3RlOg0KPiBIZWxs
bywgZGVhciBCdHJmcyBkZXZzLA0KPiB3ZSBrbm93IHRoYXQgeW91J3JlIGJ1c3kgZml4aW5nIGJ1
Z3MgYW5kIGltcGxlbWVudGluZyBuZXcgZmVhdHVyZXMgYnV0DQo+IGNvdWxkIHlvdSBzcGFyZSBh
IG1pbnV0ZSB0byBhbnN3ZXIgYSBxdWVzdGlvbiB0aGF0J2xsIGhlbHAgdXMgaW1wcm92ZQ0KPiBC
dHJmcyB0ZXN0IGNvdmVyYWdlIGluIExUUD8NCj4gDQo+IFdlJ2QgbGlrZSB0byBpbmNsdWRlIHRo
ZSBpbXByb3ZlZCBmYWxsb2NhdGUoKSB0ZXN0IGluIHRoZSBuZXcgTFRQDQo+IHJlbGVhc2Ugd2hp
Y2ggaXMgcGxhbm5lZCBmb3IgZWFybHkgbmV4dCB3ZWVrLiBTZWUgdGhlIHF1ZXN0aW9uIGJlbG93
Og0KPiANCj4gT24gMS83LzIwIDQ6NTAgUE0sIE1hcnRpbiBEb3VjaGEgd3JvdGU6DQo+PiBPbiAx
LzcvMjAgNDoyMSBQTSwgQ3lyaWwgSHJ1YmlzIHdyb3RlOg0KPj4+IEhpIQ0KPj4+PiBDaGFuZ2Vz
IHNpbmNlIHYxOg0KPj4+PiAtIEluY3JlYXNlIHRlc3QgZGV2aWNlIHNpemUgdG8gMUdCIHRvIGF2
b2lkIHVucmVhbGlzdGljIEJ0cmZzIGVkZ2UgY2FzZXMuDQo+Pj4NCj4+PiBEbyB3ZSByZWFsbHkg
bmVlZCAxR0IgaGVyZT8gVGhhdCBxdWFkcnVwbGVzIHRoZSBydW50aW1lLiBBcmVuJ3Qgd2UgZ29v
ZA0KPj4+IHdpdGgganVzdCA1MTJNQiwgdGhhdCB3b3VsZCBqdXN0IGRvdWJsZSBpdD8NCj4+DQo+
PiBJIGd1ZXNzIHRoYXQncyBhIHF1ZXN0aW9uIGZvciBCdHJmcyBkZXZzLCBzbyBsZXQncyBhc2sg
dGhlbS4NCj4+DQo+PiBXZSdyZSB0cnlpbmcgdG8gdGVzdCBmYWxsb2NhdGUoKS93cml0ZSgpIG9u
IHZhcmlvdXMgZmlsZSBzeXN0ZW1zIChib3RoDQo+PiBzcGFjZSBhbGxvY2F0aW9uIGFuZCBkZWFs
bG9jYXRpb24pLg0KDQpKdXN0IGEgc21hbGwgdGlwLCBidHJmcyBkZWZhdWx0cyB0byBkYXRhIENv
VywgYW5kIHVubGlrZSBvdGhlciBDb1cgZnMNCihsaWtlIHhmcyksIGJ0cmZzIGhhcyBhbiBleHRl
bnQgYm9va2luZyBiZWhhdmlvciwgdGhhdCBldmVuIG9ubHkgcGFydCBvZg0KYSBsYXJnZSBleHRl
bnQgKGUuZyAxMjhNaUIpIGlzIHJlZmVycmVkLCB0aGUgd2hvbGUgZXh0ZW50IHdpbGwgbm90IGJl
IGZyZWVkLg0KDQpTbyBmb3IgdGhlIGZvbGxvd2luZyBjYXNlLCBpdCBtYXkgY2F1c2UgcHJvYmxl
bSBmb3IgdXNlZCBzcGFjZSBhY2NvdW50aW5nOg0KDQojIHhmc19pbyAtZiAtYyAiZmFsbG9jYXRl
IDAgMTI4TSIgLWMgc3luYyAtYyAiZnB1bmNoIDAgMTI3TSIgXA0KICAvbW50L2J0cmZzL2ZpbGUx
DQoNClRoYXQgMTI4TSB3aWxsIHN0aWxsIGJlIGNvbnNpZGVyZWQgYXMgdXNlZCwgdGhhdCAxMjdN
IHB1bmNoIHdvbid0IGZyZWUNCmFueSBzcGFjZS4NCg0KPj4gV2hhdCdzIHRoZSBtaW5pbXVtIGJs
b2NrIGRldmljZSBzaXplDQo+PiB3aGVyZSBCdHJmcyB3aWxsIHVzZSB0aGUgc2FtZSBjb2RlIHBh
dGhzIGFzIGluIHJlYWwtd29ybGQgdXNlIGNhc2VzPw0KDQpNa2ZzLmJ0cmZzIG5vIGxvbmdlciBl
bmFibGVzIC0tbWl4ZWQgZm9yIHNtYWxsIGZzLg0KDQpCdXQgYnRyZnMgc3RpbGwgaGFzIGEgcHJl
dHR5IGNvbXBsZXggbWluaW1hbCBkZXZpY2Ugc2l6ZSwgaXQgZGVwZW5kcyBvbg0KcHJvZmlsZSAo
LW0gYW5kIC1kIG9wdGlvbnMpLg0KDQpJZiBMVFAgZ3V5cyB3YW50IHRvIGJlIHNhZmUgZm9yIHNp
bmdsZSBkZXZpY2UsIGl0IG5lZWRzIDI1Nk1pQiBmb3INCmBta2ZzLmJ0cmZzIC1tIGR1cCAtZCBk
dXBgIHRvIHJ1biBzdWNjZXNzZnVsbHkuDQoNCklmIG9ubHkgZGVmYXVsdCBjYXNlICgtbSBkdXAg
LWQgc2luZ2xlKSBpcyBuZWVkZWQsIHRoZW4gMTI4TWlCIGlzIGVub3VnaC4NCg0KVGhhbmtzLA0K
UXUNCg0KPj4gbWtmcy5idHJmcyBpcyBjYWxsZWQgd2l0aG91dCAtLW1peGVkLg0KPiANCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
