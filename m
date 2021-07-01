Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CF3B8DC2
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:32:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFDBE3C866A
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:32:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2C9E3C247E
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:32:28 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EFF1E200243
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625121148; x=1656657148;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=com6A7HZlxeRa1OUfsdNT2/fbrILffwHK3ZpoSeozN0=;
 b=kBu+7Cd/ylOXPuD7lidwE1GLhdPni6OQhfDgDmJ+LYwOKVOZDH4JIVEt
 rKjQgBfihvm1zIW3uEqEiDNOqWyKMxm7XLzuz33MGqCYwRRupFivPfQ7Y
 WBAjJOUpiLhHVdDrT7n14JrNEjTAYXxmgNidQjSaGYhPzDY4nBwwENljR
 WMrLtdqdMJtxp7rNBfnVlMnhfIiozeCne6giP1pYSyzZKyNZDcFKyxbwy
 ICvsmU0n7b/8Sefe+G1/cNQB3O4TcPcBp91GtHGjzTijR3aC0jhX0iDDb
 xlUDmEanDfeW+4dSZZzFdIlGGdYeTmBsS+DUA3lmu3b9SQOat5Sa8BVVj w==;
IronPort-SDR: KTFbxpQPD40D6A270ONVeDHFlEAT7mJLLforcrQYmTpt8biMfnB1evJNAMghNKfAdj89g7sNM9
 POhNRQ3lyUl4PuCpqDztisiZDYGnVICfEfWvBhBGKbAmqtYOde6gtJuzXXRN384DbPpSXNR7Qx
 6lGacjXfziM+3oI5WhkXdc6b8VfyIQXtY87zSOYY/xwlcnoM4c+c71wfwiUhwQaWbuv9oAtSXC
 uPgPMuLCbwacQWd7Dy4lKo2y8SmEC9ICFqg8fqbJyqGCD9ydQg2aS9LtPqN00xtbrNAoAxs7DA
 D3g=
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="34147773"
X-IronPort-AV: E=Sophos;i="5.83,313,1616425200"; d="scan'208";a="34147773"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:32:25 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbu9DjCMCq+PVcdkvgGmunJh4cTsX4KvyxKRS97BeKyNpJTX165TqunCP8PB2GsBMYNG5aUt51KqjN9sLLVW16Y5WNlLLLklde+3YlcFXZVeXqb9amcLcwXunX2hNaqUNVosCQeFhh6FQMZKgaHwHdmyO74s7Sh2CkiGOhF5lyILil3M1ZZ1/8EDg5P+ygGyf0naKg4TXAr4bXE8s35j9dgAj8XP9Ib5jLK/74d0Zpod6e45tL8Dg1Dc+hfbBmAE6QYK/XcNqR5qpyHeULmgPjp+LlttBIItYQi8tT2Fr9Z6SAawyKzNO4ydjJ+qGdkVupYG8sQ2nFCAXdN7zjIUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=com6A7HZlxeRa1OUfsdNT2/fbrILffwHK3ZpoSeozN0=;
 b=NGkeU55FnazXFv9zW3ZNmlMjZq4wADb0AE9kL/QOJ0m7bviBbYrbuxsQnKMl5LwskCFb1EPKfQ36El6SJ7yAfY06FXpg2o72yeLPjh1Zl6NCFAGD/xHROaUt8A3ZTHVJZVGZLZfYQ6GeuRrjyM5SfHwVuCLrkvx5QuBZALHZYhPRIrUVuMgk+cH5aBSsrDLz4SNH/ftgto66l1wFbFrrkHVXwRIdfXEaRTvWYDKfhBAratHqlvkHnt9iIIQ2WjHyFjnM/1fOxjW11j9DCqgSsQvu3niqjPv5iqoPUTA6NR12GVcIYyH/q1rhfDlZHDgHR3BUkuOts8/LCx9brxMY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=com6A7HZlxeRa1OUfsdNT2/fbrILffwHK3ZpoSeozN0=;
 b=FP48910NNEt8jBuBjgVw30yqOJ4rA/Osk08oR1/UxMlHiE3XKLYiLj96bir2KhPfcKNgjPCVV2ssAy77oOuI4sTO8r7crT2/LizXJLNcmf72nlbVkPHvKeVUglVQ4150TyFvjKJtIXhVFyCpznoskUMOXVLQs0J8Y+WDYyCn/g0=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OS3PR01MB6341.jpnprd01.prod.outlook.com (2603:1096:604:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 06:32:22 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 06:32:22 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <petr.vorel@gmail.com>, Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH 0/2] API tests cleanup
