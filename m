Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2733EF86
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:27:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 701023C627A
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:27:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5D10E3C2D08
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:12:40 +0100 (CET)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 578DC60148C
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:12:38 +0100 (CET)
IronPort-SDR: 0ZJkfAtztX8wfKg3+xsx2xA9ku8GI7Spk4ddgjVD99G8bFK5EIWHTRMSrMemjCpZ8iNaULJNtf
 msDBbaaD2CK9tr93UizmE4tNhj3eG0LTZwnM8M4lCj+9R27tx92T7qipNZDIPAcR/Yigegp7Tu
 yU0dpNH4L2aZnal3pq3FnnXmlyLZc/znsVM7WE0NLPzTC2JgodYMfFQwKYsTJ7tm60Pk0hSHwe
 KCuiOkwhsJegvViZgXie2oa0nB32yEu6mWf6B4/GX6Drw6sS3BtOD1f5XVhNwN2vq6nafiwlrp
 xuU=
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="27932680"
X-IronPort-AV: E=Sophos;i="5.81,256,1610377200"; d="scan'208";a="27932680"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 20:12:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxJHju5ynFRELK1FUthLd2LZXKVzo+DFRzEAInmqCMcgXSDQoYRSoK3HELE61c/+3oGzrRIXG9Fi/k62HOWwwp5pOMe8tnxnWsBk5ml79wQLDlqpOYBH+k5d4t+3ILh+yLeQL2sFO9dZUg126PHlhb2qofV3c4I0YDQii+0NzBAxYhjtHuuywzRBXCqZ1duxN5I/U3vX1OohwAEXpGUDxoKhpFAzO4OVvb0wQEIhDsLsmHaUSVODS1RdnNfLts8j/B6u/78WezoIrFRoQW6SJ6GWbBpSaBBhJPefMyiiIZ8iVT89K6XXQWyxkguDcTS3yk/Rum/xu3kQTSsKqDL3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNbqz61BkCShiaETw1vBquTDeXP1mvRV9fwECItZ9mg=;
 b=fxbnjNTNT55/C6hRML8VTj9RZEPI38/HIPUU8oXHO7aNfHOYRqu+aCrs5Voh2tnW3Sg1yrXaOhzIuclWI7OYj8U/FG8Kq3YVfjmdEjaH4mBuWdcmETYWkJlt3iA5KJmsGSOCyT+tFaiFsRGRaXHGD4KHWoEG/6TZ3zjNkrBbgXqJF7TYDgssL4YuinUnpXD/SlTOBz6DXqwo91YTaSpkgETaSwwjFO1CI31iJkEtEwWUCXPbJmX8QYI2spZ3VNQqUF6iTAITrA8m95GdO74pmCQjnhE5tiF8clI3cNgz5K0jN9GjZwsxyuGUHNlp97xYTrHmIiHQqlb/H3vmPlGzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNbqz61BkCShiaETw1vBquTDeXP1mvRV9fwECItZ9mg=;
 b=cT1DebSP4Q77eDgyE/iOrrUdGb/T/s2fZco5ITlBODKXl2BGSlfL5eqgk/huQN7yE64jdUTNd9jzwR5wxBYBUXWbG/+XiMDDp76TvFTvxUziyvpcoiImWapc4ckv3D5lW0Cn7kWwTeQtbYhLd7Q8KoVIT2b+EwvAWUDs5/5FnbQ=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSAPR01MB4499.jpnprd01.prod.outlook.com (2603:1096:604:65::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 11:12:34 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::4d55:21f6:1362:c539]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::4d55:21f6:1362:c539%6]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 11:12:34 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>, Zhao Gongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH v2] cleanup: Unify the annotation style and remove
 Redundant code
Thread-Index: AQHXGxS3BLULVa30yEaiWrPWvjk5aaqIAmOAgAAA4TA=
Date: Wed, 17 Mar 2021 11:12:34 +0000
Message-ID: <OS0PR01MB6371A1E607BDFBC2421E6788836A9@OS0PR01MB6371.jpnprd01.prod.outlook.com>
References: <20210317100154.20389-1-zhaogongyi@huawei.com>
 <YFHghQWbAmjmKDx3@pevik>
