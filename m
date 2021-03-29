Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FF34CCFE
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 11:26:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD7053C8C14
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 11:26:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 931363C25E0
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 11:26:50 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 11ACF1400779
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 11:26:48 +0200 (CEST)
IronPort-SDR: pZ7obxUEGZOUrB1irzqD8MVkkiaDbPWZBpPBN9ozCs2WtFKnYEoR6lyiqVqy+aeFmIXpL26ejB
 MyPdJtMQ35/WszaaZNmCEoXyeZo7pcoUxUY89YfaEAV1kwui4hr2qMXyvZO3E3jJQMc4AVZ76f
 f22K705YU100s89J/X2Ym81DMKusTKVPd/rp90tDCl9xjR0v7Hy2nH0ME3eUcpLynfRSDp3s2i
 lKmKBI2XXgN9HoXLNezSmqpSIekRQKPB7KabF3ZcjyGAs/qbWosK3DBrntSOQ2S3b5cBjoD1fW
 b5Q=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="36886449"
X-IronPort-AV: E=Sophos;i="5.81,287,1610377200"; d="scan'208,217";a="36886449"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 18:26:48 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbmPyt0Xs0v2Pdxp03YW5Hv23+kyID0mgIo2exH+ZWMHkGRYIru1feeUjU4PvTkX2/AIPJRmTc86JC3QiDshLYzsIgMMqdROleGbXD1yhqiRAlx8S6j3ScANx1dosFGSLWp9LL4kdSCiftWAyRnTJBIZ2nZI/kF9AJ3MdjXmWLG+TkTaVATK9RKBllnjsL+YXkdYwndcbZkueMkWcqLC1OTp+H7/HgLB0JaSZethABlFwsmseHTD7+xnSXOxqtU4srHCJXPltGVyfDvI0XtTFOzbwRopSTRWP6B0zaK9AIQsHHtnkeHPkXkqYp5z22Us3ioEw5KXkttnFBdHUhwbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naK8yFHs6/sDaszfDgN2exxOHfRos07V/DFwuZuUD8U=;
 b=CWsgNu3JubFIjw/OPl6DXSiYF/R9ooPaMd1qFHCknGmFTfKVVIFe4tjpCKCb+yaLttU+GvtCOMBb/uMFphLiap7VsQY4zeaMMh7h45VfCRf2L1H/9voqZbv83/+jTfpMIc+OoL7aoZgSxEukJeRD+hxQ9iF2yBnJHHs5fGUQmoG514+STNbHK2fVmdsrHZVoAI5+CuRsjlEMJoWrVlvHvirqRq/LUWuhcUR43d+0VGSpx9skKk/5S8RpXAgri4kTIvZpShh8J4JJs5FHxp6bgA+VNrgJ2xJ+BggsS9wupnxEvRr3ocpYEGYfylAQaN+RSSRPk76ciBrkSB77C9EaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naK8yFHs6/sDaszfDgN2exxOHfRos07V/DFwuZuUD8U=;
 b=Jp6fFsx81Fi98hFn75Kk+XEa/5QqAdnlNRqYY6gFSKwYQbYRYAZvabUlsQYzZBfZ71DNMtSzOuUktGrG64nMLLBQpK+Mkx6pXjyTUtAHB/uJJgia4Pbe4b5uh3tXFQMLsLn24BKI9gmcRdorLXT3UnWX8hIQDVYyGCTEWLzJx74=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5850.jpnprd01.prod.outlook.com (2603:1096:404:8056::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 09:26:44 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 09:26:44 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Pankaj Vinodrao Joshi <Pankaj.VJ@exaleapsemi.com>
Thread-Topic: [LTP] msgstress03, msgstress04 failure on linux 5.10.19 and
 5.10.22
Thread-Index: AQHXJGwWxl0WDSPtLkqhLksJFACpdqqasnSA
Date: Mon, 29 Mar 2021 09:26:44 +0000
Message-ID: <60619D5B.6090507@fujitsu.com>
References: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB2870.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: exaleapsemi.com; dkim=none (message not signed)
 header.d=none;exaleapsemi.com; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c533215-0527-44a1-84ea-08d8f294c4fd
x-ms-traffictypediagnostic: TYAPR01MB5850:
x-microsoft-antispam-prvs: <TYAPR01MB585057B27A60AB8A744F708BFD7E9@TYAPR01MB5850.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SPgAu6ZVkQrBqoNwxgShKo7xtCHrEhfUsnSI6XVlgDbeusYluiSwn7aVLYir1TYKDHMWjJ21u3qux3aIdcbsgudJYJfhPpbjbPcQOj6Bj7t+wYlCUa+ZDVqDXJsFUbNwLvv3SG8HlEPCe7xO9tV/eGMBCBwV1SmmJ30Or6HQYrOXqyI/OUQc42wjQ+H6KqD6crDk2KXXLJ0AM4zUBgg/pQ2MDDn6Mc4Zq6QKqGeobYpyxU6AwG3kK/bJ3PgjTeiVm83KUI6mANVt59Td4pnTRZoPZXo1zOOqLI9RZlEmtruw57fqdp698foshQ7vv/gUci3ViCKSM511t2aYf8llvaarCA1I37qecXjhHSgwc11BViTnfdBxgjgv0sCPZv91dYoHdoXeuB9QtAfn+JKCPdLwjyAAUwflBrZFuyUxPFaTSMlttUz1Sui4B+akq6N23o+zWfvCkvbv8ySdK6McNHAsh2QJhTaGDo3btKPc0C/LLDwiv2exCFZH5gfc5WRTswlJyeQbBS+wm0qbZQL0vUfExRgIF+Dj2oPu+OfPB0PB4MAdcEnJesJzA0yNO098Mrbj/6ylzAyu83ABMtmfzWedomA1HPsBULjM0g2Sf7hKAIq2i0rEl4bZBy77up2Eh4UuulXlZnKlIaK4vRSzjXYhoooIfIHNrbBhZ/iDABe//Fv66QYfHEFL0P5Kr4kTfsls0FaAKf3Ol1F3cEj/eTwGz5A2PhcyOXpBYTZfeE+wDpfb3EVTcVr46u2XokkB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(6512007)(38100700001)(26005)(2616005)(316002)(36756003)(71200400001)(186003)(21615005)(85182001)(2906002)(6506007)(8936002)(8676002)(478600001)(91956017)(87266011)(66556008)(19627405001)(66446008)(83380400001)(33656002)(4326008)(166002)(66946007)(66476007)(76116006)(6916009)(6486002)(5660300002)(64756008)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?TWhzNDYydUllZTZSUmRwRklMWklST2JSOS9MdnFpSlhTbUdRdkpLOTErTEZX?=
 =?gb2312?B?dk16SzFoRlVyWHBYTzA3SzliY09lcnFKcnk1b0lEaGxHQ0UyaktYTDlVRWEr?=
 =?gb2312?B?R3lZZSs4VFdjVmozZ0V1M25NZTZ3RnVEUTNqS1JLcmhZSm1yc2F6NU5oYlBB?=
 =?gb2312?B?clpnMU9qV1d2eEN1eFdqWm0reTFwcUpCN084Wm5MS29hcWViblV0QXNrUk9l?=
 =?gb2312?B?TFFoU2hVR2ZWZFdVZGFwMk4wdXBNUm1kcTNTTnV1c1pLWjd1SERsQkU3ZTVH?=
 =?gb2312?B?bkM5WHlOV0tMRW52Tm5sTXYvVER3TUFQbjZmNzhlRmlzMjljUE9XK3Y1S3N2?=
 =?gb2312?B?elVKZzdBQ2NCOVYzRTFwMk5FYWJIVFZzR0liNmI1V1p3MGlpVG1HL3ZjMC8w?=
 =?gb2312?B?V1hEUXdpZnhvY3ZTeWRXaTZyaU01anI0MzQrVm9ScDliWUQxZVhYTG9DOVhu?=
 =?gb2312?B?SmpXYm01RjhqcmdYbC9xMmMwc2FXRWM3Z1R2S2cwZHk2cnJJL2NkTDBsZk9t?=
 =?gb2312?B?c2h3Q0pZTmNxdHY1OWJDcTRGWldIM2p2UUkyenIvMlVKZURvclpHUExXeTdI?=
 =?gb2312?B?aXU2YTlsbDU3S2JTSTZ2VnlTdHFxTFB5anZTb01mU1R4YWF6b2NueWdraEcz?=
 =?gb2312?B?ZGI5VFV5bktDZThDZVhsUVdOWXR4R09XTDVObWFwRTU1d2QvWEF3aGZGUHQz?=
 =?gb2312?B?ZFB3VUxHUkd4OWIwQkxJS1E0ZStvWFcyM1EvLzRFNFFXNEVBWXp6enZ6TmJC?=
 =?gb2312?B?K3ZaY3RETThTSzJEc1p3bVN4V3F2MklBSVYvMXZsT3Aybk9JUHQ0K1BQRlZI?=
 =?gb2312?B?R1NmWFVMRjBMV3prMHNVdmRiazZBS2VLQ2Q0d0M5c09ia2duOWc2N2FhaHY1?=
 =?gb2312?B?OUF6c1RqNkUvUS8xL05EUklNMFo4dzh3YXBMM0NId3ZVK3U1TUk2MUdkbXcx?=
 =?gb2312?B?ODVxUFJvbTJ3N2RzMW43aGRZVmVvL1hKUGdDNFIyZTIzdFB5MWIxemtGeUMy?=
 =?gb2312?B?WTJkTWt1ODVINlFuMnBLR0tSRnhTRTN0bDgzdHRnSGxZQ0g1M3c5Z3E2V0F2?=
 =?gb2312?B?bGN3c2xNYVlBVjFiYmhkOStndVptUW1iekR2WU4xdlRMQUdBVlNPaGhibTdK?=
 =?gb2312?B?dEtzRU92SzQySVlkKzRFeTBtanBEQnFQMTZUbDNHYVNLYTVrVHdHSlk5NnRs?=
 =?gb2312?B?K1ZDTHQrRDBaWTFCODltVE1pRGJiMjIzeHl4Ym1JYlRRUHozb2k3T1V2Zy9I?=
 =?gb2312?B?c1d3UHdUWXR2S011cEhrMi9xOURpTUlVM082d2pKc2UzNGo3WmZWSnZtSHhE?=
 =?gb2312?B?MWt2ZWw2UVZxbm03ZHgxTWZqWHJ3dUppeEFrQTNXQ1JuMExwbnZIT3Q1Qnkz?=
 =?gb2312?B?Q20wT25xOVdmZXB6Zld4dkFudmw2ekVOc0RocGk0RTVnTXBUZWRmci9RWWtl?=
 =?gb2312?B?YjhPZXpFcFBqcTVUTzFSWG4wanJsMFlKaWFieWlleFI1T2FJRnFnWFZERmEz?=
 =?gb2312?B?ckNZM2ZTbnEyY2d4a3Iwa1RjMDVNUmVjWHJhTkVzN1B3bnowUks4MUtybnVB?=
 =?gb2312?B?QzdhVWkyV1hWU1dUdm5oOXducVFXYkljWGFhNlJJemR1SDM1Rjd2VUE4bDBl?=
 =?gb2312?B?MldubFU5SW04K2FKdEZDbVJYSGg3cGNnbTVSbis5bGZ1VCs3aWRmaEF5OXdk?=
 =?gb2312?B?Q0FBUzEwejRwdGprSTBid3o1ODBZaE9Fa3g5dUN1VC9yZC9lWkhLNm5QK3N0?=
 =?gb2312?Q?Udd6UMfFElcBiHh7LdBIDH49xgOHp97TnmS8eRh?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c533215-0527-44a1-84ea-08d8f294c4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 09:26:44.6418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9z0LOEDZTVQ8yTlX2eajIoKWuiMLPV0L/dUHrUEbpalbhDiWtRWaNkEvCS8wNzr95wCgDy7lLGZ9mXYRA2jxRX+I8VdRbgANPkO+twJ2bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5850
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] msgstress03,
 msgstress04 failure on linux 5.10.19 and 5.10.22
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
Content-Type: multipart/mixed; boundary="===============0365142749=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0365142749==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_60619D5B6090507fujitsucom_"