Thread-Index: AQHXbjZ3xCQRn/PVekW/aXkMhl88yKstnvMAgAAI2QCAAAGUgA==
Date: Thu, 1 Jul 2021 06:32:22 +0000
Message-ID: <60DD618D.10100@fujitsu.com>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <60DD58CE.5070800@fujitsu.com> <YN1gOkdw7b8b833v@pevik>
In-Reply-To: <YN1gOkdw7b8b833v@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81950019-2aa7-4eeb-d935-08d93c59fbd1
x-ms-traffictypediagnostic: OS3PR01MB6341:
x-microsoft-antispam-prvs: <OS3PR01MB6341BF11A691BBECA1F472DFFD009@OS3PR01MB6341.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ax5EYrMNo2vlc3GaqQItZu04uDIxlT+tJ2i90gbTaDrX80KvNb9/YQdGLUVc1dguE0kKUypzu96vfpJI+zikcFrYcRIFTkxlQn/B01pM6o7/2NCnSoyN+YA9BVqTO5A0ncCLVFINvJalQEpMm8NaPZhuFhp4w+g6VsbZzW7ZxWRSfBv/9BF3pfdOtcBfkfVpqATT/HOW5nk9ttcko305/BRolsDF1vp0V8INWNnfQGYJzs5Lia9QJJ3TNJIj8geQ/gostng6BVmHqBi7WBklAGypXwAvUSnQ7S6UWA1hbUJ5nnVREluu6oW6nHNgSm6SxCf6Ugu4Cqw5KfRafrK4Pot1Z8PU3cWYEUfwswRU5OxsP1cmPHn8e9z0ewWlsH49jLQnqOeXqgrI1VcsOxFaTYEbA6phzrOXnZruBWRKgJ8UdDX8bU9kVsnu6mg9H64uvJYZS4fZH0Gio/2VNyNz3Q5SMayPFA9W/tw3fr/aBHxech6jcuqwKp/XLdGR/G9KIxOwNx+Ks26/CjkpjxDllHDSgpyxN4YmvPuIfNJnJD3b8TPy/aPd9Lmzb3aYqoYY8rqd8iiZ4T9U95RFDWK/NDbRn8TwxASzw7oawlg474SyzXVkIffC9uB1uClOndYTKMFyBNkJYZ1iSOiUp+hSMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(71200400001)(38100700002)(85182001)(186003)(110136005)(26005)(4744005)(36756003)(66556008)(478600001)(54906003)(316002)(2616005)(122000001)(2906002)(76116006)(64756008)(66476007)(5660300002)(6512007)(66446008)(8676002)(86362001)(6486002)(33656002)(8936002)(91956017)(66946007)(6506007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?alFWRkRDVFlvSjBieXEwdlBaZ1FFSzdhekpTK1Fqdm9WdEErR2xxbHV2cm1t?=
 =?gb2312?B?MjNYK0JvQ2RhZ0JGYzd6UUdNcXlBSGFhUjZIanF5UnFCcWJ0bDA4d0xtbTQv?=
 =?gb2312?B?dzNQcGNLWUI5Tk9aL1dvTWUrM3Zja1J3Nm5xWGtDampHVEllZ0tibG1COG53?=
 =?gb2312?B?R2lQOEVRU09iVmtFRDU0Q1JaVzdNQkdkMURhZmtwLzJsaDJYaFovSjVXNTN3?=
 =?gb2312?B?a1ZzMk9Ld254bTVVelJ1QitrVTEwSUNSbnVBMFpWMXBtTzZDV0RJNGc3UzJN?=
 =?gb2312?B?UFFOalFSQjB6ZFg4RnA5TnlOOFljUCsxTk5RM3dyQWt2TVBLV1MvQVZhZWJu?=
 =?gb2312?B?M3IzWTIvNERIaFF5eUpOU1FFT3Avd1EzSjd6NTJXWnpwb2g0VWIwUEdpTFlj?=
 =?gb2312?B?dWpLNnVhRmlzWVpjRnk3a0kxcG13dHhNcjVNcmdoWS9VMkZNVXU5TURuTDJv?=
 =?gb2312?B?Zm5oMWkwV01FZDh6YlFpWTA0TDN0YUhZcWNYK1dDUGFzWjdHc1kzcHRtWWRv?=
 =?gb2312?B?YnJ3UmZ2V1A1dm0ySzEvd1o0SjExSTdGQzIwVktncytOM3BXUWRWcXZXVy9u?=
 =?gb2312?B?UXdrcy81MWpzb0cyMEVFQnZKbXFYcEtsQkxmTFN5b1VxSUo1RDhvck93cEU3?=
 =?gb2312?B?NkoyanFtMXVCdC80UytLYks4NHBVb01IS3FxTXhjZHF5STlpTXhWcmpVU1BJ?=
 =?gb2312?B?N0hsaWVIQkE3K3d2TlJyblZtRTRzbjRxQjNjNUNuaUgzaUdUdFRjb2pZWGlz?=
 =?gb2312?B?Q05oekNsTWlyZ0NVaWl1a2xWZWxta0JKZGhBcExSbENqTTdEMEdtcTJrN0cw?=
 =?gb2312?B?S2d3eTc5ZXJSM09hMDZTL0lIUVFmeWxLWW5QdTZUenpHbHl4bHFudjRkTjhO?=
 =?gb2312?B?TnRKTFY4VlR1OHhSY28xdzU0SzVIT3hLdGtRZ3hwSjlTbFF3UWpVV0VhY1pF?=
 =?gb2312?B?STlpSExLalB5anlyWFlNZGQzY0JHSXJtZEJxRzRJQ2VNTjl2aCtJZ08zREtE?=
 =?gb2312?B?WmU0Ni80K1NIOU9TejVYOVZ1blhQRzYreTdndFhlR29vUmpkeCtDTXpWWWVD?=
 =?gb2312?B?WlRXYUhjR25lY1B3K3o2NnVzZFNvUHFacG5td0twK0Z5ajhNMVAvc0F2TFlW?=
 =?gb2312?B?TG9pNnBPK2lhYnB0eXE3VlIrbGJ3d3hDUmdnZldIK24vcENDWjJSOXJ1aEV5?=
 =?gb2312?B?ZWNweVpOc0o1alJhM0JPZVJkckVSMm5XSEI0eEZXNXBvTmdZbS93eG5iOEN5?=
 =?gb2312?B?Tk5vNU9UdHQ3Z3dGaWlBTEdsMHVLelZ0RmFFWkF4dnVzWnd6T1dpcFRNTXFy?=
 =?gb2312?B?SnR5S2gzZlplbzFGeVEvSjUya3VCNXlWbkNjeUJzR1ljRlFHUTNGUWdDRGNZ?=
 =?gb2312?B?WUdKWTlNTGdxOWg1amp5c3pvdWlVd3RLTzFYOHBXRldVeW1vTFBDbXAycEhD?=
 =?gb2312?B?N3lEU3pTa2Z5Q01FQzd1dWdlZVVDZ0dmU0lUS1ZCcjhoMHI3TTlkbGpzWDF5?=
 =?gb2312?B?Z2ZZZkU3aXBZUkw4RDFTR1hhb1BndTE1ZEdUcGJBbkRBZzZZcUhnY3dkTnZI?=
 =?gb2312?B?d3hDV1d6c3FsY29sVkVSd3NyQk5BMWlFSDdvWkpqWUZHSnAyVWFybjNsWEJa?=
 =?gb2312?B?NzlGSVF2WERXWWkwcGd4aml1K3hHS3RoZ2luUnVITDY2MTBwQ0ZOb2I3STA2?=
 =?gb2312?B?aFByM0RUbnQ0VFFsanYrQ0ROb0l4cXFQWmluS0xiSUlTa2xTcmp1M3RWVjJi?=
 =?gb2312?Q?fs6b+BsLr8w9kUbrduyHMatQe8T9gXoFkZ95b5i?=
x-ms-exchange-transport-forked: True
Content-ID: <95B8F7C10EFF184D8B74FBF0C6061161@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81950019-2aa7-4eeb-d935-08d93c59fbd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 06:32:22.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SCvFoCINJd3Ny9TGpX40Mmz/I9pGxmJjo1ttHTiINVRK1WAGSHpeTSXA0y2pd1InTZgQCyJoJsn2bUY30GuwL40e7D6GNzFdB7NWk9W3M/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6341
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] API tests cleanup
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr, Li
> Hi Xu,
>
>> Hi Petr
>
>> Why only rename these two tests?
> There have been other tst_fuzzy_sync* tests, test17 had other issues to be
> fixed.
I see. Anyway, this rename patchset is ok.
Acked-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Best Regards
Yang Xu
>
>> ps:IMO, test01-test21 also can ben rename to a meaningful name.
>
> Sure, feel free to rename more.
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
