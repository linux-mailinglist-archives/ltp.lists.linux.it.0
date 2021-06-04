Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95039B122
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 05:53:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D651A3C87FD
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 05:53:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC5633C288F
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 05:53:22 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B3F971001197
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 05:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622778800; x=1654314800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KJdftmEg/YmU7dNzPjtYEzNgtHXG2LcBnvryHETgV70=;
 b=b68+9tozL7NsMcyeJE/FV+zIF3rqjEQfSKnxLXoX8yeqwqdtyR/OuELm
 l3fZzQefYgbCNpLx+XKAqOgDQef1ujOFfcjzO+1mtnxE7mjTGuFk7CgMN
 FFMMC/AFlpjPdzd0PSHSJH9cS7f5s9UtI63vf3Hp3HQNMGl3wHiiuII0J
 9lsMLpD+7x5CSP/46lyJDj55AAnYRjFXPf6FbxfZuKpl48Rd4dIB73pNP
 YbZlIwVy3CtD9lEfgh52Ym79okyHavtgQix4+PI37n27IJS1O9u9XxgV8
 i1j14Jt8biA8L38nvZ9BNDnMjviB7MCathRaaRUDd/c85z2DiFCIjrWGY Q==;
IronPort-SDR: +iAhIEEQ4BBMg8yRVsttW450/vmQHgo9sAdV/cn///RR9/4Ioff9nxNq1xK0EvxjVC+dYG4PpJ
 W8MuZ/IHYcMo0EV0RLNPokrv6JdUXgmlidxfO5weZ0BQNikxTOnQT1vXBoB7SV8cTYeFHsoQ0/
 0wKG+lArSUxuv4zHQ0yrMS2nVfnp6Bz+MG8FKvVizSAdn/PhQW9jfsQy2qbFIZPeDfg7fSVuHv
 6z26vguqBHBQud/iS+8rNq7cLULWrJ2lAd4OkB//qEV/KmJhEBsJouVuJk+rjz6m8LW8xa/2tG
 HoI=
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="40417233"
X-IronPort-AV: E=Sophos;i="5.83,247,1616425200"; d="scan'208";a="40417233"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 12:53:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFBkvYznd51ZIYOr/90/0kd7IUFN4wsDs2jeGcqpXdUo9qfDfFLWpETtbK8j5QLwInOBMYuG4lAg63HNRivj+ZFuNAJv1LYHR5mD8D+V9iHr1BR4bng1qcd1kWmuuMwomjrLjaWw5w0kosFvn1FmA8s4QRc1Q1T6uF7Rx8CDRyqwkarsaMQhrjPhmzmf67pzEN0KwHT3j1cGMokcL+BEt8Rg0xyuqzo5H8NLXzAz2NcQvkfoNCtuaUtB36Utm5Uh8kkVi2in3qQInvz5L6XM+N65e2opxnQXLRCCGWrR2Yv8DbCPXgIhv9j1mhuMRYCJy+3EQ5nxn7efCQREIBzM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJdftmEg/YmU7dNzPjtYEzNgtHXG2LcBnvryHETgV70=;
 b=CP9QRrCgITnz/sYGriGzcVWWwWPO5jVSGhrMIcXq52xc2gDLiq6SgYuZbGhv6jU8dWgE7xGKe5/H1zFt4d2IiTRvdPSFuYEWw9q4jOgNQHMxWKG3kGxxCl8NcqOwl30Zow5h8+PbGCGpkNAq+d07tnwjw9Cua4+4TXt5ypX5ir7CA3DGAmQrQRlve175zZWe7JN5xn8fVTQOHJv/Faqa0k5Mf5EBO1+rN81MIM2agNsBFd6gQ0mcSkAfLe4A/pmO6hKnPXRQVeokhGhWRPgGSdkOGWbGqSL0pWzU2aVzoHXVmiwEUm8LtxX/f25jsOfuH5g3adDpyTHF+I0OkHQg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJdftmEg/YmU7dNzPjtYEzNgtHXG2LcBnvryHETgV70=;
 b=Sja2oPslif17+aLOAMyHIPbeDtZvKAjFFLz+ooxPFW+v08UiNlnwlFDh/0oRY8HG8/IO7GyOwxjBxWh0K5sXyyzvf8lfiMYhD26fwVa+L3D6hvhtNdtSGq0Lkz1oR3vAlT/BgRLtaBIgOgqqxzsuR5p3nnqEIeRHZij20riycH4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6111.jpnprd01.prod.outlook.com (2603:1096:400:4c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 03:53:14 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.022; Fri, 4 Jun 2021
 03:53:14 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: =?gb2312?B?IkphbWVzIERvbmcgKLatysC9rSki?= <dongshijiang@inspur.com>, Cyril
 Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>, Li Wang
 <liwang@redhat.com>
Thread-Topic: =?gb2312?B?tPC4tDogtPC4tDogW0xUUF0gW1BBVENIXSBsdHAtYWlvZGlvL2Rpb19hcHBl?=
 =?gb2312?Q?nd:_fix_dio=5Fappend()?=
Thread-Index: AQHXWE4kwSGWgslrMka+KJC7F/CvvqsCD10AgAAGOoCAAQA9AIAADqsAgAAVXYA=
Date: Fri, 4 Jun 2021 03:53:13 +0000
Message-ID: <60B9A3D1.1040001@fujitsu.com>
References: <d87da351dd8cd8c8e51afc8922162e84@sslemail.net>
 <60B8A96C.8080503@fujitsu.com> <befea6726fc7467b9410db3e3b961f3e@inspur.com>
 <60B98598.7000905@fujitsu.com> <eddbe134055240cb8889b4df76404c1d@inspur.com>
In-Reply-To: <eddbe134055240cb8889b4df76404c1d@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inspur.com; dkim=none (message not signed)
 header.d=none;inspur.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd5ca0d7-c9ba-495c-a400-08d9270c4763
x-ms-traffictypediagnostic: TYCPR01MB6111:
x-microsoft-antispam-prvs: <TYCPR01MB61118E008562BFEE5E004BEDFD3B9@TYCPR01MB6111.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QbQET5YLB8E1qxbSCVk+9M/zkYtUthyvMTO5lDSN7SuKefQiA9epLL/bztHoYcrvEquGERFRz7wncP37fL4sE2e6PRZk1hjaC3/gFpCZ30px4kE0PySFXoK9mXEKL5O/fHAy1/QMSso/CLCG44nUkexb1butMuyzDCFtdi7x7XeVnTxauHjrRCa5AnYwMzieDZBpRWOy6dG/AZL3JEwfBmhNNWGj7XyMxarCO4Vxaqk4AYp8iVRkcXXmwUw5n+MwcuMfRjtyILxwvdXOqMsie+uLm+R/ss375adrfRV13K1/SDMqCr97qc5JWlj6Nmkd+xEm2rMRMWaSC0JBqmRB3dpLxAZF1a6apov/FcQJOB89BY1gW8OZYHwut9P4K/z4M/3KDHiUriQt0Az0p7ZrcuXH4paaYbfM5Irxfi+oZ0nLxlFBPLD+pz0eHQJEsxE5iMpgb+xYueyIiNgAP75xfKC3BMpCon3s1f0JEJb4/f9K1+4h+qKwJ8AqX2GfuevC0cOljvxkzdSRHVg2shJI8WyyvdMDx3ZN96Vx7jXJFN1oDG0hGuNxdd4kCNn+MCtLET1RW0HAnMTY718a5wYylQgk+KapQ101QRtmxnF7w7XXB6Y6ppo+Ul02rXEGDn8C3g5raae5DISEh+En6yxdGi+OdWh5Da8rUn32yS71l5peHjtsSVFP+sSNZGw+4q6LVkSXIwDp93YX056ZmHgMtrQ9igEsRQJAs4cdGg2HQD0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(6486002)(6512007)(6506007)(86362001)(5660300002)(8936002)(122000001)(316002)(33656002)(110136005)(38100700002)(87266011)(83380400001)(36756003)(71200400001)(186003)(966005)(26005)(478600001)(66556008)(64756008)(66446008)(85182001)(91956017)(76116006)(2906002)(66476007)(4326008)(66946007)(2616005)(224303003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?QXlhbXRwa1FWb3NGQlloc0xOMmFFWHFFL2FNcU1POVBLakd2VzdqRytaeVhS?=
 =?gb2312?B?TDk1VkUyTzBqSXg3Y1NTaDFXYTdabFpuV25SM3U3OFd3QWFySVdBM0N3RWky?=
 =?gb2312?B?QXJ2RGlURlBSU3ptVVBwVG9OU2pNNFNpTlFjSW1Sdnlxa3hBdmYxb1VGZmNu?=
 =?gb2312?B?YVYrZUk2Y2tHNzNZUVA0MEJoeTVjeHZzYVdGVjV3SFhiR2NGYmt1WGtPUnEr?=
 =?gb2312?B?L2ljTzN2OU5yRkthSVZtREpxSGc4Vkw3VzhrWVNoSEErM2Y5Nk1uendnZitX?=
 =?gb2312?B?MnpOM3B4MWJ4SlFyTGVuY2lzT2JoMEYvS01pNXBmNXhoc2N1ODRWdG9VTFI0?=
 =?gb2312?B?OWpUL3JGVTVOdm9xMlZyUlFoUjlsT2NSVHJaMndzQ2xSd3h1RjNCTlpBZitY?=
 =?gb2312?B?clFzTWRMb3VnMU4rUWpUNXd2VHREVmZCRFQ0bGJFM2R0NnpmS0QxTUM4cjJJ?=
 =?gb2312?B?cGFFSmVLbHAwbVQxVFJSMHQwM3FXTWVHVFpRVTlNWVkrYXV6VXZVOE5tTGI5?=
 =?gb2312?B?TzUvakhEVDNaTDhqeG41N0RoZ2NxRTJFVVhQdVdTVFhhd0tPZkJSOEtYYmVH?=
 =?gb2312?B?RXRWeGc4SHlXckFqUENJS0VwRTVrOE1RcWpUc3VxbGRuMEhvT3VDeGo2N20y?=
 =?gb2312?B?Sk1EM2ZwMkpHUVp4S0lXZ3RnQ1EwcENVZlJSU3pseExHRnA1UmF6SFFrUS9Z?=
 =?gb2312?B?WVpiT0IvZnFpVjJKMDU0cUtEUGRVbng1ZnorampOK0NvREpWOVBIRnN2OWdl?=
 =?gb2312?B?Umc5VkYwTkNOTlc0b0xQczhlcjdkTkJ4TGxJT0VLODcvV2Z5d1kyQktWNXlP?=
 =?gb2312?B?OENMYlZCc2dUczRHQXIzbVZlUDlsR1Q5QWFVaXhLNDErOXNrSkdLb2J0V0Ny?=
 =?gb2312?B?Z21GWWwyVzZoWXQ2SUcvU05wMmZaM29GQzdXSEdqV0JQN3RMWW4rVFd6UzNS?=
 =?gb2312?B?MmJvbmRySk9NaS9wU0kwb2JBTVRUK016eEdRWDFYc09IMjM1MWlIeGZ1dFRU?=
 =?gb2312?B?TCtaM2hRaUllbTdJTy9BTG0xVlhRbldPZm8zNlhNOVhnMFN3MjhJTUhEd21K?=
 =?gb2312?B?T0lIS1N0d3FCVEhSQUM5RzVadE1SSlo2YUtVVVhqVURvOHgzUEYzQytjSmZ3?=
 =?gb2312?B?WU44YS9vdGFlWEt1MHVOZFNjWTFBcEhkZVRFV2NlajcrZmhWbWdoMjE4Qmwv?=
 =?gb2312?B?MW9zQkpha296Wjk4d2VXZ0ladzdGNGpEVkJmVlVtS2piWkpacVNTOEdRUVVq?=
 =?gb2312?B?K3RROGg0bFZ4cXZncE56Vys0V2JmZmZQb0kwU09nZklNaExhUUh4Z2lZcnhD?=
 =?gb2312?B?WVZ0Wkd0djVBd3RPNnlxZENDOEtEQlpBNlBTaXdZdVpWYlFCeEEzUWdGc0lH?=
 =?gb2312?B?SDZGU0hDeEpLVkFYMHJzMit6MU1RWE9FM1FYUEZOSXZibWkyTTN4dmtBOGRJ?=
 =?gb2312?B?V1hWY2lIUWJoeFhRTFNSalI1WHJTSm0vS3UwYmM1V1hiQ1dTV2dpM3o5TlVK?=
 =?gb2312?B?VU53ZVdMNURxOEM1dnYvU1pJNE5qdTNiN3BjSXhnaUdJL055dG5adi9rb2Uz?=
 =?gb2312?B?ay9BckJpd01tRUVOUUxQK3JMbUlOZnFScDdRZ0hOS0lBVTh6cU5rWCtROXhJ?=
 =?gb2312?B?dmU2S0RQUVZTeXVHUit2QW1HZ0h5OGdyTkFxSncreWRJUlh4aWVvd2VTb1Q3?=
 =?gb2312?B?V1o2cWIyTjk5amNxbjcyMUhqRlNvWThtOUpBQnhEUTBiM1BBSWdpVTNkZTVq?=
 =?gb2312?B?eWJEZ1RtS0VGUHFreUZZK2h0Wjlza0FNUXF0U2RVbjY0YmdTeHlnd1lCVkNu?=
 =?gb2312?B?S1p2WDNLSEtuY1VTd3hHZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <7BAF101B43FA8648A37330FC3DDE766F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5ca0d7-c9ba-495c-a400-08d9270c4763
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 03:53:13.9199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzxDFNip0A097fygWv1XDTGOq91sEmEJN+fK9Ulr2yQDhwglo9gqDSP3ZiG/Ehz389Cqc04BRdJnhQPx49viuOZ4DMcURJl9fQEyp+9GwYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6111
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] =?gb2312?b?tPC4tDogtPC4tDogIFtQQVRDSF0gbHRwLWFpb2Rpby9k?=
 =?gb2312?b?aW9fYXBwZW5kOiBmaXggZGlvX2FwcGVuZCgp?=
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

SGkgRG9uZw0KDQo+IEhpIHh1eWFuZw0KPiANCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91
ciByZXBseSwgYnV0IEkgdGhpbmsgd2Ugc2hvdWxkIGFkZCB0aGUganVkZ21lbnQgb2YgdGhlIHJl
dHVybiB2YWx1ZSBpbiB0aGUgImRpb19hcHBlbmQiIGZ1bmN0aW9uLCBiZWNhdXNlIHRoZSBmaW5h
bCByZXR1cm4gdmFsdWUgaXMgMCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIHRlc3QgaXRlbSBw
YXNzZXMgb3Igbm90LCBhbmQgMCBtZWFucyBQQVNTLg0KSU1PLCBJIGRvbid0IGxpa2UgcGVycm9y
IG9yIHByaW50ZiBmdW5jdGlvbiBhbmQgdXNlIHJldHVybiB2YWx1ZSB0byB0ZWxsDQpydW5sdHAg
dGhhdCB0aGlzIGNhc2UgZmFpbGVkLiBMVFAgaGFzIHRzdF9yZXMoKSBmdW5jdGlvbiB3aXRoIGRp
ZmZlcmVudA0KZmxhZyBhbmQgbHRwIG5ldyB0ZXN0IGZyYW1ld29yayBjYW4gY2hlY2sgcGFzcy9m
YWlsL2NvbmYgbnVtYmVyIGluDQpsaWIvdHN0X3Rlc3QuYyBkb19leGl0IGZ1bmN0aW9uLg0KDQpB
IGdlbmVyaWMgZml4IHNob3VuZCB1c2UgdHN0X3Jlc20oVEZBSUwsKSBhbmQgdHN0X2V4aXQgZnVu
Y3Rpb24uDQotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5j
DQorKysgYi90ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQpAQCAt
ODUsNyArODUsNyBAQCB2b2lkIGRpb19hcHBlbmQoY2hhciAqZmlsZW5hbWUpDQogICAgICAgIGZk
ID0gb3BlbihmaWxlbmFtZSwgT19ESVJFQ1QgfCBPX1dST05MWSB8IE9fQ1JFQVQsIDA2NjYpOw0K
DQogICAgICAgIGlmIChmZCA8IDApIHsNCi0gICAgICAgICAgICAgICBwZXJyb3IoImNhbm5vdCBj
cmVhdGUgZmlsZSIpOw0KKyAgICAgICAgICAgICAgIHRzdF9yZXNtKFRGQUlMLCAiY2Fubm90IGNy
ZWF0ZSBmaWxlICVzIiwgZmlsZW5hbWUpOw0KICAgICAgICAgICAgICAgIHJldHVybjsNCiAgICAg
ICAgfQ0KDQpAQCAtOTksNyArOTksNyBAQCB2b2lkIGRpb19hcHBlbmQoY2hhciAqZmlsZW5hbWUp
DQogICAgICAgIG1lbXNldChidWZwdHIsIDAsIDY0ICogMTAyNCk7DQogICAgICAgIGZvciAoaSA9
IDA7IGkgPCAxMDAwOyBpKyspIHsNCiAgICAgICAgICAgICAgICBpZiAoKHcgPSB3cml0ZShmZCwg
YnVmcHRyLCA2NCAqIDEwMjQpKSAhPSA2NCAqIDEwMjQpIHsNCi0gICAgICAgICAgICAgICAgICAg
ICAgIGZwcmludGYoc3RkZXJyLCAid3JpdGUgJWQgcmV0dXJuZWQgJWRcbiIsIGksIHcpOw0KKyAg
ICAgICAgICAgICAgICAgICAgICAgdHN0X3Jlc20oVEZBSUwsICJ3cml0ZSAlZCByZXR1cm5lZCAl
ZCIsIGksIHcpOw0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KIH0NCkBAIC0xMzksNSAr
MTM5LDUgQEAgaW50IG1haW4odm9pZCkNCiAgICAgICAgZm9yIChpID0gMDsgaSA8IG51bV9jaGls
ZHJlbjsgaSsrKSB7DQogICAgICAgICAgICAgICAga2lsbChwaWRbaV0sIFNJR1RFUk0pOw0KICAg
ICAgICB9DQotICAgICAgIHJldHVybiAwOw0KKyAgICAgICB0c3RfZXhpdCgpOw0KIH0NCg0KSXQg
YWxzbyBuZWVkIHN0byB1c2Ugc2V0dXAgYW5kIGNsZWFudXAgZnVuY3Rpb24uIEJ1dCBpdCBpcyBv
bGQgdGVzdCBhcGkuDQpJIGd1ZXNzIHdlIGNhbiB1c2UgbmV3IGFwaSB0byBkbyBpdC4NCg0KQEN5
cmlsLCBQZXRyLCBMaQ0KSSB0aGluayBpdCBpcyB0aW1lIHRvIGNvbnZlcnQgdGhlIHdob2xlIGx0
cC1haW9kaW8gY2FzZXMgaW50byBuZXcgYXBpDQphbmQgd2Ugc3RpbGwgY2FuIHVzZSBsdHAtYWlv
ZGlvLnNoLg0KDQpCZXN0IFJlZ2FyZHMNCllhbmcgWHUNCg0KPiANCj4gLS0tLS3Tyrz+1K28/i0t
LS0tDQo+ILeivP7IyzogeHV5YW5nMjAxOC5qeUBmdWppdHN1LmNvbSBbbWFpbHRvOnh1eWFuZzIw
MTguanlAZnVqaXRzdS5jb21dDQo+ILeiy83KsbzkOiAyMDIxxOo21MI0yNUgOTo0NA0KPiDK1bz+
yMs6IEphbWVzIERvbmcgKLatysC9rSk8ZG9uZ3NoaWppYW5nQGluc3B1ci5jb20+DQo+ILOty806
IGx0cEBsaXN0cy5saW51eC5pdA0KPiDW98ziOiBSZTogtPC4tDogW0xUUF0gW1BBVENIXSBsdHAt
YWlvZGlvL2Rpb19hcHBlbmQ6IGZpeCBkaW9fYXBwZW5kKCkNCj4gDQo+IEhpIERvbmcNCj4gDQo+
IFBsZWFzZSBzZWUgbHRwL3Rlc3RjYXNlcy9rZXJuZWwvaW8vbHRwLWFpb2Rpby9SRUFETUUNCj4g
aXQgc2FpZCAiDQo+IFJ1biB0aGUgbHRwLWFpb2Rpby5zaCBmaWxlIHRvIGV4ZWN1dGUgYWxsIHRo
ZSB0ZXN0cy4gVGhlIHRlc3RzIGNhbiBhbHNvIGJlIHJ1biBpbmRpdmlkdWFsbHksIGp1c3QgZXhl
Y3V0ZSB0aGUgcHJvZ3JhbSBhbmQgdGhlIGV4Y2VwdGVkIHBhcmFtcyB3aWxsIGJlIG91dHB1dC4g
Tm8gc2NyaXB0cyB3ZXJlIGNyZWF0ZWQgdG8gcnVuIHRoZSB0ZXN0IHN0YW5kYWxvbmUuIg0KPiAN
Cj4gU28gdXNlIHJ1bmx0cCB0byBleGN1dGUgbHRwLWFpb2Rpby5wYXJ0NCB3YXNuJ3Qgc3VwcG9y
dGVkLg0KPiANCj4gWm9ycm8gYW5kIEN5cmlsIGFsc28gZGlzY3VzcyBhYm91dCBsdHAtYWlvZGlv
IGRpcmVjdG9yeS9maWxlIG5vbi1leGlzdGVkIHByb2JsZW0uIFBsZWFzZSBzZWUgdGhlIGZvbGxv
d2luZyB1cmwuDQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvcGF0
Y2gvMjAyMTA2MDExNTU0MjcuOTk2MzIxLTEtemxhbmdAcmVkaGF0LmNvbS8NCj4gDQo+IA0KPiBC
ZXN0IFJlZ2FyZHMNCj4gWWFuZyBYdQ0KPj4gSGkgeHV5YW5nDQo+PiAxLiBpZiBub3QgY3JlYXRl
IGRpcmVjdG9yeSwgaW4gdGhlIGZ1bmN0aW9uIGRpb19hcHBlbmQgVGhlIG9wZW4gZmlsZSByZXR1
cm5zIGEgZmFpbHVyZSwgQmVjYXVzZSB0aGUgZGlyZWN0b3J5ICJhaW9kaW8iIGRvZXMgbm90IGV4
aXN0Lg0KPj4gMi4gVGhlIG1rZGlyIGNvbW1hbmQgaXMgY2FsbGVkIHRvIHJlY3Vyc2l2ZWx5IGNy
ZWF0ZSBkaXJlY3Rvcmllcw0KPj4NCj4+IC0tLS0t08q8/tStvP4tLS0tLQ0KPj4gt6K8/sjLOiB4
dXlhbmcyMDE4Lmp5QGZ1aml0c3UuY29tIFttYWlsdG86eHV5YW5nMjAxOC5qeUBmdWppdHN1LmNv
bV0NCj4+ILeiy83KsbzkOiAyMDIxxOo21MIzyNUgMTg6MDUNCj4+IMrVvP7IyzogSmFtZXMgRG9u
ZyAotq3KwL2tKTxkb25nc2hpamlhbmdAaW5zcHVyLmNvbT4NCj4+ILOty806IGx0cEBsaXN0cy5s
aW51eC5pdA0KPj4g1vfM4jogUmU6IFtMVFBdIFtQQVRDSF0gbHRwLWFpb2Rpby9kaW9fYXBwZW5k
OiBmaXggZGlvX2FwcGVuZCgpDQo+Pg0KPj4gSGkgZG9uZw0KPj4+IFdoZW4gcnVubmluZyB0aGUg
ZGlvX2FwcGVuZCB0ZXN0IGluIHRoZSBsdHAtYWlvZGlpby5wYXJ0NCB0ZXN0IGl0ZW0sIHRoZXJl
IHdhcyBhIHByb2JsZW0gdGhhdCB0aGUgZmlsZSBjb3VsZCBub3QgYmUgY3JlYXRlZCwgYnV0IHRo
ZSB0ZXN0IHJlc3VsdCB3YXMgUEFTUy4gVG8gdGhpcyBlbmQsIHRoZSBmb2xsb3dpbmcgb3BlcmF0
aW9ucyBoYXZlIGJlZW4gYWRkZWQuDQo+Pj4gMS4gY3JlYXRlIHRoZSBkaXJlY3Rvcnkgd2hlcmUg
dGhlIGZpbGUgaXMgbG9jYXRlZC4NCj4+IFdoeSBuZWVkIHRvIGNyZWF0ZSBkaXJlY3Rvcnk/DQo+
Pj4gMi4gcmV3cml0ZSB0aGUgZGlvX2FwcGVuZCBBUEkuIEFkZCByZWxldmFudCByZXR1cm4gdmFs
dWVzLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogZG9uZ3NoaWppYW5nPGRvbmdzaGlqaWFuZ0Bp
bnNwdXIuY29tPg0KPj4+IC0tLQ0KPj4+ICAgICB0ZXN0Y2FzZXMva2VybmVsL2lvL2x0cC1haW9k
aW8vZGlvX2FwcGVuZC5jIHwgMjYgKysrKysrKysrKysrKysrLS0tLS0tDQo+Pj4gICAgIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vbHRwLWFpb2Rpby9kaW9fYXBwZW5kLmMNCj4+
PiBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vbHRwLWFpb2Rpby9kaW9fYXBwZW5kLmMNCj4+PiBpbmRl
eCAzZjBlZDI5ZDUuLjUwMGRmZGMzMSAxMDA2NDQNCj4+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVs
L2lvL2x0cC1haW9kaW8vZGlvX2FwcGVuZC5jDQo+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9p
by9sdHAtYWlvZGlvL2Rpb19hcHBlbmQuYw0KPj4+IEBAIC03NSw3ICs3NSw3IEBAIGludCByZWFk
X2VvZihjaGFyICpmaWxlbmFtZSkNCj4+PiAgICAgCXJldHVybiAwOw0KPj4+ICAgICB9DQo+Pj4N
Cj4+PiAtdm9pZCBkaW9fYXBwZW5kKGNoYXIgKmZpbGVuYW1lKQ0KPj4+ICtpbnQgZGlvX2FwcGVu
ZChjaGFyICpmaWxlbmFtZSkNCj4+PiAgICAgew0KPj4+ICAgICAJaW50IGZkOw0KPj4+ICAgICAJ
dm9pZCAqYnVmcHRyOw0KPj4+IEBAIC04NiwxNCArODYsMTQgQEAgdm9pZCBkaW9fYXBwZW5kKGNo
YXIgKmZpbGVuYW1lKQ0KPj4+DQo+Pj4gICAgIAlpZiAoZmQ8ICAgIDApIHsNCj4+PiAgICAgCQlw
ZXJyb3IoImNhbm5vdCBjcmVhdGUgZmlsZSIpOw0KPj4+IC0JCXJldHVybjsNCj4+PiArCQlyZXR1
cm4gMTsNCj4+PiAgICAgCX0NCj4+Pg0KPj4+ICAgICAJVEVTVChwb3NpeF9tZW1hbGlnbigmYnVm
cHRyLCA0MDk2LCA2NCAqIDEwMjQpKTsNCj4+PiAgICAgCWlmIChURVNUX1JFVFVSTikgew0KPj4+
ICAgICAJCXRzdF9yZXNtKFRCUk9LIHwgVFJFUlJOTywgImNhbm5vdCBtYWxsb2MgYWxpZ25lZCBt
ZW1vcnkiKTsNCj4+PiAgICAgCQljbG9zZShmZCk7DQo+Pj4gLQkJcmV0dXJuOw0KPj4+ICsJCXJl
dHVybiAxOw0KPj4+ICAgICAJfQ0KPj4+DQo+Pj4gICAgIAltZW1zZXQoYnVmcHRyLCAwLCA2NCAq
IDEwMjQpOw0KPj4+IEBAIC0xMDIsMTcgKzEwMiwyOSBAQCB2b2lkIGRpb19hcHBlbmQoY2hhciAq
ZmlsZW5hbWUpDQo+Pj4gICAgIAkJCWZwcmludGYoc3RkZXJyLCAid3JpdGUgJWQgcmV0dXJuZWQg
JWRcbiIsIGksIHcpOw0KPj4+ICAgICAJCX0NCj4+PiAgICAgCX0NCj4+PiArCXJldHVybiAwOw0K
Pj4+ICAgICB9DQo+Pj4NCj4+PiAgICAgaW50IG1haW4odm9pZCkNCj4+PiAgICAgew0KPj4+IC0J
Y2hhciBmaWxlbmFtZVtQQVRIX01BWF07DQo+Pj4gKwljaGFyIGZpbGVuYW1lW1BBVEhfTUFYXSwg
ZmlsZXBhdGhbUEFUSF9NQVgtNV07DQo+Pj4gICAgIAlpbnQgcGlkW05VTV9DSElMRFJFTl07DQo+
Pj4gICAgIAlpbnQgbnVtX2NoaWxkcmVuID0gMTsNCj4+PiAgICAgCWludCBpOw0KPj4+ICsJaW50
IHJldCA9IC0xOw0KPj4+DQo+Pj4gLQlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1l
KSwgIiVzL2Fpb2Rpby9maWxlIiwNCj4+PiArCXNucHJpbnRmKGZpbGVwYXRoLCBzaXplb2YoZmls
ZXBhdGgpLCAiJXMvYWlvZGlvIiwNCj4+PiAgICAgCQkgZ2V0ZW52KCJUTVAiKSA/IGdldGVudigi
VE1QIikgOiAiL3RtcCIpOw0KPj4+ICsNCj4+PiArCWlmIChhY2Nlc3MoZmlsZXBhdGgsIEZfT0sp
ID09IC0xKSB7DQo+Pj4gKwkJY2hhciBjb21tYW5kW1BBVEhfTUFYICsgMTBdOw0KPj4+ICsNCj4+
PiArCQlzbnByaW50Zihjb21tYW5kLCBzaXplb2YoY29tbWFuZCksICJta2RpciAtcCAlcyIsIGZp
bGVwYXRoKTsNCj4+PiArCQlpZiAoc3lzdGVtKGNvbW1hbmQpICE9IDApDQo+Pj4gKwkJCXJldHVy
biAxOw0KPj4ganVzdCBvbmx5IGNhbGwgbWtkaXIgc3lzY2FsbCBpbnN0ZWFkIG9mIGNvbW1hbmQu
DQo+Pj4gKwl9DQo+Pj4gKw0KPj4+ICsJc25wcmludGYoZmlsZW5hbWUsIHNpemVvZihmaWxlbmFt
ZSksICIlcy9maWxlIiwgZmlsZXBhdGgpOw0KPj4+DQo+Pj4gICAgIAlwcmludGYoIkJlZ2luIGRp
b19hcHBlbmQgdGVzdC4uLlxuIik7DQo+Pj4NCj4+PiBAQCAtMTM0LDEwICsxNDYsMTAgQEAgaW50
IG1haW4odm9pZCkNCj4+PiAgICAgCSAqIFBhcmVudCBhcHBlbmRzIHRvIGVuZCBvZiBmaWxlIHVz
aW5nIGRpcmVjdCBpL28NCj4+PiAgICAgCSAqLw0KPj4+DQo+Pj4gLQlkaW9fYXBwZW5kKGZpbGVu
YW1lKTsNCj4+PiArCXJldCA9IGRpb19hcHBlbmQoZmlsZW5hbWUpOw0KPj4+DQo+Pj4gICAgIAlm
b3IgKGkgPSAwOyBpPCAgICBudW1fY2hpbGRyZW47IGkrKykgew0KPj4+ICAgICAJCWtpbGwocGlk
W2ldLCBTSUdURVJNKTsNCj4+PiAgICAgCX0NCj4+PiAtCXJldHVybiAwOw0KPj4+ICsJcmV0dXJu
IHJldDsNCj4+PiAgICAgfQ0KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5s
aW51eC5pdC9saXN0aW5mby9sdHAK
