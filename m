Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB43565D5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:55:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91B563C1DF7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:55:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E25FA3C1DDE
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:55:07 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A9CF0600706
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:55:06 +0200 (CEST)
IronPort-SDR: vhsVYf2YMscZnItR+6Tj0fPlRNXrUWhg9Ms/WxX75MKLRMLGvCPnqOfZPLAg+5xQuUBbTV6dCo
 W00v5vZ3DudH486KGx8CcC9sgRpgfZsPpnU5JCUrVy5jez6fB9oc0FKYDE/jx5Aiokib3CEfiC
 lLosHI5YCbKmc3tD/GfukYU+63rQgr6sy7B4WWw4+MIAunS56pNXxDyVt1FIMtLslKmXqj7/Wp
 dcU+cDtwK/qgi96KPaUqMOXkp9HP8aNBsWZN/K3+0rIa9dz3dsT/T/nr1IfeS9SRUOuE30vSmF
 Jzc=
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="29355777"
X-IronPort-AV: E=Sophos;i="5.82,201,1613401200"; d="scan'208";a="29355777"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 16:55:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O61UFRWSe2MNgwbz/et7mF6GZ5G2M6XXcEPlsZsx1BYA8+BNutgBQ1DOY0NalsmSaYtsZIDFMZWZILvQBjN9TUB0IKF5AHJtE5J9FBMooDhHFod5ekQpJ+5SPXHKHKoIPRnMjbXtAKnbUNm4jLcfPXdw7cQeNAghAq4F1YpRCuJrI81hmqM70SUzIb33i/Lx4ioQnE3pr3oLYMp9AOBPLOk3UgTbQIeRphTtDSAeMFSR+95uIAfI3IOXUmp02MKoEtTHoKdH76mt/01FV1ebseofRia5CEoUTTo/UjNeARYpndw3K0XCwfnSNi/aP1NGW4+k2ELXNVY4kwCX1k/TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+dSErH+6taPESfO/K1Db3/HsIKW78ju93W1BSEGIxI=;
 b=jyJqG8bg821x2PQWr5w0JdanYrzSlVUOYhl+Sq3URJbRofW3DG5ncA+RBV9E6giAcwXj8OcbFJNgqLJvcYn/FEbSvox3TXgxezn9vLFBZfsrdX3a/BZO8qgzR+q7d/Nc7BUhDPQCi3AszV2QAsg1oEaVGF065RvIo1jfUEmEZGKgkrGHn7qBS+NWF1xxecPMx0+H2jHBLbYXAGUmiGcmC9f/ltoacqX0BOwI/8Wbk1OeryDku5rEz0EJT7JTKBEov3n0LtYr0q1UoAU2nb+lDI4sAD6j2bCwmWJwD2nt+h3S9w5+JgThUEB/ep7A7AlqghhiQtaTRD4MXXXg2hrUhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+dSErH+6taPESfO/K1Db3/HsIKW78ju93W1BSEGIxI=;
 b=hVcsnSr/HNMr+15gHX2EgYkIZUxkhcOrg1lPdMNv/FObbDKOVmnh39EANTv2bL5+WGDhCRx/hMfUrzxfum0BVauPmptXndanugC1zc9OJxSocfzpY+rSrbx1SPJPHGKf7TSWxVHqGcambsxxqCPhOrYH+J7igArXJj/YRREn18Q=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB3357.jpnprd01.prod.outlook.com (2603:1096:404:bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Wed, 7 Apr
 2021 07:55:01 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 07:55:01 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
Thread-Index: AQHXK2yyXOMGz6mRi0K8CC5WAA4iGaqop2aAgAAZL4A=
Date: Wed, 7 Apr 2021 07:55:01 +0000
Message-ID: <606D736F.6000605@fujitsu.com>
References: <1617775951-3717-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <606D5E48.1060307@fujitsu.com>
In-Reply-To: <606D5E48.1060307@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff5c99c9-73c6-4a99-5858-08d8f99a728e
x-ms-traffictypediagnostic: TYAPR01MB3357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB33575B86E858F86068D259D4FD759@TYAPR01MB3357.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1ZDheCzF8/d6wr2K4IuUAE3QrCpc7KBimtED2XZf6wTUdxM4T4lk7smckr7Md/T2nnNUv3Mmg+/boZksXCe3zSKwGnFhPFIMzlTEvVZjS24dVXHbxMHoWfMebjOojx7Wv49utNOuwt8u0+9IIi+XweQumShGzQvsei56ot1GJAyCP8vK4e349qo98q+jc61ybF3rd5vtwoczpEs0HhTcm+l7h6Ee8nkY7FyHRvzuyFcaaevVIhTM8cbGT1tbOyaQ4J3Xnk81Spx/z+s8AOSw4AZXu5fzJ1gxxbzMBK7aq+SaTaOw5S9qExEo0/d/k6+PNEri4hs/UgOItGWIKDnMOtp/l77REzF/kedXjQqnVdgDBgmm0B0f8PvO8o5bnXg3OGHkjVYw8em3b/md4Vw1DfvNXpkc91zKxh10ZjRFPXLT5WmY0pCbRgI6NqEasKxtSxd6y7iOvxCqZum8JuImy9UkyIFq/NpOee19UoEMJS/Olb11/YjQmDuAweXMrgy3XxrZA7sfjckOiqbDW+LMNtkylJv/IBsgZ1KAHCOss0d752qELr0GNQb80+6rUj/eyRdeFoV7ZMO6dungvpTALwNcFyn6TZhgMuGDB03wKSKaox4OMJ+iz1pfilOgyXU5+1rhtyy7AtnoCyy1GAnujRmoeHSH5hWnl0fgT80ItL/b8ErvxnIEzdbH6gfGk3wi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(71200400001)(8936002)(186003)(2906002)(36756003)(33656002)(64756008)(53546011)(86362001)(26005)(8676002)(87266011)(85182001)(478600001)(6636002)(66556008)(2616005)(4326008)(316002)(6486002)(38100700001)(76116006)(54906003)(91956017)(66446008)(37006003)(6862004)(5660300002)(6506007)(6512007)(83380400001)(66476007)(66946007)(3076002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?YUkyWCtUMG1PSUZxSVhDTmlGb2tzNUErQkpobFVJMWVEZ3JYMnIrUUljRkJQ?=
 =?gb2312?B?YWlUUzlTYm9ad2c4SVNBNjdldE9ubFBENC9Sam5lN21rWGNCSzBNUGZsczZo?=
 =?gb2312?B?dWtITG9zODluZjhOVm5BQzdMQUtOa0FBT1dXRGNscDBrRkk1T3FRdkFIdzZU?=
 =?gb2312?B?L2xMUTU5VXB4MCtNNVdIWmR2OUNObGVBSkRRRFlocVBHcWVIS3U4UTMrdEpw?=
 =?gb2312?B?RWdnVk5rb2pDbkxiT25HaFEyVlRCaUVYc00xY3QraEtOdlUzeWdJVUQxZ1h3?=
 =?gb2312?B?a0RIOStxY1R0eGJ6Y3RidXhja1hxZ09xY0lxVHhENWJDLzVqbmNuMEhoZW5J?=
 =?gb2312?B?Rk95bDB0MXFxTUFoWUVqVXRNdzVROHhOSDUrbzV1c0tmaXFXMUVYNUttbFZw?=
 =?gb2312?B?ZUUrNDNrcEVaUTRicTMwSjRmVFhKUmhMRXlqWXcyUnRlL3Z4cEtqZlF2SzlF?=
 =?gb2312?B?ZDJPTU1kaWVOY3BxRTdtQUVzM1hLc2xRazhyZFdTYnpERGVJOWFSMXY1VCsw?=
 =?gb2312?B?Y2JBRVU0VVd5NEcwVkJHSm5WWGRtdnhMQVlsbHhiY29zOG0wS0x4N0FuTGwx?=
 =?gb2312?B?UE85OGtpbUg0SDJ3Q0FqeXBTMWtMa05ScnB5NzJIQkNzR0lqaXAwdVRHUWJn?=
 =?gb2312?B?aDgyMWxlMC91L2pHS3FpNGRacDhlOHVVTVQrVlc3ZVhtU014emgxc3hMNjhB?=
 =?gb2312?B?SXNHVWxLNW1sZGpIS2g1WjRyUStIRU92aTZBV1krVng1NzEwUEs3SXFXR2xh?=
 =?gb2312?B?VExma3JaaXg5dGZzdS90VkJtRTBRM1JoeWw4N2dnSFMzdnlxdngzZy9lY2lM?=
 =?gb2312?B?UHBpL1BKanhPK3F2YmE2c01zYTdCZGZyNnFoWEtuWXFaQ0ZaUlJOL3F4N2sr?=
 =?gb2312?B?WGp0bW1xdGJZVXo4QTE3SmVYVnhKZ1JUSFRVQllVOFFiaitibjBsRnZkTXRR?=
 =?gb2312?B?cjB6Y0dRYVVja0w1Qmt0eG8xTUlYNXFCb3YvZHhlVWhhT2UybFNJYWFhaVYx?=
 =?gb2312?B?cTdaMy91dnRabnY5QjJzdWZRdlJBTE93cEtCZWpaOFpCUS81RjR6bmhqbkNp?=
 =?gb2312?B?dzZQVk9OZkdBY05wais5KzI1NGgzWkE5bElvUUZwS241SkJDcmlMY3JNcmli?=
 =?gb2312?B?K1YyT1hYUkRwb3lTajRMWnpiZ2VrYk9iNzdZY0VpbVgzQ1ZNUkRpWnhrTGlu?=
 =?gb2312?B?Mys0N3pZN0lmb3Bpejl3dit5SEx5RFgzc3RRUTM4V3E3Qjd3M0N3Qy9CZGM4?=
 =?gb2312?B?dFB3aDdRR0dXOEhHSS84eEZRY3VKN3pQUk1MQzNENTVpT0wyOGUvcmVkdXhz?=
 =?gb2312?B?ZEs3MzFVT09uU3pHbDNsSllZMXUxdy90QUF4TDRucVFBNENob1hRWDZQWUdU?=
 =?gb2312?B?R1hEOWhsbXZvdGplVXduTzdvS1RSSzd1ajloOVlVM3l4QTRXWUY4TzhRZjRh?=
 =?gb2312?B?UldMZEpIMXdSR0Mxb1NnampONWpRbFY1aitDK3U4RlFJQk9oR3J6RkNQSS9M?=
 =?gb2312?B?cCsrN3FmaHlIM0xFMjZYTFFsWHVpTCtCM0EveFFRL3ZxK2FRMm5ESXlLMEZB?=
 =?gb2312?B?Rno5eHBXRFBpRU9QeFkvbGk2RWtFbmdCYTFEYS9uNlViNjNFRUNGeWZhaTBL?=
 =?gb2312?B?cmdxUEwyM1JPeGNMYnk2VTJDR0ozUDR1YW9EZWlVc0k5UHhjZy9yZklOYnpi?=
 =?gb2312?B?SUpGZHhiYUhzNjhUbjN5dGpNZWlrSU5KZm5rcWREb29Rc2hoR1dNSXZMdjlX?=
 =?gb2312?Q?BldWVI35srvXYXc46U8F0287JQvm0Tv/ABvtzo5?=
Content-ID: <F7DC18BE71ED024CA5B44041F4B19C2C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5c99c9-73c6-4a99-5858-08d8f99a728e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 07:55:01.3792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yK7aopgiRqZMhAt5Ht9ynXeTl9r7Hy2BCQ1jgdp4NmDNvgGfpl05dcHqAT2rfGVy5gBFaWTlwPuxpwHODLl3FLcwnoTwt3t0yzvbxlWpkeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3357
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
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

SGkgWGlhbw0KPiBPbiAyMDIxLzQvNyAxNDoxMiwgWWFuZyBYdSB3cm90ZToNCj4+IFNpbmNlIDUu
MyBrZXJuZWwgY29tbWl0IDdlMzViNDI1OTFjMCAoImtidWlsZDogcmVtb3ZlIFNVQkRJUlMgc3Vw
cG9ydCIpLA0KPj4gU1VCRElSUyBoYXMgYmVlbiByZW1vdmVkLiBXZSBjYW4gb25seSB1c2UgbWFr
ZSBNPWRpciBvciBzZXQgdGhlIGVudmlyb25tZW50DQo+PiB2YXJpYWJsZSBLQlVJTERfRVhUTU9E
IHRvIHNwZWNpZnkgdGhlIGRpcmVjdG9yeSBvZiBleHRlcm5hbCBtb2R1bGUgdG8gYnVpbGQuDQo+
IEhpIFh1LA0KPiANCj4gT25lIG1pc3NpbmcgTWFrZWZpbGU6DQo+IHRlc3RjYXNlcy9rZXJuZWwv
ZGV2aWNlLWRyaXZlcnMvZGV2X3NpbV9mcmFtZXdvcmsva2VybmVsX3NwYWNlL01ha2VmaWxlDQpU
aGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEkgd2lsbCBzZW5kIGEgdjIuDQo+IA0KPj4gU2lnbmVk
LW9mZi1ieTogWWFuZyBYdTx4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tPg0KPj4gLS0tDQo+PiAg
ICAuLi4va2VybmVsL2RldmljZS1kcml2ZXJzL2FncC9rZXJuZWxfc3BhY2UvTWFrZWZpbGUgICAg
fCAgNCArKy0tDQo+PiAgICB0ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2Jhc2UvdGJh
c2UvTWFrZWZpbGUgICAgfCAgNCArKy0tDQo+PiAgICAuLi4va2VybmVsL2RldmljZS1kcml2ZXJz
L2RybS9rZXJuZWxfc3BhY2UvTWFrZWZpbGUgICAgfCAgMiArLQ0KPj4gICAgdGVzdGNhc2VzL2tl
cm5lbC9kZXZpY2UtZHJpdmVycy9pbmNsdWRlL01ha2VmaWxlICAgICAgIHwgIDQgKystLQ0KPj4g
ICAgLi4uL21pc2NfbW9kdWxlcy9wZXJfY3B1X2FsbG9jYXRvcl9tb2R1bGUvTWFrZWZpbGUgICAg
IHwgIDggKysrKy0tLS0NCj4+ICAgIHRlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvbmxz
L01ha2VmaWxlICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPj4gICAgdGVzdGNhc2VzL2tlcm5lbC9k
ZXZpY2UtZHJpdmVycy91c2IvdHVzYi9NYWtlZmlsZSAgICAgIHwgMTAgKysrKystLS0tLQ0KPj4g
ICAgLi4uL2tlcm5lbC9kZXZpY2UtZHJpdmVycy92NGwva2VybmVsX3NwYWNlL01ha2VmaWxlICAg
IHwgIDggKysrKy0tLS0NCj4+ICAgIHRlc3RjYXNlcy9rZXJuZWwvZnMvc2NzaS9sdHBmcy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4+ICAgIDkgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3Rj
YXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYWdwL2tlcm5lbF9zcGFjZS9NYWtlZmlsZSBiL3Rl
c3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYWdwL2tlcm5lbF9zcGFjZS9NYWtlZmlsZQ0K
Pj4gaW5kZXggNTM1N2MxMzVlLi41YTEwMDY0ZjAgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0Y2FzZXMv
a2VybmVsL2RldmljZS1kcml2ZXJzL2FncC9rZXJuZWxfc3BhY2UvTWFrZWZpbGUNCj4+ICsrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYWdwL2tlcm5lbF9zcGFjZS9NYWtlZmls
ZQ0KPj4gQEAgLTE0LDggKzE0LDggQEAgS0RJUgk6PSAvbGliL21vZHVsZXMvJChzaGVsbCB1bmFt
ZSAtcikvYnVpbGQNCj4+ICAgIFBXRAk6PSAkKHNoZWxsIHB3ZCkNCj4+DQo+PiAgICBkZWZhdWx0
Og0KPj4gLQkkKE1BS0UpIC1DICQoS0RJUikgIFNVQkRJUlM9JChQV0QpIG1vZHVsZXMNCj4+IC0j
CSQoTUFLRSkgLUMgJChLRVJORUxESVIpIFNVQkRJUlM9JChQV0QpIG1vZHVsZXMNCj4+ICsJJChN
QUtFKSAtQyAkKEtESVIpIE09JChQV0QpIG1vZHVsZXMNCj4+ICsjCSQoTUFLRSkgLUMgJChLRVJO
RUxESVIpIE09JChQV0QpIG1vZHVsZXMNCj4gDQo+IElzIGl0IG5lY2Vzc2FyeSB0byB1cGRhdGUg
dGhlc2UgY29tbWVudHM/IEluIG90aGVyIHdvcmRzLCBjb3VsZCB3ZQ0KPiByZW1vdmUgdGhlc2Ug
Y29tbWVudHMgZGlyZWN0bHk/DQpUaGVzZSBtYWtlZmlsZXMgYWxsIGhhdmUgdGhlIGZvbGxvd2lu
ZyBjb21tZW50Og0KIw0KIyBNYWtlZmlsZSBmb3IgR0NPViBwcm9maWxpbmcga2VybmVsIG1vZHVs
ZQ0KIw0KDQojS0VSTkVMRElSIDo9IC91c3Ivc3JjL2xpbnV4LTIuNS42NC1nY292DQoNCkl0IG1h
eWJlIHVzZWQgdG8gdGVzdCBrZXJuZWwgbW9kdWxlIGNvdmVyYWdlLiBJIGFtIG5vdCBzdXJlLg0K
SSBndWVzcyB3ZSBjYW4gcmVtb3ZlIHRoZW0gaW4gYSBzZXBhcmF0ZSBwYXRjaCBpZiB0aGV5IGFy
ZSB1c2VsZXNzIGFmdGVyDQpkaXNjdXNzaW9uLg0KDQpAY3lyaWwscGV0cixMaSAgRG8geW91IGhh
dmUgc29tZSBhZHZpc2UgZm9yIHRoZXNlIGNvbW1lbnRzo78NCg0KQmVzdCBSZWdhcmRzDQpZYW5n
IFh1DQoNCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gWGlhbyBZYW5nDQo+PiAgICBlbmRpZg0KPj4N
Cj4+ICAgIGNsZWFuOg0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRy
aXZlcnMvYmFzZS90YmFzZS9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZl
cnMvYmFzZS90YmFzZS9NYWtlZmlsZQ0KPj4gaW5kZXggNmY3ZTVlMmMxLi41ZTVhNDBlNjEgMTAw
NjQ0DQo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2Jhc2UvdGJhc2Uv
TWFrZWZpbGUNCj4+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvYmFzZS90
YmFzZS9NYWtlZmlsZQ0KPj4gQEAgLTEzLDggKzEzLDggQEAgS0RJUgk6PSAvbGliL21vZHVsZXMv
JChzaGVsbCB1bmFtZSAtcikvYnVpbGQNCj4+ICAgIFBXRAk6PSAkKHNoZWxsIHB3ZCkNCj4+DQo+
PiAgICBkZWZhdWx0Og0KPj4gLQkkKE1BS0UpIC1DICQoS0RJUikgU1VCRElSUz0kKFBXRCkgbW9k
dWxlcw0KPj4gLSMJJChNQUtFKSAtQyAkKEtFUk5FTERJUikgU1VCRElSUz0kKFBXRCkgbW9kdWxl
cw0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgbW9kdWxlcw0KPj4gKyMJJChNQUtF
KSAtQyAkKEtFUk5FTERJUikgTT0kKFBXRCkgbW9kdWxlcw0KPj4gICAgZW5kaWYNCj4+DQo+PiAg
ICBjbGVhbjoNCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJz
L2RybS9rZXJuZWxfc3BhY2UvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2
ZXJzL2RybS9rZXJuZWxfc3BhY2UvTWFrZWZpbGUNCj4+IGluZGV4IDExZTU0ZDliZS4uMjRiNzY4
ZDc2IDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9kcm0v
a2VybmVsX3NwYWNlL01ha2VmaWxlDQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1k
cml2ZXJzL2RybS9rZXJuZWxfc3BhY2UvTWFrZWZpbGUNCj4+IEBAIC0xMSw3ICsxMSw3IEBAIEtE
SVIJOj0gL2xpYi9tb2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIpL2J1aWxkDQo+PiAgICBQV0QJOj0g
JChzaGVsbCBwd2QpDQo+Pg0KPj4gICAgZGVmYXVsdDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIp
IFNVQkRJUlM9JChQV0QpICBtb2R1bGVzDQo+PiArCSQoTUFLRSkgLUMgJChLRElSKSBNPSQoUFdE
KSAgbW9kdWxlcw0KPj4gICAgZW5kaWYNCj4+DQo+PiAgICBjbGVhbjoNCj4+IGRpZmYgLS1naXQg
YS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvTWFrZWZpbGUgYi90ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL2luY2x1ZGUvTWFrZWZpbGUNCj4+IGluZGV4IGM5
ODEwYmE1ZS4uNzJkNzI5M2MyIDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZp
Y2UtZHJpdmVycy9pbmNsdWRlL01ha2VmaWxlDQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2Rl
dmljZS1kcml2ZXJzL2luY2x1ZGUvTWFrZWZpbGUNCj4+IEBAIC0xMyw5ICsxMyw5IEBAIEtESVIJ
Oj0gL2xpYi9tb2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIpL2J1aWxkDQo+PiAgICBQV0QJOj0gJChz
aGVsbCBwd2QpDQo+Pg0KPj4gICAgZGVmYXVsdDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNV
QkRJUlM9JChQV0QpIG1vZHVsZXMNCj4+ICsJJChNQUtFKSAtQyAkKEtESVIpIE09JChQV0QpIG1v
ZHVsZXMNCj4+ICAgIAkke0NDfSAtV2FsbCAtbyB1c2VyQmxvY2tJbmNsdWRlIHVzZXJCbG9ja0lu
Y2x1ZGUuYw0KPj4gLSMJJChNQUtFKSAtQyAkKEtFUk5FTERJUikgU1VCRElSUz0kKFBXRCkgbW9k
dWxlcw0KPj4gKyMJJChNQUtFKSAtQyAkKEtFUk5FTERJUikgTT0kKFBXRCkgbW9kdWxlcw0KPj4g
ICAgZW5kaWYNCj4+DQo+PiAgICBjbGVhbjoNCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL2RldmljZS1kcml2ZXJzL21pc2NfbW9kdWxlcy9wZXJfY3B1X2FsbG9jYXRvcl9tb2R1bGUv
TWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL21pc2NfbW9kdWxlcy9w
ZXJfY3B1X2FsbG9jYXRvcl9tb2R1bGUvTWFrZWZpbGUNCj4+IGluZGV4IDNiYzI3NGRhZC4uYWU4
MDJmNzdjIDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9t
aXNjX21vZHVsZXMvcGVyX2NwdV9hbGxvY2F0b3JfbW9kdWxlL01ha2VmaWxlDQo+PiArKysgYi90
ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL21pc2NfbW9kdWxlcy9wZXJfY3B1X2FsbG9j
YXRvcl9tb2R1bGUvTWFrZWZpbGUNCj4+IEBAIC05LDE2ICs5LDE2IEBAIEtESVIJOj0gL2xpYi9t
b2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIpL2J1aWxkDQo+PiAgICBQV0QJOj0gJChzaGVsbCBwd2Qp
DQo+Pg0KPj4gICAgbW9kdWxlczoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQ
V0QpIG1vZHVsZXMNCj4+ICsJJChNQUtFKSAtQyAkKEtESVIpIE09JChQV0QpIG1vZHVsZXMNCj4+
DQo+PiAgICBjbGVhbjoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQV0QpIGNs
ZWFuDQo+PiArCSQoTUFLRSkgLUMgJChLRElSKSBNPSQoUFdEKSBjbGVhbg0KPj4gICAgCXJtIC1m
IG1vZHVsZXMub3JkZXINCj4+DQo+PiAgICBoZWxwOg0KPj4gLQkkKE1BS0UpIC1DICQoS0RJUikg
U1VCRElSUz0kKFBXRCkgaGVscA0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgaGVs
cA0KPj4NCj4+ICAgIG1vZHVsZXNfaW5zdGFsbDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNV
QkRJUlM9JChQV0QpIG1vZHVsZXNfaW5zdGFsbA0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0k
KFBXRCkgbW9kdWxlc19pbnN0YWxsDQo+Pg0KPj4gICAgZW5kaWYNCj4+IGRpZmYgLS1naXQgYS90
ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25scy9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9r
ZXJuZWwvZGV2aWNlLWRyaXZlcnMvbmxzL01ha2VmaWxlDQo+PiBpbmRleCAxNzI1MTBmZTguLmEx
ZmFiMjBmOCAxMDA2NDQNCj4+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMv
bmxzL01ha2VmaWxlDQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL25s
cy9NYWtlZmlsZQ0KPj4gQEAgLTEyLDEyICsxMiwxMiBAQCBLRElSCTo9IC9saWIvbW9kdWxlcy8k
KHNoZWxsIHVuYW1lIC1yKS9idWlsZA0KPj4gICAgUFdECTo9ICQoc2hlbGwgcHdkKQ0KPj4NCj4+
ICAgIGRlZmF1bHQ6DQo+PiAtCSQoTUFLRSkgLUMgJChLRElSKSBTVUJESVJTPSQoUFdEKSBtb2R1
bGVzDQo+PiArCSQoTUFLRSkgLUMgJChLRElSKSBNPSQoUFdEKSBtb2R1bGVzDQo+PiAgICAJJHtD
Q30gJChFWFRSQV9DRkxBR1MpIC1vIHVzZXJCbG9ja05MUyB1c2VyQmxvY2tOTFMuYw0KPj4gLSMJ
JChNQUtFKSAtQyAkKEtFUk5FTERJUikgU1VCRElSUz0kKFBXRCkgbW9kdWxlcw0KPj4gKyMJJChN
QUtFKSAtQyAkKEtFUk5FTERJUikgTT0kKFBXRCkgbW9kdWxlcw0KPj4NCj4+ICAgIGNsZWFuOg0K
Pj4gLQkkKE1BS0UpIC1DICQoS0RJUikgU1VCRElSUz0kKFBXRCkgY2xlYW4NCj4+ICsJJChNQUtF
KSAtQyAkKEtESVIpIE09JChQV0QpIGNsZWFuDQo+PiAgICAJcm0gLWYgbW9kdWxlcy5vcmRlcg0K
Pj4gICAgCXJtIC1mIHVzZXJCbG9ja05MUw0KPj4NCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL2RldmljZS1kcml2ZXJzL3VzYi90dXNiL01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5l
bC9kZXZpY2UtZHJpdmVycy91c2IvdHVzYi9NYWtlZmlsZQ0KPj4gaW5kZXggOTQ4OGNkNTYzLi40
ZGNiY2EzNmMgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJz
L3VzYi90dXNiL01ha2VmaWxlDQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2
ZXJzL3VzYi90dXNiL01ha2VmaWxlDQo+PiBAQCAtMTMsMTcgKzEzLDE3IEBAIEtESVIJOj0gL2xp
Yi9tb2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIpL2J1aWxkDQo+PiAgICBQV0QJOj0gJChzaGVsbCBw
d2QpDQo+Pg0KPj4gICAgZGVmYXVsdDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9
JChQV0QpIG1vZHVsZXMNCj4+IC0jCSQoTUFLRSkgLUMgJChLRVJORUxESVIpIFNVQkRJUlM9JChQ
V0QpIG1vZHVsZXMNCj4+ICsJJChNQUtFKSAtQyAkKEtESVIpIE09JChQV0QpIG1vZHVsZXMNCj4+
ICsjCSQoTUFLRSkgLUMgJChLRVJORUxESVIpIE09JChQV0QpIG1vZHVsZXMNCj4+DQo+PiAgICBj
bGVhbjoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQV0QpIGNsZWFuDQo+PiAr
CSQoTUFLRSkgLUMgJChLRElSKSBNPSQoUFdEKSBjbGVhbg0KPj4gICAgCXJtIC1mIG1vZHVsZXMu
b3JkZXINCj4+DQo+PiAgICBoZWxwOg0KPj4gLQkkKE1BS0UpIC1DICQoS0RJUikgU1VCRElSUz0k
KFBXRCkgaGVscA0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgaGVscA0KPj4NCj4+
ICAgIG1vZHVsZXNfaW5zdGFsbDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQ
V0QpIG1vZHVsZXNfaW5zdGFsbA0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgbW9k
dWxlc19pbnN0YWxsDQo+Pg0KPj4gICAgZW5kaWYNCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL2RldmljZS1kcml2ZXJzL3Y0bC9rZXJuZWxfc3BhY2UvTWFrZWZpbGUgYi90ZXN0Y2Fz
ZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3Y0bC9rZXJuZWxfc3BhY2UvTWFrZWZpbGUNCj4+IGlu
ZGV4IDU2ZTI1NWIwNC4uNTQ5YzM3ZDVjIDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5l
bC9kZXZpY2UtZHJpdmVycy92NGwva2VybmVsX3NwYWNlL01ha2VmaWxlDQo+PiArKysgYi90ZXN0
Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3Y0bC9rZXJuZWxfc3BhY2UvTWFrZWZpbGUNCj4+
IEBAIC05LDE2ICs5LDE2IEBAIEtESVIJOj0gL2xpYi9tb2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIp
L2J1aWxkDQo+PiAgICBQV0QJOj0gJChzaGVsbCBwd2QpDQo+Pg0KPj4gICAgbW9kdWxlczoNCj4+
IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQV0QpIG1vZHVsZXMNCj4+ICsJJChNQUtF
KSAtQyAkKEtESVIpIE09JChQV0QpIG1vZHVsZXMNCj4+DQo+PiAgICBjbGVhbjoNCj4+IC0JJChN
QUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQV0QpIGNsZWFuDQo+PiArCSQoTUFLRSkgLUMgJChL
RElSKSBNPSQoUFdEKSBjbGVhbg0KPj4gICAgCXJtIC1mIG1vZHVsZXMub3JkZXINCj4+DQo+PiAg
ICBoZWxwOg0KPj4gLQkkKE1BS0UpIC1DICQoS0RJUikgU1VCRElSUz0kKFBXRCkgaGVscA0KPj4g
KwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgaGVscA0KPj4NCj4+ICAgIG1vZHVsZXNfaW5z
dGFsbDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9JChQV0QpIG1vZHVsZXNfaW5z
dGFsbA0KPj4gKwkkKE1BS0UpIC1DICQoS0RJUikgTT0kKFBXRCkgbW9kdWxlc19pbnN0YWxsDQo+
Pg0KPj4gICAgZW5kaWYNCj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2ZzL3Njc2kv
bHRwZnMvTWFrZWZpbGUgYi90ZXN0Y2FzZXMva2VybmVsL2ZzL3Njc2kvbHRwZnMvTWFrZWZpbGUN
Cj4+IGluZGV4IDdjNDZhNGM0ZC4uNWY0MDMwNjYxIDEwMDY0NA0KPj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9mcy9zY3NpL2x0cGZzL01ha2VmaWxlDQo+PiArKysgYi90ZXN0Y2FzZXMva2VybmVs
L2ZzL3Njc2kvbHRwZnMvTWFrZWZpbGUNCj4+IEBAIC0xNCw5ICsxNCw5IEBAIEtESVIJOj0gL2xp
Yi9tb2R1bGVzLyQoc2hlbGwgdW5hbWUgLXIpL2J1aWxkDQo+PiAgICBQV0QJOj0gJChzaGVsbCBw
d2QpDQo+Pg0KPj4gICAgZGVmYXVsdDoNCj4+IC0JJChNQUtFKSAtQyAkKEtESVIpIFNVQkRJUlM9
JChQV0QpIG1vZHVsZXMNCj4+ICsJJChNQUtFKSAtQyAkKEtESVIpIE09JChQV0QpIG1vZHVsZXMN
Cj4+ICAgIAkke0NDfSAgJChDRkxBR1MpIC1vIGx0cGZzdGVzdCAtbG0gIG1haW4uYw0KPj4gLSMJ
JChNQUtFKSAtQyAkKEtFUk5FTERJUikgU1VCRElSUz0kKFBXRCkgbW9kdWxlcw0KPj4gKyMJJChN
QUtFKSAtQyAkKEtFUk5FTERJUikgTT0kKFBXRCkgbW9kdWxlcw0KPj4gICAgZW5kaWYNCj4+DQo+
PiAgICBjbGVhbjoNCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
