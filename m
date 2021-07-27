Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1685B3D6E4B
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 07:51:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C85D33C6539
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 07:51:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27C8A3C5FD8
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 07:51:33 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6EE2C14010DB
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 07:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627365092; x=1658901092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=kVgMFoNE0wGFA61b7XR4PQ3KnoAx7WtobiSM6ClhxQA=;
 b=pGjV0QN5iiM8cT4riNkG6G3rANnOFqBhpsIK26U6TStSHkmgyhGrftmu
 nNh873QnNOqLR0jG37RFO4W/tGo4hpdva4YsLdRtNVANf7xW5XbF5IIDT
 sJPIPXdKWvgVgp+U/7hmntKPoUCPEgSMWVAgetaeMnTr1C3syBOQFE/dW
 wAMwO0L4fGZ//355hLYjmSUqoeS8UcRL4TPCmodyiZGQZkE8cu00NGumn
 R31oyZOlWnA6mF4Wi05Mab9vIQqM1b/mAo5il8ZR8/FX28pWgUbzwNhnm
 JuUrqXbbdecXdaTaVLOgsfVxaWBezSG3WxRswjpfgf3id+aJWBVrrOszy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="43524778"
X-IronPort-AV: E=Sophos;i="5.84,272,1620658800"; d="scan'208,223";a="43524778"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 14:51:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS2bwu4+O/kBYD+o66g4FlRGjB33FdY+HYjEmY1+4gLfmM3SCqWalqufk/E1N5PK0OHMH8eoOZilvsTYj5Hd31zgo77Yn7hzjMnIIsiAeBfdhKsPYTmsbZF3DvW8FGcvziOt9Dtkw7XcpPkhN9C8SC73E5W8IMy2es6ICb9tcL3sshm+mjOfyajr1PyiQmjQo6xQsl/mck95fhAE7vK2N9ZKxllsPGMs5dgXXoF4pToL02U2mnrYQiiDIZYC1/VR5aTeB4A2vhWrN3PYhktbN1Yh4VZZrvauiDiS5GTL3306nJyLBwPTZW2Fw+rrhfOjKSA5zkpiaWvEidpuSOS9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KxkfRZFBl3F9WC+kXY2kdHwQ43obdh74rrzTGI2iBM=;
 b=aQhPzMpUaGdwLty+fPZg2uRJcls1XAqeuLAh2QoDku7+zhQUw4rzWuhjZuMTOGFGxeqWNeozrCOVIoH5efpmOKPQjOJ07YbqAIAq2m7Olm7CcbVm9mDvaVZKUVRUhzJeB7ZJnIwH1uUZIF8CVFc/paCcMoQkCSDxqJelzXdA8ZrLJkSN51QtenwrlUoAw5USgZQdKrMBeKhd5tpdTs9jh8ETzPNb7mbMerIQkCD0EIWF1esGhJUvQ4PN2cNmEM4AoMeoUhnuUPY5gBDk52Zypnr+EeTukTb8kVTT+yJKojWHCijVEA0O5Px83WoAILkGF0KODTVMFeetY9xmWvgKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KxkfRZFBl3F9WC+kXY2kdHwQ43obdh74rrzTGI2iBM=;
 b=nZIMgglN+/7vITAs8rVr9KktEYogf4WPfZFzEvfzNKDXK2oMF91nJ85gqkia2t3GgC3A3qKbU5clX5nCsc/yIfWjOHAKGLLd86wkk4ccqxXb+/4sBgeOUN/1Ppmp4DCi3rrk3Wv8z2HditWmf1tgz2YyeTuo+cnIh1sQTX7c0VE=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYYPR01MB7104.jpnprd01.prod.outlook.com (2603:1096:400:dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 05:51:25 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 05:51:25 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
Thread-Index: AQHXdvMY8HjeAIx+30uV0khJgLWyVqtOr+6AgABId4CAAA0WgIAAADEAgAFK4QCAADzZgIAF27UA
Date: Tue, 27 Jul 2021 05:51:25 +0000
Message-ID: <60FF9EFA.308@fujitsu.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com> <YPkkZ0Zq9DyHKBaT@pevik>
 <YPlhMeRRsNnemT05@yuki> <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
 <60FA81E4.3060709@fujitsu.com> <YPq0749ZnnGsAV2q@pevik>
In-Reply-To: <YPq0749ZnnGsAV2q@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10e9c9b9-c70c-4f0b-b40b-08d950c29260
x-ms-traffictypediagnostic: TYYPR01MB7104:
x-microsoft-antispam-prvs: <TYYPR01MB71041FC47F470A51604664E4FDE99@TYYPR01MB7104.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NF8lhXDXw5btMZ8P1R6KR3P/PvtxcqE2RtFijE9bqgdbTcquDDVmdBhCfA5UMb4o/8gblveqclsomtdlS4Uyk8v4iH/QHG1/MpK4l6sXsb8d+57noosodymQicegczck8ZfwF+OcgWvKVq+7aYGBhq5P0jzKBYykC7U61egF+Na0A4iCdvo9PBF21L//pyLfC+f9br5uLhbDXFOxVeVNPXLlBz8LMFc408AVxti7E6y2RxYICO4lx8Tsy06fNBieDhSX8F2fG9sc+YccPJLAExjN8DhbTK2YafqqdSfuJ1wKa5C+PpYvj0Pf1aEkg/sLshBqNrjwuMZof/xrmmMjML3Z+0Um5XVhEuPy4NhvduazmCxL3pswiy46Ii1nW64jiESJlo/gIr6oqwKWPSCgP0BsyoLH7b3oZKu1XFApDX2CfSEr86xnbMuRj2EMyX0nesb7iIaviGw22UbJQW2u1p7XTzxOMsTVLhPDA4iVqBnIhsY1shPCVvKDEK1kuZTi5BI87NGrjL0+p2K55PWgBbomT+1gtRDQK126R3bSRWzm3EESso3Guz7o+/ME7OJzghgXr99VZncCPQW0tGIdEl/ceRgJWR73Qj3q9DA7WnFQ4O46WeNK0p0Zdautb7622ibPQawFP/vKnjtNgFdXSKcL7q27B9BrnI9HHAJAUystjJ3GWCgc3I4SJuuIbAW0sOhBJ7jFj29OfrAIpTMqVpzNU1PmN8Jc9W7eJyVVfCJgCIQEDKzczwlkKn5siJcm5LLxjay+fMpWGs5jzNAnX2HNZSKa4oLm7ViO/t3oS0hABqRohgItcc+7U8VK2NYncd+uPBS9HJvKEDa8Kc2qm4lARzyr/5DV1nLkhlrIiZM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(6916009)(2616005)(71200400001)(86362001)(54906003)(4326008)(186003)(36756003)(5660300002)(66616009)(966005)(38100700002)(66946007)(6506007)(26005)(66476007)(66446008)(64756008)(66556008)(99936003)(85182001)(6512007)(508600001)(2906002)(122000001)(33656002)(91956017)(8936002)(76116006)(8676002)(6486002)(533714002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?c1dZcGdLMW8wbmp6bHR5bHJNRUtVa09YUDN1RW5PM091UjMyNkZZZ3NYUEc3?=
 =?gb2312?B?T1Y3WkxqTDlXckJmUUNwWEx5aFl1YW9TVWVwdjR6ZjcwQ3d1QnhiNzJWL201?=
 =?gb2312?B?dnV2ZXdRR3h2aEJ0dEY0bmdMNEp2blJYWlI4bk10cFdkbWRHTFlEYk1sMXAy?=
 =?gb2312?B?a3JocDhETTZHOXhqaW95V1NWZ1V0bzVEU1h2cy8yazE4R2hocGNZRXFPVm5r?=
 =?gb2312?B?TjlMdElqbzZ5a2VQYVhJRjZvMklYcnA0UHNBZENXdk5BcWZZakFTN0ZBNHhZ?=
 =?gb2312?B?aFU0N3dJT1VHMEhqa1FGZDNDY3MwblFva0dVWWNDaFBQUDRSRXV6ZkNmUzgy?=
 =?gb2312?B?Z2Z4cmRrRVczV1ZjTzIyYkxGeVpPSStZZnNrVFNmUUYwTmtEWGZLWGxUQ0JX?=
 =?gb2312?B?UFNFbzIzTG5EN2RPK2QwMUo4QnlyQVM0RklDcE1Ed2NlWSs2STJkaGFURzBH?=
 =?gb2312?B?UjJna0wvN3RmSmIrQ0hWYkl5OWVYRkxLaUZIWjVLb0t6TWlqQkY3M2NET2lV?=
 =?gb2312?B?ZEl4cXBHemVYV0dTcHRlRGlhTkJZZ1F5YXpnVjcrdzBFcWZTd2RBSTM0Sm9L?=
 =?gb2312?B?YU5VTEg1UkYzRERobG0wd1NZM3ZFNHlwRCt1ZkZlQk5laklHZ3FoRk5wT0FZ?=
 =?gb2312?B?cHR4aEpQQURaYTg2SzBMVGJ1eEdjd0F4K0h2V1RDVHIzdnNiNmljVDZZT1BR?=
 =?gb2312?B?QlQ3ZDNUL1VqTUhvUEN1QUpPL0k5Z25kTXBsMHl1OXEyMzJ1WWNtano2OEJQ?=
 =?gb2312?B?cFJ0T3I3WWY4MU9Tc20yVFVDTW83MC9yQk9QeGhmSG9rbExJZEZnUCsrZ3RZ?=
 =?gb2312?B?aHpucCtjSGdqZXhVTUVQdUJobXRzTzEwNWh3L24rNXRzUXBNUGFpUTgrRjBs?=
 =?gb2312?B?RkJtRGhqVmhOaDlLVzJzNTU1YzAyeWV3MEtHVUk5VzV1aStJeHlLQUJRRmJK?=
 =?gb2312?B?VG5rYzBXdWJXTkZuY0dCd1c1TVEwQTB6dll2dWJiY3ZVZE9PVW9Nckl0TVly?=
 =?gb2312?B?bGJad0ppd1VmMTJCZytnNGQzOEE4NHNLbDl4ZHl4eVl2MGF6cWhKK25DNU5M?=
 =?gb2312?B?OWs1UE1WQ0pIZ3pOWjlaK0pIajA0Y1hkZ0xzdzI2NGJ2WVNlaWthR2tkVmpl?=
 =?gb2312?B?WGJoSkNKT2VTY1haL3JDc0NjTVlhdWlteVJWR3BJRXJ1c3VUWDQvU1M4Zk4w?=
 =?gb2312?B?MzZQenRhMzljMUszVzJRV1RFWHBabSs4Y0NkNndtTVhZWHF2Y01PYS9PT0hW?=
 =?gb2312?B?RUJFM1lYV2gxRnJXOFRuTDRDb01JN1Y0UWVaVW1hSW9KRHk5a2R1d0ViT0Ja?=
 =?gb2312?B?aXBzN05GdWRFN09PSm9vbmR4eGNLdGF3WnN6QmR6eWxlSUh6TUcxeGlXTDRl?=
 =?gb2312?B?UXJHanA4WElyWC9sTWRZM2ZMUmVmV2VMYmVWdWExcDRYSSt1dHdYWWdjaC82?=
 =?gb2312?B?S3RZSkNvaHZtOHpRMlc2MkJvbXE5bVl4SW9sTTZVWjN6aGsvRWh6aStSWkdr?=
 =?gb2312?B?bEJvN3FzbDdvUTlsUmZVQkVPM2xHQUNzemZmZFFwN2pGcUJORXM5ZG8wSXk2?=
 =?gb2312?B?bTdsRk9CZ3VwcDJBY3pvYS83elp2cjhTZktrcWIraEw3WnZ3OE0rTU8wU20w?=
 =?gb2312?B?WHlCUWhXci9MUmZWMzJLdnAvZjZqWTRSc0VrWHdwaDFOeW9aNENNVVQwUk41?=
 =?gb2312?B?L3hlYlNwKzAzOXk0VzduYnFoWGJLS3htV1hJRC9MV3MzK2IxcG5qdzZYMTJF?=
 =?gb2312?Q?s41fEFb2E5LfzmP4obkxzSUvs+RkYkWE5I1DZJ/?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed; boundary="_002_60FF9EFA308fujitsucom_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e9c9b9-c70c-4f0b-b40b-08d950c29260
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 05:51:25.8547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CbJ86wC8J65+OUnMUsBmhwMLK+Y+f08SmsvK8hxE+2CAlkNNy01W677BXJnf9B444YWJ0vm+XcikHO52/VJhXXO7hh2x0US4y6Y9yqJoha0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7104
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--_002_60FF9EFA308fujitsucom_
Content-Type: text/plain; charset="gb2312"
Content-ID: <BD44E4C6E17F0D47A05AD84277DE408E@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

SGkgUGV0cg0KPiBIaSBhbGwsDQo+DQo+PiBIaSBDeXJpbCwgUGV0cg0KPj4+IEhpIQ0KPj4+Pj4g
SSB0aGluayB0aGF0IHdlIGFsbHJlYWR5IGRpc2N1c3NlZCB0aGlzIGluIGFub3RoZXIgdGhyZWFk
Og0KPg0KPj4+Pj4gaHR0cHM6Ly9saXN0cy5saW51eC5pdC9waXBlcm1haWwvbHRwLzIwMjEtSnVs
eS8wMjM4MzEuaHRtbA0KPg0KPj4+PiBUaGFua3MsIEkgZm9yZ290IHRoaXMuIEluIHRoYXQgY2Fz
ZSBteSBhcHByb2FjaCAobm90IHVzaW5nPD0sIGJ1dCBjb3VudA0KPj4+PiBzZWdtZW50cyBpbiAv
cHJvYy9zeXN2aXBjL3NobSBiZWZvcmUgdGVzdGluZykgbWlnaHQgYmUgbW9yZSBwcmVjaXNlLg0K
Pj4+PiBCdXQgbm8gc3Ryb25nIGZlZWxpbmcgYWJvdXQgdGhhdCwgYm90aCBzb2x1dGlvbnMgZml4
IHRoZSB0ZXN0LCBsZXQncyBjaG9zZSBvbmUNCj4+Pj4gYW5kIG1lcmdlLg0KPg0KPj4+IEFzIEkg
c2FpZCBwcmV2aW91c2x5LCB0aGVyZSBhcmUgbWFueSBTeXNWIElQQyB0ZXN0cyB0aGF0IGRvIGV4
cGVjdCB0aGF0DQo+Pj4gbm9ib2R5IHdpbGwgYWRkL3JlbW92ZSBJUEMgc2htL3F1ZXVlL3NlbWFw
aG9yZXMgZHVyaW5nIHRoZSB0ZXN0cnVuIGFuZA0KPj4+IHNvbWUgb2YgdGhlIHRlc3RjYXNlcyBj
YW5ub3QgZXZlbiBiZSBpbXBsZW1lbnRlZCB3aXRob3V0IHRoaXMNCj4+PiBleHBlY3RhdGlvbi4N
Cj4NCj4+PiBIZW5jZSBJIHdvdWxkbid0IGNvbXBsaWNhdGUgdGhlIHRlc3QgaGVyZSBhbmQganVz
dCBjb3VudCBob3cgbWFueQ0KPj4+IHNlZ21lbnRzIGFyZSB0aGVyZSBhdCB0aGUgc3RhcnQgYW5k
IGJlIGRvbmUgd2l0aCBpdC4NCj4+IEFncmVlLg0KPg0KPj4gQSBwb3NzaWJsZSBzb2x1dGlvbihh
bHRlciBnZXRfdXNlZF9xdWV1ZXMgYXBpIGluIG5ldyBpcGMgbGliIGFuZCBhZGQNCj4+IGZpbGUg
cGFyYW1ldHJlcnMsIHNvIHdlIGNhbiB1c2UgdGhpcyBhcGkgZm9yIG1zZ2dldDAzKSBJIGhhdmUg
bWVudGlvbmVkDQo+PiBpbiB0aGUgcHJldmlvdXMgZW1haWwsIHRoZSB1cmwgYXMgYmVsb3c6DQo+
PiBodHRwczovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAyMS1KdWx5LzAyMzY1My5o
dG1sDQo+IExHVE0uIE9yIHVzZSAvcHJvYy9zeXN2aXBjL3NobSBpbnN0ZWFkIG9mIC9wcm9jL3N5
c3ZpcGMvbXNnIGluIGdldF91c2VkX3F1ZXVlcygpDQo+IGFzIHlvdSBub3RlZCBnZXRfdXNlZF9x
dWV1ZXMoKSBoYXMgbm90IGJlZW4gdXNlZCB5ZXQuDQpJIHJlbmFtZSBnZXRfdXNlZF9xdWV1ZXMg
dG8gZ2V0X3VzZWRfc3lzdmlwY19jbnQuIHNlZSBhdHRhY2hlZCBwYXRjaC4NCj4NCj4gQlRXIHNl
YXJjaGluZyB3aGVyZSBnZXRfdXNlZF9xdWV1ZXMoKSBhcHBlYXJlZCwgSSBzZWUgW0xUUF0gW1BB
VENIIHYzIDEvNF0NCj4gc3lzY2FsbHMvaXBjOiBhZGQgbmV3aXBjIGxpYnJhcnkgZm9yIG5ldyBB
UEkgWzFdLCBidXQgaWYgSSdtIG5vdCBtaXN0YWtlbg0KPiBnZXRfdXNlZF9xdWV1ZXMoKSB3YXMg
bm90IHVzZWQgZXZlbiB0aGVyZSwgbWF5YmUgaXQgd2FzIGluIHNvbWUgcHJldmlvdXMNCj4gdmVy
c2lvbnMuDQpZZXMsIG5vIG5ldyBhcGkgY2FzZSB1c2UgR0VUX1VTRURfUVVFVUVTIGFwaS4NCj4N
Cj4gS2luZCByZWdhcmRzLA0KPiBQZXRyDQo+DQo+IFsxXSBodHRwczovL2xpc3RzLmxpbnV4Lml0
L3BpcGVybWFpbC9sdHAvMjAxNi1EZWNlbWJlci8wMDMyMzkuaHRtbA0KDQo=

--_002_60FF9EFA308fujitsucom_
Content-Type: text/plain;
	name="0001-libs-libnewipc-Rename-get_used_queues-as-get_used_sy.patch"
Content-Description:  0001-libs-libnewipc-Rename-get_used_queues-as-get_used_sy.patch
Content-Disposition: attachment;
	filename="0001-libs-libnewipc-Rename-get_used_queues-as-get_used_sy.patch";
	size=5261; creation-date="Tue, 27 Jul 2021 05:51:25 GMT";
	modification-date="Tue, 27 Jul 2021 05:51:25 GMT"
Content-ID: <DCD18426C6A2844BB1D60B30018AA6B1@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSAyNzcyZjhmMGJiYzE1MjYzODljYjIwOTA4OTVkZGVkNDFlMmM0M2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogWWFuZyBYdSA8eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbT4N
CkRhdGU6IFR1ZSwgMjcgSnVsIDIwMjEgMTY6MjI6NDIgKzA4MDANClN1YmplY3Q6IFtQQVRDSF0g
bGlicy9saWJuZXdpcGM6UmVuYW1lIGdldF91c2VkX3F1ZXVlcyBhcyBnZXRfdXNlZF9zeXN2aXBj
X2NudA0KDQpSZW5hbWUgZ2V0X3VzZWRfcXVldWVzIGFzIGdldF91c2VkX3N5c3ZpcGNfY250LCBz
byB3ZSBjYW4gdXNlIEdFVF9VU0VEX1FVRVFVRVMoKQ0KYW5kIEdFVF9VU0VEX1NFR01FTlRTKCkg
dG8gZ2V0IHRoZSBjb3JyZXNwb25kaW5nIHVzZWQgc3lzdmlwYyByZXNvdXJjZSB0b3RhbC4NCg0K
VGhlbiB3ZSBjYW4gdXNlIHRoZW0gaW4gc2htZ2V0MDMvbXNnZ2V0MDMsIHNvIHdlIGNhbiB0cmln
Z2VyIHRoZSBFTk9TUEMgZXJyb3IgY29ycmVjdGx5DQpldmVuIGN1cnJlbnQgZW52aXJvbm1lbnQg
aGFzIGNvbnN1bWUgc29tZSBzeXN2aXBjIHJlc291cmNlLg0KDQpJIGRvbid0IHVzZSB0aGlzIGFw
aSBpbiB2ZXJpZnkgZnVuY3Rpb24gc2luY2Ugd2UgZG9uJ3Qgc3VwcG9ydCBydW4gY2FzZXMgaW4g
cGFyYWxsZWwgYW5kDQp3ZSBzaG91bGQgYXNzdW1lIHRoaXMgc2l0dWF0aW9uIHRoYXQgdGhpcyBj
YXNlIGlzIHRoZSBvbmx5IGNhc2UgdG8gdXNlKGZyZWUgb3IgYWxsb2MpIHN5c3YNCmlwYyByZXNv
dXJjZSBhdCB0aGF0IHRpbWUuDQoNCkZpeGVzOiAjODQyDQpTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1
IDx4dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tPg0KLS0tDQogaW5jbHVkZS9saWJuZXdpcGMuaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0NCiBsaWJzL2xpYmx0cG5ld2lw
Yy9saWJuZXdpcGMuYyAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0NCiB0
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9tc2dnZXQvbXNnZ2V0MDMuYyB8IDEwICsrKysr
KystLS0NCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9zaG1nZXQvc2htZ2V0MDMuYyB8
IDEwICsrKysrKy0tLS0NCiA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE3IGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saWJuZXdpcGMuaCBiL2luY2x1ZGUv
bGlibmV3aXBjLmgNCmluZGV4IDA3NTM2NGY4NS4uYjA0NDg4NDFhIDEwMDY0NA0KLS0tIGEvaW5j
bHVkZS9saWJuZXdpcGMuaA0KKysrIGIvaW5jbHVkZS9saWJuZXdpcGMuaA0KQEAgLTQ5LDkgKzQ5
LDExIEBAIGtleV90IGdldGlwY2tleShjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5v
KTsNCiAjZGVmaW5lIEdFVElQQ0tFWSgpIFwNCiAJZ2V0aXBja2V5KF9fRklMRV9fLCBfX0xJTkVf
XykNCiANCi1pbnQgZ2V0X3VzZWRfcXVldWVzKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IGludCBs
aW5lbm8pOw0KK2ludCBnZXRfdXNlZF9zeXN2aXBjX2NudChjb25zdCBjaGFyICpmaWxlLCBjb25z
dCBpbnQgbGluZW5vLCBjb25zdCBjaGFyICpzeXN2aXBjX2ZpbGUpOw0KICNkZWZpbmUgR0VUX1VT
RURfUVVFVUVTKCkgXA0KLQlnZXRfdXNlZF9xdWV1ZXMoX19GSUxFX18sIF9fTElORV9fKQ0KKwln
ZXRfdXNlZF9zeXN2aXBjX2NudChfX0ZJTEVfXywgX19MSU5FX18sICIvcHJvYy9zeXN2aXBjL21z
ZyIpDQorI2RlZmluZSBHRVRfVVNFRF9TRUdNRU5UUygpIFwNCisJZ2V0X3VzZWRfc3lzdmlwY19j
bnQoX19GSUxFX18sIF9fTElORV9fLCAiL3Byb2Mvc3lzdmlwYy9zaG0iKQ0KIA0KIHZvaWQgKnBy
b2JlX2ZyZWVfYWRkcihjb25zdCBjaGFyICpmaWxlLCBjb25zdCBpbnQgbGluZW5vKTsNCiAjZGVm
aW5lIFBST0JFX0ZSRUVfQUREUigpIFwNCmRpZmYgLS1naXQgYS9saWJzL2xpYmx0cG5ld2lwYy9s
aWJuZXdpcGMuYyBiL2xpYnMvbGlibHRwbmV3aXBjL2xpYm5ld2lwYy5jDQppbmRleCBkMDk3NGJi
ZTAuLjY4N2E5MDdlNyAxMDA2NDQNCi0tLSBhL2xpYnMvbGlibHRwbmV3aXBjL2xpYm5ld2lwYy5j
DQorKysgYi9saWJzL2xpYmx0cG5ld2lwYy9saWJuZXdpcGMuYw0KQEAgLTQ4LDI1ICs0OCwyNSBA
QCBrZXlfdCBnZXRpcGNrZXkoY29uc3QgY2hhciAqZmlsZSwgY29uc3QgaW50IGxpbmVubykNCiAJ
cmV0dXJuIGtleTsNCiB9DQogDQotaW50IGdldF91c2VkX3F1ZXVlcyhjb25zdCBjaGFyICpmaWxl
LCBjb25zdCBpbnQgbGluZW5vKQ0KK2ludCBnZXRfdXNlZF9zeXN2aXBjX2NudChjb25zdCBjaGFy
ICpmaWxlLCBjb25zdCBpbnQgbGluZW5vLCBjb25zdCBjaGFyICpzeXN2aXBjX2ZpbGUpDQogew0K
IAlGSUxFICpmcDsNCi0JaW50IHVzZWRfcXVldWVzID0gLTE7DQorCWludCB1c2VkX2NudCA9IC0x
Ow0KIAljaGFyIGJ1ZltCVUZTSVpFXTsNCiANCi0JZnAgPSBzYWZlX2ZvcGVuKGZpbGUsIGxpbmVu
bywgTlVMTCwgIi9wcm9jL3N5c3ZpcGMvbXNnIiwgInIiKTsNCisJZnAgPSBzYWZlX2ZvcGVuKGZp
bGUsIGxpbmVubywgTlVMTCwgc3lzdmlwY19maWxlLCAiciIpOw0KIA0KIAl3aGlsZSAoZmdldHMo
YnVmLCBCVUZTSVpFLCBmcCkgIT0gTlVMTCkNCi0JCXVzZWRfcXVldWVzKys7DQorCQl1c2VkX2Nu
dCsrOw0KIA0KIAlmY2xvc2UoZnApOw0KIA0KLQlpZiAodXNlZF9xdWV1ZXMgPCAwKSB7DQotCQl0
c3RfYnJrKFRCUk9LLCAiY2FuJ3QgcmVhZCAvcHJvYy9zeXN2aXBjL21zZyB0byBnZXQgIg0KLQkJ
CSJ1c2VkIG1lc3NhZ2UgcXVldWVzIGF0ICVzOiVkIiwgZmlsZSwgbGluZW5vKTsNCisJaWYgKHVz
ZWRfY250IDwgMCkgew0KKwkJdHN0X2JyayhUQlJPSywgImNhbid0IHJlYWQgJXMgdG8gZ2V0IHVz
ZWQgbWVzc2FnZSBxdWV1ZXMgIg0KKwkJCSJhdCAlczolZCIsIHN5c3ZpcGNfZmlsZSwgZmlsZSwg
bGluZW5vKTsNCiAJfQ0KIA0KLQlyZXR1cm4gdXNlZF9xdWV1ZXM7DQorCXJldHVybiB1c2VkX2Nu
dDsNCiB9DQogDQogdm9pZCAqcHJvYmVfZnJlZV9hZGRyKGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0
IGludCBsaW5lbm8pDQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pcGMv
bXNnZ2V0L21zZ2dldDAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9tc2dnZXQv
bXNnZ2V0MDMuYw0KaW5kZXggYWI1NzE0Y2RjLi44Y2NmZmM1NDcgMTAwNjQ0DQotLS0gYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9tc2dnZXQvbXNnZ2V0MDMuYw0KKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9pcGMvbXNnZ2V0L21zZ2dldDAzLmMNCkBAIC0yMSw3ICsyMSw3
IEBADQogI2luY2x1ZGUgInRzdF9zYWZlX3N5c3ZfaXBjLmgiDQogI2luY2x1ZGUgImxpYm5ld2lw
Yy5oIg0KIA0KLXN0YXRpYyBpbnQgbWF4bXNncywgcXVldWVfY250Ow0KK3N0YXRpYyBpbnQgbWF4
bXNncywgcXVldWVfY250LCBleGlzdGVkX2NudDsNCiBzdGF0aWMgaW50ICpxdWV1ZXM7DQogc3Rh
dGljIGtleV90IG1zZ2tleTsNCiANCkBAIC0zNywxMSArMzcsMTUgQEAgc3RhdGljIHZvaWQgc2V0
dXAodm9pZCkNCiANCiAJbXNna2V5ID0gR0VUSVBDS0VZKCk7DQogDQorCWV4aXN0ZWRfY250ID0g
R0VUX1VTRURfUVVFVUVTKCk7DQorCXRzdF9yZXMoVElORk8sICJDdXJyZW50IGVudmlyb25tZW50
ICVkIG1lc3NhZ2UgcXVldWVzIGFyZSBhbHJlYWR5IGluIHVzZSIsDQorCQlleGlzdGVkX2NudCk7
DQorDQogCVNBRkVfRklMRV9TQ0FORigiL3Byb2Mvc3lzL2tlcm5lbC9tc2dtbmkiLCAiJWkiLCAm
bWF4bXNncyk7DQogDQotCXF1ZXVlcyA9IFNBRkVfTUFMTE9DKG1heG1zZ3MgKiBzaXplb2YoaW50
KSk7DQorCXF1ZXVlcyA9IFNBRkVfTUFMTE9DKChtYXhtc2dzIC0gZXhpc3RlZF9jbnQpICogc2l6
ZW9mKGludCkpOw0KIA0KLQlmb3IgKG51bSA9IDA7IG51bSA8IG1heG1zZ3M7IG51bSsrKSB7DQor
CWZvciAobnVtID0gMDsgbnVtIDwgbWF4bXNncyAtIGV4aXN0ZWRfY250OyBudW0rKykgew0KIAkJ
cmVzID0gbXNnZ2V0KG1zZ2tleSArIG51bSwgSVBDX0NSRUFUIHwgSVBDX0VYQ0wpOw0KIAkJaWYg
KHJlcyA9PSAtMSkNCiAJCQl0c3RfYnJrKFRCUk9LIHwgVEVSUk5PLCAibXNnZ2V0IGZhaWxlZCB1
bmV4cGVjdGVkbHkiKTsNCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lw
Yy9zaG1nZXQvc2htZ2V0MDMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaXBjL3NobWdl
dC9zaG1nZXQwMy5jDQppbmRleCBlZmJjNDY1ZTEuLmFjZDM1Mjc5NiAxMDA2NDQNCi0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvaXBjL3NobWdldC9zaG1nZXQwMy5jDQorKysgYi90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL2lwYy9zaG1nZXQvc2htZ2V0MDMuYw0KQEAgLTIyLDcgKzIy
LDcgQEANCiAjaW5jbHVkZSAibGlibmV3aXBjLmgiDQogDQogc3RhdGljIGludCAqcXVldWVzOw0K
LXN0YXRpYyBpbnQgbWF4c2htcywgcXVldWVfY250Ow0KK3N0YXRpYyBpbnQgbWF4c2htcywgcXVl
dWVfY250LCBleGlzdGVkX2NudDsNCiBzdGF0aWMga2V5X3Qgc2hta2V5Ow0KIA0KIHN0YXRpYyB2
b2lkIHZlcmlmeV9zaG1nZXQodm9pZCkNCkBAIC0zNiwxMSArMzYsMTMgQEAgc3RhdGljIHZvaWQg
c2V0dXAodm9pZCkNCiAJaW50IHJlcywgbnVtOw0KIA0KIAlzaG1rZXkgPSBHRVRJUENLRVkoKTsN
Ci0NCisJZXhpc3RlZF9jbnQgPSBHRVRfVVNFRF9TRUdNRU5UUygpOw0KKwl0c3RfcmVzKFRJTkZP
LCAiQ3VycmVudCBlbnZpcm9ubWVudCAlZCBzaGFyZWQgbWVtb3J5IHNlZ21lbnRzIGFyZSBhbHJl
YWR5IGluIHVzZSIsDQorCQlleGlzdGVkX2NudCk7DQogCVNBRkVfRklMRV9TQ0FORigiL3Byb2Mv
c3lzL2tlcm5lbC9zaG1tbmkiLCAiJWkiLCAmbWF4c2htcyk7DQogDQotCXF1ZXVlcyA9IFNBRkVf
TUFMTE9DKG1heHNobXMgKiBzaXplb2YoaW50KSk7DQotCWZvciAobnVtID0gMDsgbnVtIDwgbWF4
c2htczsgbnVtKyspIHsNCisJcXVldWVzID0gU0FGRV9NQUxMT0MoKG1heHNobXMgLSBleGlzdGVk
X2NudCkgKiBzaXplb2YoaW50KSk7DQorCWZvciAobnVtID0gMDsgbnVtIDwgbWF4c2htcyAtIGV4
aXN0ZWRfY250OyBudW0rKykgew0KIAkJcmVzID0gc2htZ2V0KHNobWtleSArIG51bSwgU0hNX1NJ
WkUsIElQQ19DUkVBVCB8IElQQ19FWENMIHwgU0hNX1JXKTsNCiAJCWlmIChyZXMgPT0gLTEpDQog
CQkJdHN0X2JyayhUQlJPSyB8IFRFUlJOTywgInNobWdldCBmYWlsZWQgdW5leHBlY3RlZGx5Iik7
DQotLSANCjIuMjMuMA0KDQo=

--_002_60FF9EFA308fujitsucom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--_002_60FF9EFA308fujitsucom_--
