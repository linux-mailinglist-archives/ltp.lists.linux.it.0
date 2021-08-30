Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A63FB31A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:27:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 565E43C9ABE
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 11:27:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 38AA13C185E
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:27:06 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BB95D200929
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 11:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630315625; x=1661851625;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LfQukzMhjkEXNz4j571lx2ZIDYZsxvsI40iQCEntu78=;
 b=BtAoBbePLIOCcJA70FAAu1zizf0Ftnt5U2nr2UO/xjOEjJ77JB/SyzXJ
 IBdGhCJvx6FOJK9xt6pSXSD0QN7skW4pXMclAKQ4cbMSZYnX4FT8hoXuY
 E44ca64y6yKwkxHD5jXNx8k8JY7O+6WZPRBxu0tAhRICJ3CA5BMzEPo9y
 ZeoQAZBnaa/evEmAsNJjtYPI6sfoL2E2dbu2VhTgKVYIMnZIgX5AQrE7X
 oh3BnWqc9QH/A0E8vPOWHo3wcypFossrBu6kRc38E75ol36yVUZHGwb4T
 fV+iFZVruk7pLJ4MKB7Vr35++mrv5gSVAXuMbBQwmT5JBBVkL2zlfmCBh w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="46192112"
X-IronPort-AV: E=Sophos;i="5.84,363,1620658800"; d="scan'208";a="46192112"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 18:27:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwP7l35yNb3bm5t8RXXEie5tgd/HfI9DkMUxuLAkGOOLjnD8U3ToR7VRn3wApmfanCv+EGOQdlzWBXORq1ylZgQjNZAARtRffqf5nHuIm3elGRL9DTJiAbmjgQ3nhUzrylBzFVI2pp+opXZZwUYF3WzRIIUDlSkv+SzVSZo6SnIF1Pj1Zo1K8ctLS8EbTBR8ikNNyPyy4cssOXt+h3J+0VZu8qrVWB0n34czXyMB6Z3oDkpG3+jImPBjviBouQOFuolUI0AaAwaN5js5IylCn6bH9ZO7kePLEYdy0rvgQkxBHXN8BF3GkP3vs53aQKmIfNvST0erT5NVMKQxNMxU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQukzMhjkEXNz4j571lx2ZIDYZsxvsI40iQCEntu78=;
 b=TibHcB/BO8vb0IZwy3e1dMxS8exMXbgIcecs4EQELX7FNwNSlleG+M3oJM3wsgxxxZlQBR19eMYGPzGtg0iQJbgjNdfDh854fGD5YxYw5uabNylcJdLp1KG/tD5H0Yb1aiKJHN05Og+0NP45GYaj/bxICiZwNJ3aC5JpkeD0zqejMe16EX8dohVtGj5ATqs08avs6vl9HK09st4kzyq5Qj1yj0DiAP+5khbc0krA+dBL2b4w0hXYOMiiUv/0k67J7b+cmAphlaBAtWtg7K86Fw92m/VGUvruIia3xn2+1ZWpd/E1uWcv+/qhjS46/nAXWvURSEbbloiLebTb4KwenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQukzMhjkEXNz4j571lx2ZIDYZsxvsI40iQCEntu78=;
 b=TNXkXFW/zmp6VBXraFAIDM7CJfvcUDBRGvxBFo+imRWNvP2TntpfPg+YH4BdUaHEpLD/QIaYS60VYNgZ71AM29Agf/0j1X8vLru9a7UJpmB7Yygu8fpYEblV1KgdyX7eA/XRdny20VxfQfdFJI5Vjd/k3PPW8CKlpqZGVZoUNF8=
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com (2603:1096:404:e::16)
 by TYCPR01MB6605.jpnprd01.prod.outlook.com (2603:1096:400:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 09:26:58 +0000
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d]) by TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:26:58 +0000
From: "suy.fnst@fujitsu.com" <suy.fnst@fujitsu.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
Thread-Index: AQHXml3UZcoUQ2aMVkqdYiVBYmNh96uLyb/B
Date: Mon, 30 Aug 2021 09:26:58 +0000
Message-ID: <TY2PR01MB21246C459BBCD763BD1C0CBD89CB9@TY2PR01MB2124.jpnprd01.prod.outlook.com>
References: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
In-Reply-To: <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6b26c09-15d3-4591-ebb7-08d96b9850f8
x-ms-traffictypediagnostic: TYCPR01MB6605:
x-microsoft-antispam-prvs: <TYCPR01MB6605B3576F7545EA0C7DAFA789CB9@TYCPR01MB6605.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yyURtcdEo5u1KSpWj/N1RHeWxk+ZkTQ8JruEnT/oBDp+cjsItCFcxePE3nLd7NAf3Dvqi/MSgE0ULCoOC8FpzMu6QMSBcyRr9Q1PScl1bdClp2Fk84ANlfYILp9ysEqY2DZym0b9qEKSpec4Tyf2GFlvp5JIQTnFSJpnyy7PuMM2WqFQ0E7Dmu79a228MvEsp8MKlAOoeCOFwVFjaK2vvr3gPUlEz7rMzi0CRXmCLkWjHXzFYNJHjLp1t3G88Z1I4jzPh1mXl9z5kPNS2wBQmD+xZY9SzzW8dzBPTkickhk0b84TnF2ACrxllRofrPMqr782HeAJFnlJ7y87iDe8RK9zIraW48r9XuH3U3mBEAQBmMplMvUn156G620gGfPQkl0KakOnW+3WLOZ8pdyC2DoKf6MnoJiECXEUBKkV9GPlW5Bby6lYTt08mNt3+WTse3PFgSNHyGhB2v/ZXDRO+KwCWzznltz6QaRv2DyuxHt/k3KOPtnlhwBuxuBbVUI95p+Cfmqtvk/TmrKHpirIAyj8HrCyMXlWuL5vNlIQ4m9fI9HbFHytpXKrsAR3ZS5425BHlgvfvWneWNvfyHrf00JJ4Qa87InsreMmhFqpGreJZU9A+YiwsNlmeBF2utRnOkWRNGZRwo20gZtCIYFXu9CMRg59oTEZ31UQ18gR/f+9nmnSzC3XHKZKB1689NhjKPTjWRa4jUltj5ezKPHkEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2124.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(86362001)(5660300002)(66446008)(53546011)(91956017)(66946007)(110136005)(38100700002)(66476007)(122000001)(6506007)(64756008)(66556008)(76116006)(71200400001)(8936002)(38070700005)(26005)(478600001)(7696005)(55016002)(85182001)(9686003)(8676002)(52536014)(186003)(316002)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SEZUdmgwQnNsRXp2dUdPRkI5eWpXQlB5cEtGZ3ljSTNGSXRybXZQSFdzZ2p5?=
 =?gb2312?B?OFlRZ1VqeEh2b2p6OHpRN0w1YkRqUThPTFN6MndxbWtDRFpoUmswNll3eUcx?=
 =?gb2312?B?TmwzQW1oQWtTakdwTmkyNUNMTFB2Tlg1WU02RkdlUVV1K1FKdjZna1JuRjBK?=
 =?gb2312?B?YStVNjBKcEZwR1psMWlxbzRiRldLR2h0SkJlWVgvc3ZSZ2wwRHh5aVg4S1Zo?=
 =?gb2312?B?ZC85TVU5TFF5Uy93c29DNllQUXpZYm1aVjQwNW95TXVhUXdrMVFrQVI2YVN3?=
 =?gb2312?B?TmJ1bTJ2YXgwc0ZzZnMrcGxieFpVOWVhMzV0ZVhlblYrSFZVZnUyZE84czVL?=
 =?gb2312?B?V3lUaExuVGU5L3pDcURlVG12ckNzUXFRL2I3c1VhVDRQNjdiS3Y1M3UxRnB6?=
 =?gb2312?B?L3dPVmVuSDVKU1g3STlJUmsydGpyRy84L2xENWZWcnQxbXh5K3B3Slc4UHJP?=
 =?gb2312?B?MEtuQ0owMno0VW81QWk5NHIzZ1ZqSTQ5L1VXa2ozbmY3ci9sK0gwTVFOcys0?=
 =?gb2312?B?em1uUjB4RnNFUVBkSkx4eHBYc3pnUjIrTHRSQzFKYkdDQ3ozK0YxUitsSDdF?=
 =?gb2312?B?cG5UZnV3UDlRZnNFeFl1Zmd5NXBXejB6SWhMeGg3WnFRdnc5Q0xOUFVsTEVT?=
 =?gb2312?B?QWFyMllDUmFDYzNEODFNeUdGb1pTVVFGTG5qZVRIdHV0Q3lnTnIvQjZyMnZl?=
 =?gb2312?B?ZkFKaTMxTUszSDZXTFYvRi9YZFVCMDlOYUpJT0F0OWNlc1NwRVp5Tk5Hd3JE?=
 =?gb2312?B?K2hsaUkwV2JRZytQVXU1bThDcFhvdGRrcGxhWnhLWE9UNDVoODVYL1g5NEEr?=
 =?gb2312?B?SzA2blRwUFNDSjF4cjU0V3BJcHJmMTNvL0tydkhVdHlqbXdHUVlCQ3llcGdq?=
 =?gb2312?B?SGxjNlc2WTc0bE1FRHc3S2FUUDFOM1ZsR2d0OFA5ZnZzYVk3RFNESytxVSth?=
 =?gb2312?B?NmFlYUVxSXU2TzVSbExDWTB3bDRHSjIzd1ZhenZKTUJ4Y2dmMWI5SEdNcCtD?=
 =?gb2312?B?eXB1ZVlNVG9uNTN0ZU9NTFZ0TDBNbnJIaFNpWWpGWXFlcVc2TXhwb0JRQ0FP?=
 =?gb2312?B?M1RqNHVyYlhESWJzbXg1cFRUOTk0aDcvWld4Wjg4YTY1SjFWOHRXTklveVB6?=
 =?gb2312?B?M1BBam1uek5qbmlxUEZ0U0JqazFoeGpReWxuay9SeXQ0MDlqQU8wN1pQVDhX?=
 =?gb2312?B?b2dIdjUxOE5lUDdEYmJyZDlJTk1zZzR0OW14UGx1cjUxQVp3N0R4Zk9Rb2NV?=
 =?gb2312?B?d0lDSSs2eWIxVW5NZkp0aE92bGpaUlQ3b0x4d05oYWdaNHRuMmpvWW81Znoz?=
 =?gb2312?B?RE5TWkQ4M1g2dXJyd2dvYUZHeXpEQ3FsUDBoTFNMWXNGVnNhZGlTangvZmt1?=
 =?gb2312?B?aENheHROQkFhL29oMUFLTWFNMDkxQTY0K1E3d0Y1YWNPREFrNEdSMzhYWUJC?=
 =?gb2312?B?cDNYekdzejFvRVh3Nmd2bHh6WUd1eUdSaStRSmcyWVV2WURXK0NmaVVIaVIy?=
 =?gb2312?B?WnRRUDhrdUdOQitQdGVTTFhVQlE2YVYrblhyS3ZMZUp1NHlsM05wOUlackF6?=
 =?gb2312?B?TmMwTnpYOFFiTDJNcng3aXFQUXhNQmNpRWcyWE9xQmZCbGJKOG5xTGwyOW9q?=
 =?gb2312?B?S3psTGFiSUhDdE83S1kyV0VTYjVSMTQyTVIzVzllbU9wYXFCUWd1NWRMaEdm?=
 =?gb2312?B?LytLWkhkdk5GbVBjVmxwWi9SMm1nbTBNNGFyWDAvRDYzK3Q5RnIyb3J0N2FI?=
 =?gb2312?Q?dCz7v1wgDpV0KS1qlisVHGRAO5JD8GFZCleCR7v?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2124.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b26c09-15d3-4591-ebb7-08d96b9850f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 09:26:58.6168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sjtM+HgQni7UXPzQl3oPOnikJtx9XXQWcpa9YSAKvheQItaNZpe/4RNMd5eYVENm2afe1iDXQ5nMJiwDY/Sq4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6605
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCiAgSSBmb3VuZCB0aGF0IGl0J3MgaW5kZWVkIHJlbGF0ZWQgdG8gaXB2NiBEQUQgYXMgeW91
IHNhaWQuCkNhbGxpbmcKYGlwIG5ldG5zIGV4ZWMgbHRwX25zIHN5c2N0bCAtbiBuZXQuaXB2Ni5j
b25mLmx0cF9uc192ZXRoMS5hY2NlcHRfZGFkPTBgCm9yIHRzdF93YWl0X2lwdjZfZGFkKCkgYXQg
ZW5kIG9mIHRoZSBzZXR1cCBib3RoIHNvbHZlcyB0aGUgcHJvYmxlbS4KSG93ZXZlciB0aGVyZSBp
cyBvbmUgc3VwZXIgc3RyYW5nZSBwYXJ0IHRoYXQgdGhlIHRlbnRhdGl2ZSBhZGRyZXNzIGlzCnRo
ZSBsb2NhbCBsaW5rIGFkcmVzcyBvZiB0aGUgbHRwX25zX3ZldGgxOgoKNTogbHRwX25zX3ZldGgx
QGlmNDogPEJST0FEQ0FTVCxVUCxMT1dFUl9VUD4gbXR1IDE1MDAgcWRpc2Mgbm9xdWV1ZSBzdGF0
ZSBVUCBncm91cCBkZWZhdWx0IHFsZW4gMTAwMAogICAgbGluay9ldGhlciBmMjo4ZjoyNDpkNDpi
YToyNiBicmQgZmY6ZmY6ZmY6ZmY6ZmY6ZmYgbGluay1uZXRuc2lkIDAKICAgIGluZXQgMTAuMC4w
LjEvMjQgc2NvcGUgZ2xvYmFsIGx0cF9uc192ZXRoMQogICAgICAgdmFsaWRfbGZ0IGZvcmV2ZXIg
cHJlZmVycmVkX2xmdCBmb3JldmVyCiAgICBpbmV0NiBmZDAwOjE6MToxOjoxLzY0IHNjb3BlIGds
b2JhbCBub2RhZAogICAgICAgdmFsaWRfbGZ0IGZvcmV2ZXIgcHJlZmVycmVkX2xmdCBmb3JldmVy
CiAgICBpbmV0NiBmZTgwOjpmMDhmOjI0ZmY6ZmVkNDpiYTI2LzY0IHNjb3BlIGxpbmsgdGVudGF0
aXZlICAgICAgIDwtLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICB2YWxpZF9sZnQgZm9yZXZlciBw
cmVmZXJyZWRfbGZ0IGZvcmV2ZXIKCkhvd2V2ZXIsIHRoZXJlIGlzIG5vIHBsYWNlIHVzaW5nIHRo
ZSBhZGRyZXNzIGluIG1wbHMwMiB0ZXN0LgpJdCBtYWtlcyBtZSB3b25kZXIgaG93IGNvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIHRyaWdnZXIgdGhlIGlzc3VlLi4KClRoYW5rcyEKLS0KU3UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBBbGV4ZXkgS29kYW5ldiA8
YWxla3NlaS5rb2RhbmV2QGJlbGwtc3cuY29tPgpTZW50OiBUaHVyc2RheSwgQXVndXN0IDI2LCAy
MDIxIDE3OjM2ClRvOiBTdSwgWXVlL8vVINS9OyBsdHBAbGlzdHMubGludXguaXQKU3ViamVjdDog
UmU6IFtMVFBdIFtQQVRDSF0gbmV0d29yay9tcGxzOiBzbGVlcCAxIGFmdGVyIHNldHVwIGluIG1w
bHMwMgoKT24gMjYuMDguMjAyMSAwODoyNiwgc3V5LmZuc3RAZnVqaXRzdS5jb20gd3JvdGU6Cj4g
V2hpbGUgcnVubmluZyBtcGxzMDIuc2ggLTYgaW4gb3VyIHNsb3cgdGVzdCBib3ggd2l0aCBrZXJu
ZWwKPiB2ZXJzaW9uID4gdjUuMTEsIHdlIGZvdW5kIHRoZSB0ZXN0IGhhbmdzIGF0IHBpbmc2IG9j
Y2FzaW9uYWxseToKPgo+ICAgKyBncmVwIC1xICdpbnZhbGlkIG9wdGlvbicKPiAgICsgZm9yIHNp
emUgaW4gJHttc2dfc2l6ZXM6LSI1NiJ9Cj4gICArIEVYUEVDVF9QQVNTIHBpbmc2IC1JIGZkMDA6
MjM6OjIgLWMgNTAwIC1zIDEwIC1mIGZkMDA6MjM6OjEKPiAgICc+L2Rldi9udWxsJwo+ICAgKyBf
dHN0X2V4cGVjdF9wYXNzIHRzdF9yZXMgcGluZzYgLUkgZmQwMDoyMzo6MiAtYyA1MDAgLXMgMTAg
LWYKPiAgIGZkMDA6MjM6OjEgJz4vZGV2L251bGwnCj4gICArIGxvY2FsIGZuYz10c3RfcmVzCj4g
ICArIHNoaWZ0Cj4gICArIHRzdF9yb2QgcGluZzYgLUkgZmQwMDoyMzo6MiAtYyA1MDAgLXMgMTAg
LWYgZmQwMDoyMzo6MSAnPi9kZXYvbnVsbCcKPgo+IFRoZSB3ZWlyZCBwYXJ0IGlzIHRoYXQgbWFu
dWFsIHBpbmc2IHdvcmtzIGluIHRoZSBtZWFudGltZS4KPgo+IFRoZW4gd2UgZm91bmQgdGhhdCBh
ZGRpbmcgYHNsZWVwIDFgIGF0IGVuZCBvZiBtcGxzMDIuc2gvc2V0dXAoKSBtYWtlCj4gdGhlIHRl
c3QgcGFzcyBpbiAxMDAlLiBEaWcgZGVwcGVyIGluIHRoZSBwcm9ibGVtLCBmdHJhY2UgY2F0Y2hl
ZCBkdXJpbmcKPiB0aGUgMSBzZWNvbmQgc2hvd3MgKFRoZSB0ZXN0IHN0YXJ0ZWQgYXQgWyAzOTc5
LjQ4NTQ4OF0pOgo+Cj4gIDM5ODEuMjEwNzAxIHwgICAyKSBrd29ya2VyLTI0NzQyICB8ICAgICAg
ICAgICAgICAgfCAgYWRkcmNvbmZfZGFkX3dvcmsoKSB7Cj4gIDM5ODEuMjEwNzEyIHwgICAyKSBr
d29ya2VyLTI0NzQyICB8ICAgICAgICAgICAgICAgfCAgICBhZGRyY29uZl9kYWRfY29tcGxldGVk
KCkgewo+ICAzOTgxLjIxMDcxMiB8ICAgMikga3dvcmtlci0yNDc0MiAgfCAgIDAuNDE3IHVzICAg
IHwgICAgICBhZGRyY29uZl9kZWxfZGFkX3dvcmsoKTsKPiAgMzk4MS4yMTA3MTMgfCAgIDIpIGt3
b3JrZXItMjQ3NDIgIHwgICAgICAgICAgICAgICB8ICAgICAgX19pcHY2X2lmYV9ub3RpZnkoKSB7
Cj4gIDM5ODEuMjEwNzE2IHwgICAyKSBrd29ya2VyLTI0NzQyICB8ICAgMS4wOTcgdXMgICAgfCAg
ICAgICAgaW5ldDZfZmlsbF9pZmFkZHIoKTsKPiAgMzk4MS4yMTA3MzAgfCAgIDIpIGt3b3JrZXIt
MjQ3NDIgIHwgICAgICAgICAgICAgICB8ICAgICAgICBpcDZfaW5zX3J0KCkgewo+ICAzOTgxLjIx
MDczMSB8ICAgMikga3dvcmtlci0yNDc0MiAgfCAgICAgICAgICAgICAgIHwgICAgICAgICAgZmli
Nl9hZGQoKSB7Cj4KPiBJbiBrZXJuZWwsIGFkZHJjb25mX2RhZF93b3JrKCkgaXMgZGVsZWdhdGVk
IGJ5IGluZXQ2X2FkZHJfYWRkKCkgdG8gZG8KPiByb3V0ZSByZWxhdGVkIGpvYnMgaW4gYSBkZWxh
eWVkIHdvcmtxdWV1ZSAuIEhlbmNlLCB0aGVyZSBpcyB0aW55IHBlcmlvZAo+IHdlIG5lZWQgdG8g
d2FpdCBmb3IgaXQuIEFkZGluZyB0aGUgYHNsZWVwIDFgIHNlZW1zIHN1ZmZjaWVudCBmb3Igbm93
LgoKV2hhdCBpcyBoYXBwZW5pbmcgaW4gdGhlIHBpbmc2LCBpdCBpcyBPSyBmb3IgaXQgdG8gaGFu
ZyBvbiB0aGlzPwoKQWRkaW5nIG5vZGFkIHRvIGxvb3BiYWNrIG1pZ2h0IG9ubHkgY2hhbmdlIHRo
ZSBmbGFncyAocmVtb3ZlIHRlbnRhdGl2ZQppZiBpZmFfZmxhZ3M9PUlGQV9GX05PREFEKSwgdGhl
IGRlbGF5ZWQgZGFkIHdvcmsgc2hvdWxkIGJlIGNvbXBsZXRlZCBpbgphZGRyY29uZl9kYWRfYmVn
aW4oKSBmb3IgaXQgYW55d2F5Li4uIGJ1dCB3aWxsIGl0IG1ha2UgYW55IGRpZmZlcmVuY2UKZm9y
IHBpbmc2IHRvIGNoYW5nZSB0aGUgdGVzdCBhcyBiZWxvdz8KCmlwIGFkZHIgYWRkICRpcF9sb2Mv
JG1hc2sgZGV2IGxvIG5vZGFkCnRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIGFkZHIgYWRkICRpcF9y
bXQvJG1hc2sgZGV2IGxvIG5vZGFkIgoKPiBTaWduZWQtb2ZmLWJ5OiBTdSBZdWUgPHN1eS5mbnN0
QGZ1aml0c3UuY29tPgo+IC0tLQo+ICB0ZXN0Y2FzZXMvbmV0d29yay9tcGxzL21wbHMwMi5zaCB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L3Rlc3RjYXNlcy9uZXR3b3JrL21wbHMvbXBsczAyLnNoIGIvdGVzdGNhc2VzL25ldHdvcmsvbXBs
cy9tcGxzMDIuc2gKPiBpbmRleCAyZmQzZWM1YmY0YmEuLjc1ZjVmY2EzMmY5YSAxMDA3NTUKPiAt
LS0gYS90ZXN0Y2FzZXMvbmV0d29yay9tcGxzL21wbHMwMi5zaAo+ICsrKyBiL3Rlc3RjYXNlcy9u
ZXR3b3JrL21wbHMvbXBsczAyLnNoCj4gQEAgLTM1LDYgKzM1LDggQEAgc2V0dXAoKQo+ICAgICAg
IHRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIGFkZHIgYWRkICRpcF9ybXQvJG1hc2sgZGV2IGxvIgo+
ICAgICAgIHRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIHJvdXRlIGFkZCAkaXBfbG9jLyRtYXNrIGVu
Y2FwIG1wbHMgNjAgdmlhIGluZXQkVFNUX0lQVjYgJCh0c3RfaXBhZGRyKSIKPiAgICAgICB0c3Rf
cmhvc3RfcnVuIC1zIC1jICJpcCAtZiBtcGxzIHJvdXRlIGFkZCA1MCBkZXYgbG8iCj4gKwo+ICsg
ICAgIHNsZWVwIDEKPiAgfQo+Cj4gIGRvX3Rlc3QoKQo+CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
