Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10634F633
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 03:25:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 614543C8C03
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 03:25:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 65F253C2E4C
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 03:25:49 +0200 (CEST)
Received: from esa20.fujitsucc.c3s2.iphmx.com (esa20.fujitsucc.c3s2.iphmx.com
 [216.71.158.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0D353600A72
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 03:25:47 +0200 (CEST)
IronPort-SDR: Ga5F8KX29EG6iDO6dqRcisxqj1caS9XVwXPWNmb7Nw9biUY4gcTVo4Eh2jq/3u/cLeKY6a80hC
 hAlbJbc/ZnEz4tuF1gqXh+bwQ3uGUe8D9YmmXNnz2IBM+yzUDF+MO63RYWxCltuciyF6wDVAKL
 j0+Osi0/h/METjTB3ZRdJEyeEAoEvwYeAFyPARRec9cPUce4FZnOyVgXanHz+XlE4A9BeyhMt5
 zIgPhd7dHJDGwuLvkPI5e1uryUjbCBep5vFJREcRWSJr9V7zPfS8mvGo9Myi8elAbvc45lZJaq
 qro=
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="28749232"
X-IronPort-AV: E=Sophos;i="5.81,291,1610377200"; d="scan'208";a="28749232"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 10:25:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFjJbP+iX/hpkySmghqrXMZsFBtShK8M4dweFm1hCCsephX4v+7tMZhSpfnTuDyCpZXjbcLwd+/1lXUA4gC/r1Hvl8MDIzYPA1B7srtqzfm7iogn2X//knSL7UZN/p+igMv1RnW5Rw2mIeB1CSVnTsijDO5UaqIod2a1C8OoPTVkaaPZPVqSCfcTmVBi3hZW7y1raG1JPfKREw+s0UNN+U1Hg4tHQhFL4mZL5/E9df+7TrPb9V9iSK9wv7YiBxCEvc8MF1N3ZOvHXQM62i0tOSdJqY2t5+DOk7fNtOS28spAqTsM6bBp7nX3TV8F450OU1DMG5Ve8+m7JBkpqr3gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMrIFw0qHSJQ+hCIHrtDuPCJXsnWD8VFbMB1Yr4ifuA=;
 b=h9mzKyGax6jlgycyEUOt3cP2WTKFcOEEJ9sE/KhnGG/dp2ltDIaQFrnJ+ljNMTsSVzdVJEp76KF/N7VfpRfI3DH71I8NCtN6EUq9bvVtl7Hau5Kuqvgb0NDpEuVZg1R92wLVLMobXbTw6Ilay09dU1TlpaASUhyZ975mojeZvFKGqlyn+XeuXkiqSlm96Dt/uq25jYKP7NinAdRPqhbprVvvNCosKDLsog17+QiSCjOf4BdwpgIq/B/z5/fnvC/TZZ6Z6PESFEfo3IV/ctlaXhwdxHQ1wx+dWddzOl4mCkLk57mUeO/2OQ8FzRN951QqHalLc7XCps3EUJh5Q0Z+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMrIFw0qHSJQ+hCIHrtDuPCJXsnWD8VFbMB1Yr4ifuA=;
 b=gPmSpZvmC+9rLdB2nbxR5XVkzYxo5rfAsM5QR58FXTs0HCOUmV2KsIKZ+1bEptKEcY/qfnQLA1UkYlTI8fBndslYeuX43nPa916ju5KSwrCJIpDRDa9HyJnOu0snmAT77wToSimR9qbrTMbJRU/yS5T9tmsQn+vhd0CNrYw0DTU=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSBPR01MB4117.jpnprd01.prod.outlook.com (2603:1096:604:4c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 01:25:43 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3999.026; Wed, 31 Mar 2021
 01:25:43 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] min_kver: Add kernel version requestions
Thread-Index: AdclR1MNJW7vNiebSGiOW6FNC5gfTgAhW+YA
Date: Wed, 31 Mar 2021 01:25:43 +0000
Message-ID: <6063CF94.4000505@fujitsu.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E79C@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E79C@dggeml531-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f255f351-546b-4090-d278-08d8f3e3e70f
x-ms-traffictypediagnostic: OSBPR01MB4117:
x-microsoft-antispam-prvs: <OSBPR01MB411718E86799CE11F1121E12837C9@OSBPR01MB4117.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8nXk5RyanL9xHlTVaIQ7JT5pEDxcpR6ChCJUAv0LKJbxrQVhws/72JLOD2fkWh35vW/5sBrq2qsn+tpTRNm66mO1huiyFUd6BBTHRgEF8bGalRe9lYEexv41jFjBGxMheZQW+B4fxYmZzNCHMV0Q9Us4tFsynERn21tq1/x/lJsjAKFZN/lUIRkeudS3saXLZPX2hBe/TuRQQ4SOOestrTzI12soMXbUidAnq9zmV+chWQp9+aViNPBOCMbJ85XLhOCr+jvJzN9340cvHlmozBT8gF5CX+/c+c76s0xpwe+2Zdtizt6jQyij8k58L3yhusRjDbEd6S5W0/iy5oGW6vyaQ2y5C2wVhhYky//DrIO1Yb4M/9EFQ0ixfoputQHCABPXr1FlIg6vrFgbTcjdqc+SaZA1nKI9sMBQ3tSQwEPHuNgY3ya0bDAMKLqaaV0tfkKyLWpQhJ6XUakDNvM1z2DeWFxsh7lnaztaxlf5Wrp+ec3BAOjLtWl8HOOGu3UM/Hp1GXO0vp4wbT9xQTfpxNM06brSabeQlLxNd3ULHff87KLmeVCnFwubE//gGcjJKoJINJTERMyGYHfTmQBDP1teTGTi05hoss2+SKy0RTTj/NKQl7+i8OVqFviDs1bdffu8L7mCCUs0QKw+cZT6947oXSttkk+Lw5RUkug1AY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(6486002)(87266011)(5660300002)(4326008)(478600001)(6916009)(66556008)(8676002)(91956017)(38100700001)(66446008)(83380400001)(26005)(71200400001)(86362001)(36756003)(76116006)(53546011)(33656002)(6512007)(6506007)(2616005)(66476007)(8936002)(85182001)(2906002)(66946007)(64756008)(316002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?dWl4d3NZL1I4dHI5VktqMkw2ajByZWxLY3FLelI0U0xRQy8yZEZOTzh6MXEw?=
 =?gb2312?B?SWl2Mjh0OW1tQU5MckxuYUxCZzQ4NHF5OFpyamhtYlg2SzVNc2JhODh5M09P?=
 =?gb2312?B?ZndtamhRY2hEa1ltVHlJdk41RXRxdGx5bTdJOXhyZVowS3RhTVBKbEM1TjV3?=
 =?gb2312?B?UEhCc1lxMjJhNTVBbmNCMHNZakpnUXdpSW15K2FBZUdZV25ENnZuamE3YkVn?=
 =?gb2312?B?elREakJnY0N5QTZ4Q1prb0VwUmdOSXJGRm51UXczdHZsekhONGlDYVo3cWxZ?=
 =?gb2312?B?STQvK25qdWFXdm9xdTEwVFpTbFc2MHFvQmdWZlNBYUxvcEwwd1Frc203Ylpo?=
 =?gb2312?B?M3hZdHFTQVRrZmp2YU0xVUlBbGJnRENBRnNSMUYyTGI4L09QUTU0QXRWc3dV?=
 =?gb2312?B?bEFkelkvSlJJSlIvaGd5NE1aZS9oUkdNU0hKbXF2OVNtTEFBOERtbHl4OUo5?=
 =?gb2312?B?QVltY0ExWWN4MGpaTllONVNBUUhsWndldU54bTdkb0hLbVROWXJYa3FDdjEv?=
 =?gb2312?B?TWlpdkxLV2I3dEM0b3lEamF5YzRnVmJxUXFsY1p6YnY1YjJXU1RGZjV2dHJH?=
 =?gb2312?B?NDE3OFE0QXJQL1NhOG9HNGRYQXNLRmlEZjBZQlVHWVIxcyt6OGxEN29vUGtB?=
 =?gb2312?B?Uit5Y09zd1RoVHM4QTZsb3hNQnhreTN1cnJ2SEl6ZFBIeGJwZnp6Z2RmNmpz?=
 =?gb2312?B?MmhOczM0SVM5c25ORXZTQzNFNWF5MzZtRkswR2g1Vk1OZ2tJelRQNWNwbnpt?=
 =?gb2312?B?NTBDY1VmV1hOMkxDRU1YUFhYdlR4NFNCM05wR0xUZklILzRFelVJK3hUS21K?=
 =?gb2312?B?dnVYeTRDOGFmWlc2ejBhY1YzNk1jRmppWjdzQlRBVG9yY3BYYm9YaDVmeElh?=
 =?gb2312?B?Z3Bha0hxdTdHZzZFaXNKYjdybllmNFIyTVl2clFHZGhITVFjNU15ZzFBMmpN?=
 =?gb2312?B?eVduKzdkWWxXb2pIdWp3d2FqYlhGQkFRNGNhcjk1Ti9vSCtYU09GSFpMK2Fq?=
 =?gb2312?B?cnFxOExHMTRGN3Rudmhra0hXSUZ4Q1gydDREUUlLL1Q5SzlVeFFpeUVQS1Q4?=
 =?gb2312?B?TWpiempJTU15bzZIUmVGSEd1UGZIZXRjV3JsK3Brbng2RGVZd1lPQWoxRkdr?=
 =?gb2312?B?T1JoNVZSOHVHMUw2MDJpbGxLSkl3VG5uSWw5N2JPaXk2N25OK21vdDhWbFpl?=
 =?gb2312?B?UjY1MTZkS0MwVmNBN1JJdjV0R1d3anN5OEtZMFB1bnJUUVBPdnpDeU9laVBK?=
 =?gb2312?B?eDRvYVp2SHllaEFEbkIvOGpjbEtaUzh5WUdtZ3d6d2JjS2RKcTYrSTlvMU5r?=
 =?gb2312?B?V1ZuK0JjdThpUVdraWk3MGd4VHpaTk8wSDAxQk81UjFOVUR2b3V5aWdyT0w1?=
 =?gb2312?B?S0VnaHBkZzJEWm5UYWMzTm5Ec3g3MG1yLzhVTzV4SE4yaEhFNmtZdkc1YWp0?=
 =?gb2312?B?TlpPdlQxKzcwSGJtbjdWSVhpMjkrSHdGcnpXcmkzakhpWnJHeW40QjdET1dP?=
 =?gb2312?B?ZzhPa2E1VHdMa2VPMExIZEJvOTQ2bVpVTU0yaFloWHdnRkcvdGcydkpiNzB4?=
 =?gb2312?B?RmhBTTAwbEJYV3doNjNoYjlzOVRSbUFTRVp1OWRUbFVDZ1RPdDQvcWtrcGNy?=
 =?gb2312?B?bm5Wa3Vla3JPbHRPKy9hd1VMSnM2cE9KVVUzd2ZBa09xczZEU3lJV0RLaWlo?=
 =?gb2312?B?VGN0bW5acFFVbHR3SldJSnhiQ0trbmpNUXJjcC8yeGtYMjJ5UHcrZHRTRzZr?=
 =?gb2312?Q?/OZra8qVxjS5V5AlYnNM3dokTi8LtcMevPFPA4P?=
x-ms-exchange-transport-forked: True
Content-ID: <5C0C2F31ECC66048A9D1FF236D71E349@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f255f351-546b-4090-d278-08d8f3e3e70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 01:25:43.2077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOjDwFYESr+3efVbpY/eSdjyEiOTUmrHGsLsJzZiwpLvqeDXK9baQldHCF+zsv/niC5iE9UgBq13QT43N7vZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4117
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] min_kver: Add kernel version requestions
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

T24gMjAyMS8zLzMwIDE3OjMxLCB6aGFvZ29uZ3lpIHdyb3RlOg0KPiAtLS0tLSBJIG1lYW4gdGhh
dCBpbiB0aGlzIHRlc3RjYXNlLCBpdCBzaG91bGQgY2FsbCBwcmVhZHYyL3B3cml0ZXYyIGluIGxp
YmMgc2luY2UgaXRzIGtlcm5lbCB2ZXJzaW9uIDwgNC42LiBTbyBJIHRoaW5rIHRoaXMgdGVzdGNh
c2UgbmVlZCB0byBiZSBza2lwcGVkIG9uIHRoaXMgc3lzdGVto6xvciBpdCB3b3VsZCBmYWlsIGZv
ciBFSU5WQUxJRCBldmVuIHRob3VnaA0KPiAJSSBkb26hr3Qga25vd24gdGhlIHJvb3QgY2F1c2Ug
b2YgaXQuIE1heWJlIGl0IGlzIHRoZSBkaXNtYXRjaCBvZiBsaWJjIHdpdGgga2VybmVsLg0KSGkg
Wmhvbmd5aSwNCg0KSSB0aGluayB5b3UgZGlkbid0IHVuZGVyc3RhbmQgdGhlIGxvZ2ljIG9mICJw
cmVhZHYyLmgvcHdyaXRldjIuaCIuDQpJIGhhdmUgc2FpZCB0aGF0IDEpIExUUCB3aWxsIGNhbGwg
cHJlYWR2MigpL3B3cml0ZXYyKCkgaW4gbGliYyBpZg0KSEFWRV9QUkVBRFYyL0hBVkVfUFdSSVRF
VjIgaXMgZGVmaW5lZCBvciAyKSBMVFAgd2lsbCBjYWxsDQpzeXNjYWxsKF9fTlJfUFJFQURWMi9f
X05SX1BXUklURVYyKSBpbiBrZXJuZWwgaWYNCkhBVkVfUFJFQURWMi9IQVZFX1BXUklURVYyIGlz
IG5vdCBkZWZpbmVkLg0KDQpSdW5uaW5nIHRoZXNlIHRlc3RzIHJlcG9ydCBURkFJTCBpbnN0ZWFk
IG9mIFRDT05GIG9uIHlvdXIgZW52aXJvbWVudCBzbw0KSSB0aGluayB5b3VyIGxpYmMgYWN0dWFs
bHkgcHJvdmlkZXMgdGhlc2Ugc3lzY2FsbHMuDQpGb3IgZXhhbXBsZSwgc2VlIHRoZSBkZXRhaWxl
ZCBpbXBsZW1lbnRhdGlvbiBpbiBsaWJjOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCjI0IHNzaXplX3QNCjI1IHB3cml0ZXYyIChp
bnQgZmQsIGNvbnN0IHN0cnVjdCBpb3ZlYyAqdmVjdG9yLCBpbnQgY291bnQsIG9mZl90IG9mZnNl
dCwNCjI2IGludCBmbGFncykNCjI3IHsNCjI4ICMgaWZkZWYgX19OUl9wd3JpdGV2Mg0KMjkgc3Np
emVfdCByZXN1bHQgPSBTWVNDQUxMX0NBTkNFTCAocHdyaXRldjIsIGZkLCB2ZWN0b3IsIGNvdW50
LA0KMzAgTE9fSElfTE9ORyAob2Zmc2V0KSwgZmxhZ3MpOw0KMzEgaWYgKHJlc3VsdCA+PSAwIHx8
IGVycm5vICE9IEVOT1NZUykNCjMyIHJldHVybiByZXN1bHQ7DQozMyAjIGVuZGlmDQozNCAvKiBU
cnlpbmcgdG8gZW11bGF0ZSB0aGUgcHdyaXRldjIgc3lzY2FsbCBmbGFncyBpcyB0cm91Ymxlc29t
ZToNCjM1DQozNiAqIFdlIGNhbiBub3QgdGVtcG9yYXJ5IGNoYW5nZSB0aGUgZmlsZSBzdGF0ZSBv
ZiB0aGUgT19EU1lOQyBhbmQgT19TWU5DDQozNyBmbGFncyB0byBlbXVsYXRlIFJXRl97RH1TWU5D
IChhdHRlbXB0cyB0byBjaGFuZ2UgdGhlIHN0YXRlIG9mIHVzaW5nDQozOCBmY250bCBhcmUgc2ls
ZW50bHkgaWdub3JlZCkuDQozOQ0KNDAgKiBJT0NCX0hJUFJJIHJlcXVpcmVzIHRoZSBmaWxlIG9w
ZW5lZCBpbiBPX0RJUkVDVCBhbmQgdXNlcyBhbiBpbnRlcm5hbA0KNDEgc2VtYW50aWMgbm90IHBy
b3ZpZGVkIGJ5IGFueSBvdGhlciBmbGFnIChPX05PTkJMT0NLIGZvciBpbnN0YW5jZSkuICovDQo0
Mg0KNDMgaWYgKGZsYWdzICE9IDApDQo0NCB7DQo0NSBfX3NldF9lcnJubyAoRU5PVFNVUCk7DQo0
NiByZXR1cm4gLTE7DQo0NyB9DQo0OCBpZiAob2Zmc2V0ID09IC0xKQ0KNDkgcmV0dXJuIF9fd3Jp
dGV2IChmZCwgdmVjdG9yLCBjb3VudCk7DQo1MCBlbHNlDQo1MSByZXR1cm4gcHdyaXRldiAoZmQs
IHZlY3RvciwgY291bnQsIG9mZnNldCk7DQo1MiB9DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KTm90ZaO6bGliYyB3aWxsIHVzZSB3
cml0ZXYgYW5kIHB3cml0ZXYgaW5zdGVhZCBpZiBrZXJuZWwgZG9lc24ndCBzdXBwb3J0DQpwd3Jp
dGV2Mi4NCg0KQ291bGQgeW91IHRlbGwgbWUgdGhlIHZlcnNpb24gb2YgbGliYz8gUGVyaGFwcywg
eW91ciBsaWJjIGhpdHMgdGhlDQpmb2xsb3dpbmcgYnVnOg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KY29tbWl0IGQ0YjRhMDBhNDYy
MzQ4NzUwYmIxODU0NGViMzA4NTNlZTZhYzVkMTANCkF1dGhvcjogRmxvcmlhbiBXZWltZXIgPGZ3
ZWltZXJAcmVkaGF0LmNvbT4NCkRhdGU6IEZyaSBGZWIgMiAxMDo0NjoyNiAyMDE4ICswMTAwDQoN
CnByZWFkdjIvcHdyaXRldjI6IEhhbmRsZSBvZmZzZXQgPT0gLTEgW0JaICMyMjc1M10NCg0KUmV2
aWV3ZWQtYnk6IEFkaGVtZXJ2YWwgWmFuZWxsYSA8YWRoZW1lcnZhbC56YW5lbGxhQGxpbmFyby5v
cmc+DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQoNCkJlc3QgUmVnYXJkcywNClhpYW8gWWFuZw0KPiBUaGFua3MhDQoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