In-Reply-To: <YFHghQWbAmjmKDx3@pevik>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04f9c4ab-3c69-4088-a2ae-08d8e93590e5
x-ms-traffictypediagnostic: OSAPR01MB4499:
x-microsoft-antispam-prvs: <OSAPR01MB4499119CFA39428B480DBB31836A9@OSAPR01MB4499.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yJxxxI6grOpH2BZoHoP9Y9dnxreEOyZdXYw/d8GQJOX1gEbpEDqeKhkWEHmzcZg39SwhafBmMWxREUktsIqMRY62ldgoMovHsyhW61jm5bqE9SxT0zEsiRXq7Av5yWrqKnKoKpseG1H1gSf/5fZm1m/YywZ9XGmHoDdl+h0+1oStUjuRZm4o+Cs69X8VdRhAjdWPnqgQVqKRSfT2HZgobAAushUOeXaocO4k+MKjmUVDcePU+HYfGVes0evUXqFGdisp5jwIDh0fu535CHuh6NGPH8uG4mRt9f8YHqMkHyMB5V4XuEed6gcX9h+NnlEqFUQxeOUASOUasRRwAFDxpJG33M+OH5uLhTDI8FZ2VR9lhn2Zj2Z0jVO5r+AMgDVOmwZF4VhErNDVjRIBPHa10JA7MiO/4WEX35JpZeiT61WLNZXlfctefojBzAnp8P2tv9L9cD0pwwqJxFrPWdxVqs37pfWtpCghhlSv7oq/3jKDG2uAuW0v1dd/4tDnpmaQDkV1J2geFqO6G3rQFaNOv43m8ewp+31uLta7i35CDg7+d+PHcMKmguOA+UlD49xVtwCBRxmNSm3thgpooMFGqLbDJgBcvHLWetH8FrPS7ZSoRXjFcBMvKJnsZcgrSai0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(85182001)(66476007)(4744005)(71200400001)(86362001)(64756008)(478600001)(966005)(76116006)(33656002)(66556008)(66446008)(52536014)(66946007)(110136005)(4326008)(6506007)(224303003)(186003)(9686003)(2906002)(5660300002)(26005)(55016002)(7696005)(316002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?VTYwTlVDT2M0VEN0YXhWeWZRT1oyYmNGUGd4cHc3aGw2UlRrZkZHU0tsQ0Ux?=
 =?gb2312?B?M3V3emExMFJtUmFUclRjUlEzQ3NwNzJOWHRYWjlISzErYXpSUUZaajN5dmlN?=
 =?gb2312?B?UjM5QTd5cTl2UGI5WGk1dEtQcDJVOTFxY0ZMSUd3bENGMnhHcUlQZGtoZVZD?=
 =?gb2312?B?TmdvK2I4NGxZZm9QY1VzcFlmeFREdzF3N0JYR2dBTGJiaEN4MHF1dE05ZGdE?=
 =?gb2312?B?ME55a0c2ckJsSDlRSUpQSFo5QUU5amZPcGlxRVE5bFN5V2M0dnY4Y0F5eW05?=
 =?gb2312?B?QlVEelhhN2NyUldWdU5WV1ZzQkVOeHJDUk9KSW5tOGdPcm1hUEpsZU1Qenk0?=
 =?gb2312?B?ZGFuL0RRcEJweEROeWhMUXJrTkJwNURTR0RsZXBNRGsxL0xXY2twejdmYXRk?=
 =?gb2312?B?eGd5TE9vZmFjK01hd2xhdG1WaUdCSGxaMFBsVVBiNk1tSWwvSlA4dncxMVZ4?=
 =?gb2312?B?ZUtBcTJVbTA3Vmtzc1RGeW5PWFNPM3UrWWxXVnZUT3JTWUZzQ00rcWdWc3ZO?=
 =?gb2312?B?TFRuUmZiVTJRYksxZVVjR3B6bEVNQXo0VDhySkVCQkpkMVZ6MWVYU1RjbFYz?=
 =?gb2312?B?czB0QkhxVnM3ZG9nZG9RWVhnaTIxNFcyVnhnRkNPWlBoa3plSVlibjhvMm9p?=
 =?gb2312?B?L29kbEo4Y2c4MFdVdnpiZWVLMjdIYy9WR1NCcUIxa0g1aDgycXNwV3hGaHU1?=
 =?gb2312?B?ZU9KQVUxcTJTWnNnWmlFUFdFY0dueXg0d2JSQTFKbVNCRmNGNW5STEtlM28w?=
 =?gb2312?B?d3hPOGlJOVhZWmNtNWs4NzNYRFFvcENQVnpoaXA5UUo0Z0JDc3F5aE0yZkR0?=
 =?gb2312?B?MEovNTZpZ0ZsaElnajcyTEZUQ1NHUTlvaEFUMHdUWjd1K3N5aW1WWFNIMHNP?=
 =?gb2312?B?M1Q5Y3M0UEg2VE5QUVhuaXVMMUtHL0ZqbDEzWUFQUEJRVlg3NjJNYmZ5am5t?=
 =?gb2312?B?MEh1OTZuNHVFdUdlR1BtSzVPS245L0lQNmViMW5SMHV0M0REL2hkdWZEVEp0?=
 =?gb2312?B?aHpWSkpBdG4zMnFoMnFEaFdwSmlLL0ttME9Dd3FVQ3lhcmxBd3hFVEdLK003?=
 =?gb2312?B?K0R4aEFpWG1oL090K0NiZUoyUmpJYnVYRGQ1RmF2WXhCdWJvNENUN0g3U3lC?=
 =?gb2312?B?aG5aRmx2VWFiY2NKMnViRjk3R05mSE1IWC80UVo5d2dTY1dsYXRqV2pGMHFa?=
 =?gb2312?B?c04zYzNvbHZnM2tpeEpIR1R6N00zdG1BNnN5NEI1V0htK0NnNkt2T0k3aEJ3?=
 =?gb2312?B?Q2xxbjVoZ0dxaDdMMkFkSUd0dnRGUTZUb1ZraTVBQXErWVFiSnhNTjhCMVg4?=
 =?gb2312?B?VURJOXZ2akhKckU0VTJiOUw4bG1pRVVQcU9XNThXVTdBTm8xOU5lSld4Zkli?=
 =?gb2312?B?S1VDU1JsRHI4VGVHNVVxN3VJNmZZUTJhRjRPV1dhTCtxVVZWamFYMUY4N3dj?=
 =?gb2312?B?L3pudWNvWnhyV3ZuR2dzblBnT1lSZFozWnlNRXJ3VVVsYjdxNDVzZ0txWC9Z?=
 =?gb2312?B?VTlhUWR0YnAxRHlKTnpzRXlxQU5raS9WSEhhUnpseGU0b3Eyc21kdFNmL2J0?=
 =?gb2312?B?aUJNSWFVRUZyVmNpYXRvRTg4MUNEaXFseDZBQ1Y4R2hlbmV5Znc3Qm8zbnZB?=
 =?gb2312?B?cFZNdlg5KzU1UllxbWhHOFF2QmxjcDI4eDhiSk1xQUUwV1ZPVDh3M2NnQ25D?=
 =?gb2312?B?Z2dxTlhKSHdYV0lMeHNXZXNBaDhBcmVhcUhWaml6K2YrQUN2T2Z5eWJiK0Na?=
 =?gb2312?Q?yeQGO9boxaxjmOKaR8=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f9c4ab-3c69-4088-a2ae-08d8e93590e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 11:12:34.5456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LJ8oexvVoWhRTX3JvkqP4UW7fRd56737G9eeQ1072ZLROPJkdMAWV8T1ojCrcAMYM4GZFpsEu42b8fQewsuVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4499
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 17 Mar 2021 12:27:32 +0100
Subject: [LTP] =?gb2312?b?u9i4tDogIFtQQVRDSCB2Ml0gY2xlYW51cDogVW5pZnkg?=
 =?gb2312?b?dGhlIGFubm90YXRpb24gc3R5bGUgYW5kIHJlbW92ZSBSZWR1bmRhbnQgY29k?=
 =?gb2312?b?ZQ==?=
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBsdHAgPGx0cC1ib3VuY2VzK3lhbmd4Lmp5
PWNuLmZ1aml0c3UuY29tQGxpc3RzLmxpbnV4Lml0PiC0+rHtIFBldHIgVm9yZWwNCreiy83Ksbzk
OiAyMDIxxOoz1MIxN8jVIDE4OjU3DQrK1bz+yMs6IFpoYW8gR29uZ3lpIDx6aGFvZ29uZ3lpQGh1
YXdlaS5jb20+DQqzrcvNOiBsdHBAbGlzdHMubGludXguaXQNCtb3zOI6IFJlOiBbTFRQXSBbUEFU
Q0ggdjJdIGNsZWFudXA6IFVuaWZ5IHRoZSBhbm5vdGF0aW9uIHN0eWxlIGFuZCByZW1vdmUgUmVk
dW5kYW50IGNvZGUNCg0KSGkgR29uZ3lpLA0KDQo+IENoYW5nZSAnREVTQ1JJUFRJT04nIHRvICdE
ZXNjcmlwdGlvbicgYW5kIGNoYW5nZSAnQUxHT1JJVEhNJyB0byANCj4gJ0FsZ29yaXRobScsIGFu
ZCByZW1vdmUgUmVkdW5kYW50IHRzdF9yZWFwX2NoaWxkcmVuIHNpbmNlIA0KPiB0c3RfcmVhcF9j
aGlsZHJlbiBoYXMgYmVlbiBjYWxsZWQgaW4gdGhlIHRlc3Qgc2tlbGV0b24uDQoNClJldmlld2Vk
LWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4NCg0KSGkgUGV0ciwNCg0KSWYgd2Ugd2Fu
dCB0byB1bmlmeSB0aGUgZm9ybWF0IG9mICdEZXNjcmlwdGlvbicgYW5kICdBbGdvcml0aG0nIGlu
IHRlc3QsIGl0IHNlZW1zIHJlZHVuZGFudCB0byBkbyB0aGUgY29udmVyc2lvbiBpbiB0ZXN0aW5m
by5wbCwgcmlnaHQ/DQoNCkNhbiB3ZSB1c2UgZWl0aGVyIG9mIHRoZW0obm90IGJvdGggb2YgdGhl
bSkgYmVjYXVzZSBpdCBpcyB1bm5lY2Vzc2FyeSB0byBkbyB0aGUgc2FtZSB0aGluZyB0d2ljZS4N
Cg0KS2luZCByZWdhcmRzLA0KUGV0cg0KDQotLQ0KTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwDQoNCg0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