--_000_60619D5B6090507fujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkNCkhpLA0KSSBhbSBydW5uaW5nIG1zZ3N0cmVzczAzLG1zZ3N0cmVzczA0IHdpdGggNS4xMC4x
OSBhbmQgNS4xMC4yMiBjdXN0b20ga2VybmVsIGJ1aWx0IHVzaW5nIFlvY3RvIGJ1dCBib3RoIHRl
c3QgYXJlIGdldHRpbmcgZmFpbGVkIHJlcGVhdGVkbHkuIGkgYW0gbm90IGFibGUgdG8gdW5kZXJz
dGFuZCB3aGF0IG1ha2luZyBib3RoIHRlc3QgdG8gZmFpbCBzaW5jZSB0aGVzZSB0ZXN0cyBhcmUg
c3RyZXNzIHRlc3RzIGZvciBtZXNzYWdlIHF1ZXVlIHdhbnQgdG8gZmlndXJlIGlmIGFueXRoaW5n
IGdvaW5nIHdyb25nIHdpdGggbWVzc2FnZSBxdWV1ZS4NCg0KUGFzdGluZyBmZXcgZXJyb3IgbWVz
c2FnZSBhbmQgYXR0YWNoaW5nIGRldGFpbGVkIGxvZ3Mgb2YgZmFpbHVyZXMNCg0KbXNnc3RyZXNz
MDM6LQ0KbXNnc25kKCkgZXJyb3IgaW4gY2hpbGQgOTQ1OCwgd3JpdGUgIyA9IDEwMDAwLCBrZXkg
PSA2NWUyZDljNDogSW50ZXJydXB0ZWQgc3lzdGVtIGNhbGwNCm1zZ3N0cmVzczAzICAgIDEgIFRC
Uk9LICA6ICB0c3Rfc2lnLmM6MjMyOiB1bmV4cGVjdGVkIHNpZ25hbCBTSUdJTlQoMikgcmVjZWl2
ZWQgKHBpZCA9IDQzOTAyKS4NCm1zZ3N0cmVzczAzICAgIDIgIFRCUk9LICA6ICB0c3Rfc2lnLmM6
MjMyOiBSZW1haW5pbmcgY2FzZXMgYnJva2VuDQptc2dzdHJlc3MwMyAgICAxICBUQlJPSyAgOiAg
dHN0X3NpZy5jOjIzMjogdW5leHBlY3RlZCBzaWduYWwgU0lHSU5UKDIpIHJlY2VpdmVkIChwaWQg
PSA0MzkyNSkuDQptc2dzdHJlc3MwMyAgICAyICBUQlJPSyAgOiAgdHN0X3NpZy5jOjIzMjogUmVt
YWluaW5nIGNhc2VzIGJyb2tlbg0KbXNnc3RyZXNzMDMgICAgMCAgVFdBUk4gIDogIHRzdF90bXBk
aXIuYzozMzY6IHRzdF9ybWRpcjogcm1vYmooL3RtcC9sdHAtOVJhejl0eWtwcS9tc2dRYUFEOGkp
IGZhaWxlZDogQ2Fubm90IG9wZW4gZGlyZWN0b3J5IC90bXAvbHRwLTlSYXo5dHlrcHEvbXNnUWFB
RDhpOyBlcnJubz0yOiBFTk9FTlQNCm1zZ3N0cmVzczAzICAgIDEgIFRCUk9LICA6ICB0c3Rfc2ln
LmM6MjMyOiB1bmV4cGVjdGVkIHNpZ25hbCBTSUdJTlQoMikgcmVjZWl2ZWQgKHBpZCA9IDQzOTI3
KS4NCm1zZ3N0cmVzczAzICAgIDIgIFRCUk9LICA6ICB0c3Rfc2lnLmM6MjMyOiBSZW1haW5pbmcg
Y2FzZXMgYnJva2VuDQptc2dzdHJlc3MwMyAgICAwICBUV0FSTiAgOiAgdHN0X3RtcGRpci5jOjMz
NjogdHN0X3JtZGlyOiBybW9iaigvdG1wL2x0cC05UmF6OXR5a3BxL21zZ1FhQUQ4aSkgZmFpbGVk
OiBDYW5ub3Qgb3BlbiBkaXJlY3RvcnkgL3RtcC9sdHAtOVJhejl0eWtwcS9tc2dRYUFEOGk7IGVy
cm5vPTI6IEVOT0VOVA0KbXNnc25kKCkgZXJyb3IgaW4gY2hpbGQgOTQ2OCwgd3JpdGUgIyA9IDEw
MDAwLCBrZXkgPSA1MzY0YTRhYzogSW50ZXJydXB0ZWQgc3lzdGVtIGNhbGwNCm1zZ3N0cmVzczAz
ICAgIDEgIFRCUk9LICA6ICB0c3Rfc2lnLmM6MjMyOiB1bmV4cGVjdGVkIHNpZ25hbCBTSUdJTlQo
MikgcmVjZWl2ZWQgKHBpZCA9IDQzOTE4KS4NCm1zZ3N0cmVzczAzICAgIDIgIFRCUk9LICA6ICB0
c3Rfc2lnLmM6MjMyOiBSZW1haW5pbmcgY2FzZXMgYnJva2VuDQptc2dzdHJlc3MwMyAgICAwICBU
V0FSTiAgOiAgdHN0X3RtcGRpci5jOjMzNjogdHN0X3JtZGlyOiBybW9iaigvdG1wL2x0cC05UmF6
OXR5a3BxL21zZ1FhQUQ4aSkgZmFpbGVkOiB1bmxpbmsoL3RtcC9sdHAtOVJhejl0eWtwcS9tc2dR
YUFEOGkpIGZhaWxlZDsgZXJybm89MjogRU5PRU5UDQptc2dzbmQoKSBlcnJvciBpbiBjaGlsZCA5
NDUwLCB3cml0ZSAjID0gMTAwMDAsIGtleSA9IDYwMTVlZjQ4OiBJbnRlcnJ1cHRlZCBzeXN0ZW0g
Y2FsbA0KbXNnc3RyZXNzMDMgICAgMSAgVEJST0sgIDogIHRzdF9zaWcuYzoyMzI6IHVuZXhwZWN0
ZWQgc2lnbmFsIFNJR0lOVCgyKSByZWNlaXZlZCAocGlkID0gNDM4ODMpLg0KbXNnc3RyZXNzMDMg
ICAgMiAgVEJST0sgIDogIHRzdF9zaWcuYzoyMzI6IFJlbWFpbmluZyBjYXNlcyBicm9rZW4NCm1z
Z3N0cmVzczAzICAgIDAgIFRXQVJOICA6ICB0c3RfdG1wZGlyLmM6MzM2OiB0c3Rfcm1kaXI6IHJt
b2JqKC90bXAvbHRwLTlSYXo5dHlrcHEvbXNnUWFBRDhpKSBmYWlsZWQ6IHVubGluaygvdG1wL2x0
cC05UmF6OXR5a3BxL21zZ1FhQUQ4aSkgZmFpbGVkOyBlcnJubz0yOiBFTk9FTlQNCm1zZ3N0cmVz
czAzICAgIDEgIFRCUk9LICA6ICB0c3Rfc2lnLmM6MjMyOiB1bmV4cGVjdGVkIHNpZ25hbCBTSUdJ
TlQoMikgcmVjZWl2ZWQgKHBpZCA9IDQzOTI0KS4NCm1zZ3N0cmVzczAzICAgIDIgIFRCUk9LICA6
ICB0c3Rfc2lnLmM6MjMyOiBSZW1haW5pbmcgY2FzZXMgYnJva2VuDQptc2dzdHJlc3MwMyAgICAw
ICBUV0FSTiAgOiAgdHN0X3RtcGRpci5jOjMzNjogdHN0X3JtZGlyOiBybW9iaigvdG1wL2x0cC05
UmF6OXR5a3BxL21zZ1FhQUQ4aSkgZmFpbGVkOiB1bmxpbmsoL3RtcC9sdHAtOVJhejl0eWtwcS9t
c2dRYUFEOGkpIGZhaWxlZDsgZXJybm89MjogRU5PRU5UDQptc2dzbmQoKSBlcnJvciBpbiBjaGls
ZCA5NDU0LCB3cml0ZSAjID0gMTAwMDAsIGtleSA9IDM3ZWZiMTNhOiBJbnRlcnJ1cHRlZCBzeXN0
ZW0gY2FsbA0KDQptc2dzdHJlc3MwNDotDQptc2dzdHJlc3MwNCAgICAwICBUSU5GTyAgOiAgRm91
bmQgMzE5OTQgYXZhaWxhYmxlIG1lc3NhZ2UgcXVldWVzDQptc2dzdHJlc3MwNCAgICAwICBUSU5G
TyAgOiAgVXNpbmcgdXB0byAyMDk3MTA0IHBpZHMNCkZvcmsgZmFpbHVyZSBpbiB0aGUgc2Vjb25k
IGNoaWxkIG9mIGNoaWxkIGdyb3VwIDkyMTgNCkZvciBtc2dzdHJlc3MwNCwgSXQgaXMgYSBrbm93
biBpc3N1ZVsxXS4gdGhlIGZvcmsgZmFpbCByZWFzb24gc2VlWzJdLg0KSSBoYXZlIHNlbnQgYSBw
YXRjaHNldFszXSB0byBjbGVhbnVwIHRoZXNlIG1zZ3N0cmVzcyBjYXNlIHJlY2VudGx5IGFuZCB0
aGVuIEkgd2lsbCBhZGQgYSBwcm9jZXNzIG51bSBsaW1pdCBhY2NvcmRpbmcgdG8gYXZhaWFibGUg
bWVtb3J5Lg0KDQpbMV1odHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0cC9p
c3N1ZXMvNTA5DQpbMl1odHRwOi8vbGlzdHMubGludXguaXQvcGlwZXJtYWlsL2x0cC8yMDIwLUp1
bmUvMDE3NjE5Lmh0bWwNClszXWh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
dHAvcGF0Y2gvMTYxNTU1MDU0MS0yMTcxNC0xLWdpdC1zZW5kLWVtYWlsLXh1eWFuZzIwMTguanlA
Y24uZnVqaXRzdS5jb20vDQpGb3JrIGZhaWx1cmUgaW4gdGhlIGZpcnN0IGNoaWxkIG9mIGNoaWxk
IGdyb3VwIDkxOTgNCkZvcmsgZmFpbHVyZSBpbiB0aGUgZmlyc3QgY2hpbGQgb2YgY2hpbGQgZ3Jv
dXAgOTIxNg0KRm9yayBmYWlsdXJlIGluIHRoZSBmaXJzdCBjaGlsZCBvZiBjaGlsZCBncm91cCA5
MjA4DQpGb3JrIGZhaWx1cmUgaW4gdGhlIGZpcnN0IGNoaWxkIG9mIGNoaWxkIGdyb3VwIDkyNTAN
CkZvcmsgZmFpbHVyZSBpbiB0aGUgc2Vjb25kIGNoaWxkIG9mIGNoaWxkIGdyb3VwIDkyNDkNCkZv
cmsgZmFpbHVyZSBpbiB0aGUgZmlyc3QgY2hpbGQgb2YgY2hpbGQgZ3JvdXAgOTIzMA0KRm9yayBm
YWlsdXJlIGluIHRoZSBmaXJzdCBjaGlsZCBvZiBjaGlsZCBncm91cCA5MjMzDQpGb3JrIGZhaWx1
cmUgaW4gdGhlIGZpcnN0IGNoaWxkIG9mIGNoaWxkIGdyb3VwIDkyNDcNCkZvcmsgZmFpbHVyZSBp
biB0aGUgZmlyc3QgY2hpbGQgb2YgY2hpbGQgZ3JvdXAgOTI1NA0KRm9yayBmYWlsdXJlIGluIHRo
ZSBzZWNvbmQgY2hpbGQgb2YgY2hpbGQgZ3JvdXAgOTIyOA0KRm9yayBmYWlsdXJlIGluIHRoZSBz
ZWNvbmQgY2hpbGQgb2YgY2hpbGQgZ3JvdXAgOTI1Mw0KRm9yayBmYWlsdXJlIGluIHRoZSBmaXJz
dCBjaGlsZCBvZiBjaGlsZCBncm91cCA5MjQyDQpGb3JrIGZhaWx1cmUgaW4gdGhlIHNlY29uZCBj
aGlsZCBvZiBjaGlsZCBncm91cCA5MjQ2DQpGb3JrIGZhaWx1cmUgaW4gdGhlIGZpcnN0IGNoaWxk
IG9mIGNoaWxkIGdyb3VwIDkyNDMNCkZvcmsgZmFpbHVyZSBpbiB0aGUgc2Vjb25kIGNoaWxkIG9m
IGNoaWxkIGdyb3VwIDkyNDANCkZvcmsgZmFpbHVyZSBpbiB0aGUgc2Vjb25kIGNoaWxkIG9mIGNo
aWxkIGdyb3VwIDkyMzgNCkZvcmsgZmFpbHVyZSBpbiB0aGUgZmlyc3QgY2hpbGQgb2YgY2hpbGQg
Z3JvdXAgOTI1Mg0KbXNnc3RyZXNzMDQgICAgMSAgVEZBSUwgIDogIG1zZ3N0cmVzczA0LmM6MjA0
OiBGb3JrIGZhaWxlZCAobWF5IGJlIE9LIGlmIHVuZGVyIHN0cmVzcykNCkZvcmsgZmFpbHVyZSBp
biB0aGUgc2Vjb25kIGNoaWxkIG9mIGNoaWxkIGdyb3VwIDkyMzQNCg0KS2luZGx5IGhlbHAgdG8g
Z2V0IHRoZSBmYWlsdXJlIHJlc29sdmVkLg0KDQpUaGFua3MNCg0KDQoNCg0KDQoNCg0KDQoNCg==

