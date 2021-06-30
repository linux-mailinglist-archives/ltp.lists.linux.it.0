Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A53B7BF1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 04:53:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 826D33C93A2
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 04:53:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A50633C1888
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 04:53:46 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 89845140042F
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 04:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625021626; x=1656557626;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LJSVr4tLShNrHRzBcZjchUEZlV+NEcl9q6s0Tvwo5Ck=;
 b=UcwSIkM3KGIWU6P0mHl+H7+TaWCsGSfsCu9s4YKFBUrzdZZmJyNMZ+Jx
 ZqYlRLlAnXaPJYSAcWaKI8PLVSVuII8CV67GvbTY6+roml9g46wdo41RZ
 8V7ky9VkzQSM/SgoNrw42/7Oi2j5NIYjfCwR4u6+p5zk89ZFdK1wHn4aP
 sqHBNd4plcaw0xlSuXiB1tckY4noh+/ZUyhkbQGpKDiKU/6PK3BHKj6cI
 ANcHQrpdJFzI7IBUjJLmI7D8pFLllT4Twa0/N7LjkPRHtzF7vY2NOTGYH
 XXozgQaFAdM+B7tLkpzeU8TlXkRVORQGqTEFnH9horzZUYxQIP0J/lLGW w==;
IronPort-SDR: 1fNiAs9Hz9HLG6zrtRVfFu7ki2795wGAKgG+28eqKyZzdD4hIBZIrUq8u6DKFnWP9ihsSALiLh
 qQM+Xxi0sbgfW3h/HnStjyUgNz4ikXsgKOW07/lSqNaxoF0bdRbaZc9hnOL572Pt3lOPELeB3H
 QPQFT3DVDJX3slqkM3MCtmfWtMgmS+5sT3kvKW4rNAWO9wDVvBrer0+1/Y/41CXxsL29P+XGTO
 qTfmK8vNs705cK5XYOslUmjAodMEV65ipkaOc0mDbeN02md6x56e/Fhy+SPANqTC3NLlLdr1VM
 5bY=
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="34004201"
X-IronPort-AV: E=Sophos;i="5.83,310,1616425200"; d="scan'208";a="34004201"
Received: from mail-sg2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 11:53:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBWoilfbRCrkzQADkYl3dPJZWohZiui8vyerQBQoxlJeuGpjLNgVy/XIgfiz3v3ohloiRgqWd9ieMe0yShR7WDaKfhBC1JlnQubHyYI4wkWvADVLj/0xLpnqmwfWLsk71uM1PEDhIm8JmQuEz6/bmj8eRg59fP2jPWt+eO4KG4RgoZdRS3c6Owb6ApEPxK5iy3YkbokEocExBVQmujnDhcxH4c6MhpMAZJMgMO0igI1Hi5IE9V2nOEWq/AmoGXcAJlm0MWF5QQcON9hdOhGOEfhf3R3+ojOEa4nFfK+D5fcwfBJdn/+puaWvPwLeKcwFlVcKMlAe1T/wOTEajXJlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJSVr4tLShNrHRzBcZjchUEZlV+NEcl9q6s0Tvwo5Ck=;
 b=mJV4Gf0Wnho0ZndNw1907Zex6j+P9m6WNox24X3KcSMLI3FH2IXp4fkJ2phqQMbhlXh0JUrIYNQE+sVM9LOc7RZ4QJpqJ5h5YGTaXFY2ddpYx2a8iFV/EM1pMXRyHIEMUP333hRd/yypTNBVh5X4CxsKhAjUwm5XRXXmICCBDq8CHnBWLpNU0iaM64feoKw2+7ooiyE2xhvl0SpReNIorGEVKRUfy19IofjxCkenDjPGb1J4tyf3TekXMTYkWCe877osblY6DeWIt5sv2rKpVTEcq0tnoRiN9nWfwlvEHqFH/FBxifVnv4+znjdtEhsGz+kc69wsnri5NmWk2q7djQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJSVr4tLShNrHRzBcZjchUEZlV+NEcl9q6s0Tvwo5Ck=;
 b=LJ6Fqimk80ZJR6ilYDnkuQGNSTLtJCZyK0GiXgqaH6nNgmlPPBBFdya/RvXiWoNGUdPCgBPzS+yeVuIVb63EMy2bf4egj6KDYRZN0m90zOIisw6HxUSTGL+EiMrWchkW1Q7crCxEE3UDvrM3Z2icYHCD7VWnN9R2DimQl6x7YR4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3563.jpnprd01.prod.outlook.com (2603:1096:404:d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Wed, 30 Jun
 2021 02:53:39 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 02:53:39 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [PATCH v2] lib/newlib_tests/test_macros*.c: Include more test
 macros
Thread-Index: AQHXbNfh+J8rEZWChEuhyeQhZCOBFKsq6wqAgADxooA=
Date: Wed, 30 Jun 2021 02:53:39 +0000
Message-ID: <60DBDCC9.6020809@fujitsu.com>
References: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
 <1624965249-7087-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <CAEemH2fcsimizmXWzQzavMWz4rOBVwznB9r7aPLgqasYcjfJqA@mail.gmail.com>
In-Reply-To: <CAEemH2fcsimizmXWzQzavMWz4rOBVwznB9r7aPLgqasYcjfJqA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 481914ce-b383-49c5-26dd-08d93b7243c5
x-ms-traffictypediagnostic: TY2PR01MB3563:
x-microsoft-antispam-prvs: <TY2PR01MB35632B9B21C541FA7D450C62FD019@TY2PR01MB3563.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ze3mXVd2QTExNcH41f/+sXzmCwyuCfx3JdmhZ9nqMJw0syfKF0jaazZl/RBXSUFQAsChEQomeq4cIknmqIWw9v74mXO/5GUKN/fSYqMixnYF0Rn6o1C9dcwXeZlJhe+bqSw/UWXH+ZODoY8epJB+7/futdgLJxjf6RmPx+iLKTzM18AWi4gBbTI/FP+dDYd5U5rbxwSonKyQicZAuQSJ4bHbugTKnt4dH2Mrd993p0+M1l1a1fDjmbsAfBLNxa1YZs8oSIttVlWDTrsY0JKZsW8I4gUjkVfYZnEixI1MKtWgpjnw8qYPNBBmKAnIjXB0uh+y5XmNSG84WMtvXfwB/cAzQmx1RKZXZ9mpysFHV87qKcuHheQGjMc+rP9oaZL+Y7uZh2HgR6B2HxpmZe406nPAz72FukTrzouJ8HgWGYw3SUGbFfIDLYRvxCVaHtp2JeFmbS1QgojUZ0dioLqmwISDDcz7xHvvfwA+v1UbgoAr7Ap8jv4OoyZdbFtdiMkmLEneLlIcJYqLmZ/Ce5UUnUzSN43VHkaA0tBnR4UeCrtoSCyjUoef2r7GdObBlSqB+zXNXP8H/y6pOcuFUzN0SKFophKKDrCB7Ni+mahxV2ufUBglgL2TvfZXxM3AU6RvW+vgvQZ4BhJUsHOLAmogjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(8676002)(8936002)(6486002)(71200400001)(53546011)(122000001)(6512007)(2906002)(86362001)(6506007)(6916009)(85182001)(4744005)(38100700002)(87266011)(478600001)(36756003)(5660300002)(91956017)(33656002)(316002)(66946007)(186003)(26005)(66476007)(66446008)(64756008)(66556008)(2616005)(4326008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGJCdEtDanRRWHBObGhuL0o0OUpWZGI4bW9id0w5aUhOVlJvR2QyUUdkT2V3?=
 =?utf-8?B?TkdhdVY5Z253NDlPWHc3ZWd5NkpaOXVLWFBzSGVVWDJZWkEwSFUzcW1IZkgx?=
 =?utf-8?B?blg1b1dkOVdFRWhNK3dRNFNvdkYrWnJQR3BXSElyazJYQWhsM25xUmtmd3VW?=
 =?utf-8?B?OWxkbU1XU2Y5dkpBTU5OcWZobkVIbUJjUUdZTGk3SXdyUjQxZVQ4WDRubkg1?=
 =?utf-8?B?UW1ycUxQNWh1U3pZM0ZsUTRpVTNDRE81b200cWhhSG5CNDYwUTVlcU96U0Ro?=
 =?utf-8?B?SVdYdGFSZDZlZiswbG9JVDRhRjI5L1Vuc0dCTkk0Z1BCd1V3WVR2WTU3OFpT?=
 =?utf-8?B?bHg4NXFHUDhsYzFEVzZkcTJvTGEvbS9xMHlwVW5xTWFOdGN0ZFNMbnh3aE11?=
 =?utf-8?B?ekp6UlIrbUE1SSt3ZzR4VHVncWpkelcrMDFsT0R1UXpFcUVMYmcxclVtQWxv?=
 =?utf-8?B?MU4vc0NseGltbGNlTmFBRzBtV1VhWTlkVXg3ZE4yS2pKYzRrK1lUNzJFV0xF?=
 =?utf-8?B?VmxzQ3VBV2RKM0grbUF3Qkx0NzRoY3ZNS25SR3B1U2lKWERFVkhya1RiQ0Nz?=
 =?utf-8?B?dUoxcDRMZFVVa3gyQzhIdVRVNHBVNHl1Y0JXTGdEL3h4K0wwUzZxUTBTU1lZ?=
 =?utf-8?B?L0hxY0owdXZIWVZLZXRtYlNUeEwzcHJ0Sm5McU1yT3BOdDA4QkNwZzVQUkVz?=
 =?utf-8?B?Q05uc1RManFmSVB5aHYzcS9vWmJGYnhZVmRVY25qSUpqelJ5NmVSNnpldTQ5?=
 =?utf-8?B?VHc1Q3l1azNndUg4azFUS1VxdWZSNTN5cmVTb2VGbU95djFCeGFnYXdyeGRG?=
 =?utf-8?B?M2hzWTc5OUVZVlg2SDd3TVZCWnl0b0duUUcyd3FnNklUa0U4UXBkVCs5a0Zs?=
 =?utf-8?B?Vzg2Z3ZlYzlPbTQvMHczT0kycVBITVA4Qys4TTRFRW1jWDhEOUJweVdRb212?=
 =?utf-8?B?NC9RRW9uOVFnS2RrWmNyU3NtN2xybkFFU093aXRTUXQwcG9YQTRrV1JvTU9i?=
 =?utf-8?B?VllHNm1UMklQOXpaR3BrQ0pZaWxIeUdrVnlXRlB2Q0FHZkhoMFhONmNEWnlO?=
 =?utf-8?B?cm9IWGxhWEhGTnM2dDhma0JGbDYrNGwrdGRoTmRmVms4ZDA4ZVdzc0tYMXAw?=
 =?utf-8?B?SkV1NHZtM1JXWWhTQklJRVNyMVVkZ25KMGlCUk1wZ0x2SGdhaFdiS2NXdnBQ?=
 =?utf-8?B?Y1FXclN2MUxaNExuNjNSMnV1ckFwRzFndnlTdVBOWEw5YnpwR1lqR0dVbGd6?=
 =?utf-8?B?a2FVdFhPekgwaS9jdHN1SEhWN3oxRFpCdWhlMXc2em8ycEN0Z1laRU1CL3N0?=
 =?utf-8?B?Yk5uT2dyZDBZNVc0WU0relp6VE9lamZTa2RPZHdqWnJtWGhBQVZhcFpQMjFk?=
 =?utf-8?B?c0Y5WXlrSlFRRDVOVStsbzJQNFRuTG1jemVkMHltRW9SaDBLSllySlVYd3pm?=
 =?utf-8?B?bXZWREFtZ0hTN3JYUUovT3BsYVFpWmpQbXpJQzRRQ2tUTnZkSVJyRjNuY2NZ?=
 =?utf-8?B?cFhYOWxqNjk3aFR4MmZiZ05XS0tNTG5YWHlCNUdoNFZZdFhIblZiWjZJUEN1?=
 =?utf-8?B?ZXQ4bTFCOEd6a3Z0dG43NGcrZGU1dC8vVEx1elJkWTNzSDRrcWpqQWEzZWd4?=
 =?utf-8?B?eTRRa2JUdm5QUmpBWnQ5SkJab0orMnBvVW02Um96dE1yK2c0RkltMXRaVS9p?=
 =?utf-8?B?SEozV280R1FXUjlzRkFyR20ya1U5Mmc3enRUb3hwcDU1d0NZZEd3UDNnbHl0?=
 =?utf-8?Q?xw1bZQlV53Fstutai+A7qn96Dhppo0/79/TwmpS?=
x-ms-exchange-transport-forked: True
Content-ID: <EBA06BC035756A49BA7D0C75572E27F9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481914ce-b383-49c5-26dd-08d93b7243c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 02:53:39.7994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12xNs9GBau55LkLKTXXzxJqnbjOM/LpdEgGbeSCRyZ2z70uRmJ8t2tO81oT/PjEhD3Z9Yut6z1G6aAhbEVYjNpxeUt9XYWaoKrrOcVDDipk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3563
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/newlib_tests/test_macros*.c: Include more
 test macros
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li
>
>
> On Tue, Jun 29, 2021 at 7:13 PM Yang Xu <xuyang2018.jy@fujitsu.com
> <mailto:xuyang2018.jy@fujitsu.com>> wrote:
>
>     1) test TST_EXP_FD_SILENT macro in test_macros01.c
>     2) test TST_EXP_FAIL2 macro in test_macros02.c
>     3) test TST_EXP_PASS_SILENT macro in test_macros03.c
>     4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros
>
>     Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com
>     <mailto:xuyang2018.jy@fujitsu.com>>
>     ---
>     v1->v2:
>     1.add more info for silent macro
>     2.replace scall string with function name
>
>
> Acked-by: Li Wang <liwang@redhat.com <mailto:liwang@redhat.com>>
Thanks for your review, I have merged this patch.

Best Regards
Yang Xu
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
