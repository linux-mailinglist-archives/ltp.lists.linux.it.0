Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9596834A008
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 04:04:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56C123C8E3B
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 04:04:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0FF463C1B7B
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 04:04:08 +0100 (CET)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com
 [68.232.156.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 456AE601A9C
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 04:04:01 +0100 (CET)
IronPort-SDR: Wg3tcJ0Vumz9XcNBfl1myGrYkcdEFL3sXo65ISHpO0WBV55F3HVYnOLXm8XFDC4RLiUHxEN6od
 6kT5qal7QSmrdcQg9myhXtxydy6OoBR8sFPTKCJO4ABUoge0Qv5By195oZz4WojsTdWbpAwaKl
 BCNQ653z0a7+u+XDKB+p28MXTKF2xA7JaD9LpfeoZEFHZBsXa+Q/1BKoYY4EZI4HjkI7sHzCb1
 08csiVtvPWzJUV0lo/KbVnUePV0dXZgmAp3LRctfOJzjVQT8dVfxheWk6WG/SgYiHV2bIvTBoJ
 4Rs=
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="28429935"
X-IronPort-AV: E=Sophos;i="5.81,279,1610377200"; d="scan'208";a="28429935"
Received: from mail-ty1jpn01lp2055.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.55])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 12:03:42 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM/FSsTZ0N+Aiii9xCzi9ML2Ef4msA9eOm+rHvEjYZT7d4m3w4RDqBRc4ZwvoFDLy4MZqNpO7qBACoIbD8/mGyhNblg51JdnxFhlxL6RqJTA8o87QJrtoxO+fCWg3HdaORtojvc3ENmOJEuNX1NUqVDabkQtVdagSf9B6NsbsF+KTjQtoO3jg7AOgUei64BLOuO9s1j80jClKD40P3Yw9cL5g59YkVkzw6rd9YzRBanEeLsdHcF950uIr83AG0SfyBGeFz+gSLXki14YRkBML4K/kK2l7edPm5W/xXZWIEP8n6k+F/lgbMDfpbJbPCnw4N12cKDoPAzI2qqVFFVFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lyThJyXqXiJVcK+jiv3vS0tmPR52B1+/UWNT7s3p4Q=;
 b=JUbtmagU+fusucWVbyT0o1D1moEBAKcv2aDbHqiHmIOnmsLCku84eBkgeP4IYOObFmCNpPDpUUL6jgk/VjgzBQSCzMOyxpJ5DA9RDor1QeYc8pwWIquzi5HI5cx3M6iJLRke4Gss3Us70Y++pM/0XoThhLrCZc0XGq1C1W+D8/A9EChoLDSvWWwZTr6qsv6PnILFJo26E4iAtkKKigIID5UczDLnLFvFMp5j/BPQjKdZlhyY4sMyO1t8M9+xgSo8YL8Fgfj4PItXqogcERvYIaEFg4xtPwWMJGd+BqOeeTMLOkiOu4UHHwcgMd2PlmJ7j6XB1FPZQBLXA5ekzF0ZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lyThJyXqXiJVcK+jiv3vS0tmPR52B1+/UWNT7s3p4Q=;
 b=liUArSiZfsnBB6Qu/Ln4gCcyVvR3Sx6FUm+4spoE1Ad8A3lK1gv/etzX8QTqI6gpTurVrZUNTTRr2UkdUxEXM0RQ6mBgIzqTi/z7H91hlATxxleagdzk1iNVWgXPSyEjBcBM0Tty6FoOuRLFlFMr0rBEGb7TqFvzq/AjKhasC6w=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6077.jpnprd01.prod.outlook.com (2603:1096:400:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 03:03:39 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 03:03:39 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Xinpeng Liu <liuxp11@chinatelecom.cn>
Thread-Topic: [LTP] [PATCH] syscalls/mallopt:fix compiling error
Thread-Index: AQHXIepCVUqjqHNEFUulT6X999j7KKqVlYCA
Date: Fri, 26 Mar 2021 03:03:39 +0000
Message-ID: <605D4F1F.3020301@fujitsu.com>
References: <1616726772-29562-1-git-send-email-liuxp11@chinatelecom.cn>
In-Reply-To: <1616726772-29562-1-git-send-email-liuxp11@chinatelecom.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chinatelecom.cn; dkim=none (message not signed)
 header.d=none;chinatelecom.cn; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c522fe33-bb54-4577-c26b-08d8f003c16e
x-ms-traffictypediagnostic: TYCPR01MB6077:
x-microsoft-antispam-prvs: <TYCPR01MB6077D512149ED81945CEE275FD619@TYCPR01MB6077.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CvP3GnLugUkIJhn2bL07ZkEbgsjzx10Ae4HVtzT9cbQsbYrlFwhZJFuMtPV4OxgAnYvd39XR1XPAuV/c/m/VN25bd5AAu5NoIgzUWfPiDmtaFpZ4GKl+ylaDMHOTuj8xrcFdGmHSUUiGBUY5KaGZspm+eOOIchtQoaAQ74gcwjv0rBjra9XbG652uWEAWNA2e8710sgeWcYz+eJMN2a2HeKWJNRqae7VInMAkcmEZQPVLEkXUtNd3VjdsTFQ8Ymt8JlOhll1af859ojY9jpKZE0bo3ztLvRP+JaukZzCN42kN3FaXC7jn6VOwfiVt0mg0jH/uAWD6mHAgpDuZ8fjGDFCReB4y3tWFkDhkPY3rfOJqQu9M9RIl+tPhKnEO17qTpcDkGT/KmXcuGo+qP6TUl34Yn5YwVHsLe/8Wr0d6b0kDIxVRu1YFidlHymtNTjDUX6FDlXHCmbUjQIoafDsFZVg3sTUwA2KMma1kPpcEa/HBZT4fgv1pkiJZ0u4yFoRV9VBQeVbWOn4aD2lvCdbg74MN0l2BN7PSZjkWlB4qKZnayH/gnnX/h2mxbFYOaebbkQPc0W4j63nyItwNjk//aRGm2rxja9rkb33HkQ1eTofhYescPLxrp54gEd44dboXR5d7t5Rl3VzkPOmmpHHazIOjFYn80/QXfO7dsFrrYA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(66446008)(87266011)(36756003)(91956017)(5660300002)(2616005)(85182001)(83380400001)(64756008)(66946007)(66476007)(33656002)(66556008)(38100700001)(86362001)(76116006)(6506007)(6512007)(478600001)(2906002)(4326008)(8936002)(8676002)(6916009)(186003)(71200400001)(6486002)(316002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SzNnU0luRXZPS1ZJeWc0Vnh0YVQydFV5bk1ENlcvQTFGMHVvV3FhN2R4N0VZ?=
 =?utf-8?B?ZzdHOWpvYVNycEJ6V0JJN1RoS2JlRWVBdTArWlV3cjU0UCtEcFY3S3Q2eTVr?=
 =?utf-8?B?SVYxUGxsMGlHb3dLT0Y1UDFVMUVKUEprOThFVEFUNzVQeFpwRHl4Q01zN1Qy?=
 =?utf-8?B?NnMwaE1DQXZGdnNxWmExblRUWGFMZ1BjMzI1TFpYUkdQRk9OejRCK3d1L1NG?=
 =?utf-8?B?YWl6b3ArMDRoeS9Qa2llTTRtWE9nd0JzQTNUWVkwTmxjVERUV2pSU21iVFg3?=
 =?utf-8?B?dTlZb1JlZDl5MHFyaDNkSlJUQ09yWmR2RHorQ1o2NUVZcXFjaW93STBlUDRQ?=
 =?utf-8?B?RElTMmd4dDVoVlZ5b3gyS0M2UmZmR1RpcnI1NU52ZjdSQUowN0lOL3pTU3Mz?=
 =?utf-8?B?dW9XR1E3eGNoTkwxYThWcGRsTjBBODRoMFdiWVUwT29YUVhSYkZMeXF0aDFH?=
 =?utf-8?B?NDhONFVrWXRuWENBVjYrWGxPQ2RWSjIyZ0FFMUVSRmNpN2k0UnNWb1ZEeHE3?=
 =?utf-8?B?NlZzRm1rdlB0eW9hdzVCOUd0MHF2TUIxY1FVUzhpd2dXMGttNFhPQTJzUXhO?=
 =?utf-8?B?ZmpUMnRCNUpxYThQVGdndjVEUDhiU0F2TlhzQkxxejlxSjhUTVU2dTBVVytH?=
 =?utf-8?B?R256NXBVd3Zid09PZnJjekJMbzk4bFRvbmxwUHh1YnkwZzROeXBvVkh4UTdp?=
 =?utf-8?B?aUxyV1BUaUlyWk5QVmFDMk9CZVp1YjhrK0dUMG9oazBHUnREWmJZcVVNYS9m?=
 =?utf-8?B?cTNrRFIreUdzalNtZk9ldTVDb1FGK1FKME1Lam1ka1hnVXNFRG42dlN3b3o4?=
 =?utf-8?B?RmJZWTNVTlhDQjcwTTVCRjVsVnJFMG12bHBHbjBxZ1JLWlBpOUo3eVh1SFNh?=
 =?utf-8?B?R3VOTENnZStOenNLbUQyOEwwenMvVnNYVGlrR2ljSzNxMzN4MUw3RGtnOUdY?=
 =?utf-8?B?bUx0N212WWtlcGFYb0xJQjFKSnc0R0MrMURBZEcvZmRZa2VTcktKSEk4T1ha?=
 =?utf-8?B?dWloL2lsQXMydXVFRTJneGtSN0EwMlZua0ovZEFHYWRPMlQ4ZHR6bHVkWDAy?=
 =?utf-8?B?cWhjZzk1N2w5REJYZEJYNlA3M1B3Tkp5K210UGc5UnVRWThFdzEzK210NXYw?=
 =?utf-8?B?SStZc3B5Q2pmRjAzUjFUSklHY1h1MzBJaGovQzQrSWNiZS9Sb0RPZ2cycWgw?=
 =?utf-8?B?d21KWDlXdjAzUGRhUlpXeVBTeTBoMXlwaFV0NlRwTHV2VHJMOVNwdkxLNTE0?=
 =?utf-8?B?MnJVaGY1TkdZUkxNV0lBMW5FRmRYaFM2Q0pmUFFESDR0c29qYzhETlhmZ0NQ?=
 =?utf-8?B?MXJIVGhtZ2UvSVFoT0NSZUtha2IyNENhMjNqVC9oMTZJMFlXOUp6SUt4eHMx?=
 =?utf-8?B?dGMrU3VGOVR6WTl4T0hOWUZXUWhucXIyZnFrRWVHQWFRMkxEaWhoeFFYS1FZ?=
 =?utf-8?B?Z3FIYVg3RXZNWmZwRGxrVVlhdEZiT3NicnRmeXFPUlVCN0pLenJ1RGh6NjRa?=
 =?utf-8?B?Wk1ZeUFoak56dlI0TklpaERtOVZCcHpHdkhuZUpHaHJtVVU4TG94SmF2bDRD?=
 =?utf-8?B?TEhkN1FEMEU2SkVSWW1Zd1ZpN2c0bWN5eEJLSUdhY2I1YVp5V0tXNkhMalNx?=
 =?utf-8?B?eUp1cEliSmQ0YkE1QzllWk95R2Z3ZEx0ZTVDdldmT01mREt3S0JLa1JrcUcw?=
 =?utf-8?B?VkEvKzVncXg0bmlUOXkzOWhML00rUGJNRGhsNG8weGVEdlErSG96OHRGcnVr?=
 =?utf-8?Q?Gm9+B9iukEl8KqEv9J5e07fNN8lvAoTQO1drU3/?=
x-ms-exchange-transport-forked: True
Content-ID: <88C74794307D2F4397D3892DD78FF4CD@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c522fe33-bb54-4577-c26b-08d8f003c16e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 03:03:39.2410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e58HvgzUL+FDQn4Iv76jXF/LSwFD+MTS+wVDY93Q11Wpsf9wohe4hwnIIQtRzmgNvjiHtsx22zH2glGArla9VpHijrqK+bq5E/tRWd8Rt9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6077
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallopt:fix compiling error
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGl1DQo+IG1hbGxvcHQwMS5jOjMzOjM6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9u
IG9mIGZ1bmN0aW9uIOKAmHByaW50X21hbGxpbmZv4oCZDQo+IFstV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQ0KPiAgICAgcHJpbnRfbWFsbGluZm8oIlRlc3QgdW9yZGJsa3MiLCZpbmZv
KTsNCj4gICAgICAgIF4NCj4gL3RtcC9jY09VMHM3ZS5vOiBJbiBmdW5jdGlvbiBgdGVzdF9tYWxs
b3B0JzoNCj4gL3Jvb3QvbXl3b3JrL2x0cF9naXRodWIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9tYWxsb3B0L21hbGxvcHQwMS5jOjM3Og0KPiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwcmlu
dF9tYWxsaW5mbycNCj4gL3Jvb3QvbXl3b3JrL2x0cF9naXRodWIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9tYWxsb3B0L21hbGxvcHQwMS5jOjMzOg0KPiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBwcmludF9tYWxsaW5mbycNClVzdWFsbHksIGlmIGdsaWJjIHN1cHBvcnRzIG1hbGxvcHQsIGl0
IHNob3VsZCBhbHNvIHN1cHBvcnQgbWFsbGluZm8uIFNvIA0KSSBndWVzcyB5b3UgbWV0IHRoaXMg
cHJvYmxlbSBiZWNhdXNlIHlvdXIgY29tcGlsZSBlbnZpcm9tZW50IHdhdCBub3QgY2xlYW4uDQpQ
bGVhc2UgdHJ5IGFnYWluIGFzIHRoZSBmb2xsb3dpbmcgc3RlcDoNCm1ha2UgZGlzdGNsZWFuDQpt
YWtlIGF1dG90b29scw0KLi9jb25maWd1cmUNCmNkIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
bWFsbG9wdC8NCm1ha2UNCj4NCj4gU2lnbmVkLW9mZi1ieTogWGlucGVuZyBMaXU8bGl1eHAxMUBj
aGluYXRlbGVjb20uY24+DQo+IC0tLQ0KPiAgIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvbWFs
bG9wdC9tYWxsb3B0MDEuYyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYWxsb3B0L21h
bGxvcHQwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9tYWxsb3B0L21hbGxvcHQwMS5j
DQo+IGluZGV4IDhmZjQ2NDkuLmJiNzIzNGYgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvbWFsbG9wdC9tYWxsb3B0MDEuYw0KPiArKysgYi90ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL21hbGxvcHQvbWFsbG9wdDAxLmMNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gICAg
Ki8NCj4NCj4NCj4gKyNkZWZpbmUgSEFWRV9NQUxMSU5GTw0KV2UgaGF2ZSBjaGVja2VkIG1hbGxp
bmZvIGZ1bmN0aW9uIGluIGNvbmZpZ3VyZS5hYy4gV2UgbmV2ZXIgZGVmaW5lIHRoaXMgDQpkaXJl
Y3RseS4NCj4gICAjaW5jbHVkZSAiLi4vbWFsbGluZm8vbWFsbGluZm9fY29tbW9uLmgiDQo+ICAg
I2luY2x1ZGUgInRzdF9zYWZlX21hY3Jvcy5oIg0KPg0KDQpCZXN0IFJlZ2FyZHMNCllhbmcgWHUK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