--_000_60619D5B6090507fujitsucom_
Content-Type: text/html; charset="gb2312"
Content-ID: <9CC864EE8EDC2549A249F136496D8450@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Hi<br>
<blockquote cite=3D"mid:BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB287=
0.INDPRD01.PROD.OUTLOOK.COM" type=3D"cite">
<style type=3D"text/css" style=3D"display: none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
I am running msgstress03,msgstress04 with 5.10.19 and 5.10.22 custom kernel=
 built using Yocto but both test are getting failed repeatedly. i am not ab=
le to understand what making both test to fail since these tests are stress=
 tests for message queue want to
 figure if anything going wrong with message queue.</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Pasting few error message and attaching detailed logs of failures<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<b>msgstress03:-</b><br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
msgsnd() error in child 9458, write # =3D 10000, key =3D 65e2d9c4: Interrup=
ted system call
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43902).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43925).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: Cannot open direct=
ory /tmp/ltp-9Raz9tykpq/msgQaAD8i; errno=3D2: ENOENT</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43927).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: Cannot open direct=
ory /tmp/ltp-9Raz9tykpq/msgQaAD8i; errno=3D2: ENOENT</div>
<div>msgsnd() error in child 9468, write # =3D 10000, key =3D 5364a4ac: Int=
errupted system call</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43918).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
<div>msgsnd() error in child 9450, write # =3D 10000, key =3D 6015ef48: Int=
errupted system call</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43883).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
<div>msgstress03 &nbsp; &nbsp;1 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: un=
expected signal SIGINT(2) received (pid =3D 43924).</div>
<div>msgstress03 &nbsp; &nbsp;2 &nbsp;TBROK &nbsp;: &nbsp;tst_sig.c:232: Re=
maining cases broken</div>
<div>msgstress03 &nbsp; &nbsp;0 &nbsp;TWARN &nbsp;: &nbsp;tst_tmpdir.c:336:=
 tst_rmdir: rmobj(/tmp/ltp-9Raz9tykpq/msgQaAD8i) failed: unlink(/tmp/ltp-9R=
az9tykpq/msgQaAD8i) failed; errno=3D2: ENOENT</div>
msgsnd() error in child 9454, write # =3D 10000, key =3D 37efb13a: Interrup=
ted system call</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<b>msgstress04:-</b></div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
msgstress04 &nbsp; &nbsp;0 &nbsp;TINFO &nbsp;: &nbsp;Found 31994 available =
message queues
<div>msgstress04 &nbsp; &nbsp;0 &nbsp;TINFO &nbsp;: &nbsp;Using upto 209710=
4 pids</div>
<div>Fork failure in the second child of child group 9218</div>
</div>
</blockquote>
For msgstress04, It is a known issue[1]. the fork fail reason see[2].<br>
I have sent a patchset[3] to cleanup these msgstress case recently and then=
 I will add a process num limit according to avaiable memory.<br>
<br>
[1]<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/linux-test=
-project/ltp/issues/509">https://github.com/linux-test-project/ltp/issues/5=
09</a><br>
[2]<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linux.it/piperma=
il/ltp/2020-June/017619.html">http://lists.linux.it/pipermail/ltp/2020-June=
/017619.html</a><br>
[3]<a class=3D"moz-txt-link-freetext" href=3D"https://patchwork.ozlabs.org/=
project/ltp/patch/1615550541-21714-1-git-send-email-xuyang2018.jy@cn.fujits=
u.com/">https://patchwork.ozlabs.org/project/ltp/patch/1615550541-21714-1-g=
it-send-email-xuyang2018.jy@cn.fujitsu.com/</a><br>
<blockquote cite=3D"mid:BMXPR01MB287023E7E5B34F6D27B63564EE7E9@BMXPR01MB287=
0.INDPRD01.PROD.OUTLOOK.COM" type=3D"cite">
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<div>Fork failure in the first child of child group 9198</div>
<div>Fork failure in the first child of child group 9216</div>
<div>Fork failure in the first child of child group 9208</div>
<div>Fork failure in the first child of child group 9250</div>
<div>Fork failure in the second child of child group 9249</div>
<div>Fork failure in the first child of child group 9230</div>
<div>Fork failure in the first child of child group 9233</div>
<div>Fork failure in the first child of child group 9247</div>
<div>Fork failure in the first child of child group 9254</div>
<div>Fork failure in the second child of child group 9228</div>
<div>Fork failure in the second child of child group 9253</div>
<div>Fork failure in the first child of child group 9242</div>
<div>Fork failure in the second child of child group 9246</div>
<div>Fork failure in the first child of child group 9243</div>
<div>Fork failure in the second child of child group 9240</div>
<div>Fork failure in the second child of child group 9238</div>
<div>Fork failure in the first child of child group 9252</div>
<div>msgstress04 &nbsp; &nbsp;1 &nbsp;TFAIL &nbsp;: &nbsp;msgstress04.c:204=
: Fork failed (may be OK if under stress)</div>
Fork failure in the second child of child group 9234</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Kindly help to get the failure resolved.</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri,Arial,Helvetica,sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Thanks<br>
</div>
<pre wrap=3D"">
<fieldset class=3D"mimeAttachmentHeader"></fieldset>

</pre>
</blockquote>
<pre>
</pre>
</body>
</html>

--_000_60619D5B6090507fujitsucom_--

--===============0365142749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0365142749==--
