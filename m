Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B59E03E2139
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 03:50:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B5E43C7F61
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 03:50:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B88BA3C1B10
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 03:50:23 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DEC72600774
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 03:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628214622; x=1659750622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=huSLR88UhgqUboCz1e2664AQulgYfrNQLXSpi0Gjm2A=;
 b=zYhLHI9fgh4n49lRhqXZLUF/lqXnroklMmLfhBnXB0f8Cqqx5scAVvIa
 WDoSkiQCCcj+GZ28adivfSttE3LEjcwrquXhFYwieFpRlpt/ohTbshnbh
 D8/j64YYOJss2cusS6n4axfcyK2gRkYcp7zYUmTACGVyrMTF24KCNFzOM
 mv0iSVFmQPWtS0OtsRBQv0H9afy/rAGm4NgqSI6Aa3KloArbngjfw7LUP
 sha6LMzEHYYIMMUTmEFLe52UhoQ0+0EBYY5wc1CEIQSgCRd6rVk/ajU2n
 PSsJSNOeZRH/b89cjVUDcedIN0Ok0ug3dXsVIR+MeR+7+Nn+bJo3VS4Sb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="36353701"
X-IronPort-AV: E=Sophos;i="5.84,299,1620658800"; d="scan'208";a="36353701"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 10:50:19 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzpuiGTSYQyDEpc/x+8TuANXFWMxyqBc4bbim+u9YWAUYe6qtYwB2c3VRRDTZglhKxZc2mJbyYjTZMYHvqGxFvUTpyCiCKelkrkt1uk8gt4YnBT2Un+QCFPfKEt9DBmjY2N2MrfCNkuCpmwDG5ZjNsl6CPr1DjO9a0HM1nDKn0zpYM8PY27XcaYNCZ/1HaZzPPU+lAOh5HC+7b6CZjNV9NC13Ubl9IHtrQfDm43QtcF5CdQJELxLUCz/QbNQbICXLpKtmodNf8Q56MJhz5f1gdxBIk0afaqesTiDKnita8YobgqKpwpnWiXYzqAc9olQvunV9SBzZD/JXUzFEXh8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huSLR88UhgqUboCz1e2664AQulgYfrNQLXSpi0Gjm2A=;
 b=IznCiQCyXqPbxgNtjtTHg6ylwKc0LmuXOufHe0hKf5MlacxCLvh6bLzS4X+odvAc0mouY7oYCPmg+qhOd/DQt2nTpHonpsA9Lf+zDbMvUBMbJDk1fznN2oBZMTfAYsLdLFV3ThSbqqTKhK11RkQ9fRX3qUZIGFdgS100m7D5gjUlgpKn2iJWcqoBPPSRj5/4kRoTDl/TxT3vOv40iBsJL333OhNnV0pnmn3u5cuXsEzdMs255hQBHvW1B39u2T379KSRMolHBBI4eFxB9fekikMhIeMtlzGHpNRHMo8oJsaO6ALKAnXQRiLuHERVe1Q120KgRxKcEa7BBjLABKCKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huSLR88UhgqUboCz1e2664AQulgYfrNQLXSpi0Gjm2A=;
 b=hkSy3LBWQpYpwSNfFC4k+n/ct+A6TDkA4GFrAVazzG4lSuwqKnrTZXmuX1oJEBs1xxGgkBijfiEo0fnnpncgkwaXCTMsx6fvYmmDloN3IyMAExm3B21T5dQnVcO4Jo+KTVYfdAAxzi13r8Fn+vCwXkBaejKokZGvVp3a/CKVMss=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2943.jpnprd01.prod.outlook.com (2603:1096:404:80::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 6 Aug
 2021 01:50:16 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Fri, 6 Aug 2021
 01:50:16 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH v1 1/3] libs/libnewipc: Alter get_used_queues api
Thread-Index: AQHXiazDkzoRxLERakuuoJjvce/aaatk4UoAgADWPIA=
Date: Fri, 6 Aug 2021 01:50:16 +0000
Message-ID: <610C9567.8050302@fujitsu.com>
References: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <CAEemH2cf2b+xhrfD+BGVhZ59T4wOm=N+KxhYdVKhhQ9aF441YQ@mail.gmail.com>
In-Reply-To: <CAEemH2cf2b+xhrfD+BGVhZ59T4wOm=N+KxhYdVKhhQ9aF441YQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d99f291-c210-4e5e-7b6e-08d9587c8a50
x-ms-traffictypediagnostic: TYAPR01MB2943:
x-microsoft-antispam-prvs: <TYAPR01MB2943E5CF606C22D598E488DFFDF39@TYAPR01MB2943.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WFp7583ZrZcicMwcfK+yvSavzSi8Qs4iOUNfMiO4vPtit1ol6P6YAVVJ05/LmX/h25x8sU1xCf4lZYCh466qtgiKCC/ZB4DQmI6ZoIhlVW8fbP29VoFozrDQSQ6GJ3CPCUUuS70EDc50xaXjXDC9qO18uSZ91t7p4zP8gqjRHMlEHfmeoKIEyUWdZbJDDYIc+wjAbd7Pj2u4OJKaBexxOdFW/eMyxrYD4o8yFvdtIjnGmtN2C184Hs0HR6bqfRWjpFn+YUO6zrC9cd3M18WL29ZsOGR0gtJkqzK4rFs8ZKVWgRRW/4BRI2+mJEdz77R6VbWrXM8TyoUzyiWIIuSqX0OqTk8o/3aRz59CPbKDIKkQ4e7o8ks2WWbq9j9vIQV084vi+D6j9hiXPiJ7HYpPlTrkTwQVScqCWkr10MFxMcFXsPClmGMxCiVlTRXmwV/OoZFaLoLHZoUbzqjSTHI+3F0G0cLLGqsbKqbzGhqprK5mDkfA3e65jQFz58dhz6rA0gCYkakeQCBJUJX8zSxtGkyVnUd+TlytdVNi2UM6ApWyE2B6SIlAMD79kaAwv11HLiU0T6BRXxaehqq9FOyPThtMu1qF0avCZAup8Dhi/kxXr6dLeYcGNMYvoXur5URW3notJrVFpNeBo1rX6wCbgOi+SFx/R+ueI8aOBOftf/opvU304BY93i4SZ0OHY7aTftmW4pxCwZV4eP779CxWlw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(2906002)(4744005)(6916009)(186003)(86362001)(5660300002)(71200400001)(36756003)(38100700002)(26005)(478600001)(6506007)(38070700005)(122000001)(8676002)(91956017)(76116006)(66446008)(66946007)(66476007)(8936002)(66556008)(64756008)(85182001)(316002)(4326008)(6512007)(6486002)(2616005)(54906003)(33656002)(87266011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFFuOERtTkNuUFZPNXdhT2p0T1BIZG1pY0J2K3Evb1lEeWdzbkJaSDdBVlpZ?=
 =?utf-8?B?MElXNEtQbisydk9sRm45T0pjVHo0eW1ISTFjOWZZYUhwSytPZERqOCttaFAr?=
 =?utf-8?B?QW9VYjBCL0pQdnRwUkpVUUF2NDlHUGRXQnRIUHdscEdyL0t2WFZPbVpJQkNP?=
 =?utf-8?B?NWZFY2pBRjYwa2pWdmltbGx4RGhGMEY3bXVhMjhuQ2JsUHRUeXdmVDdETSs5?=
 =?utf-8?B?N0V4ZWNCZ3NNQVg4eW56bWNJTGhYWjM2SXZpSGsxQWxCZVVSMFlHTUU5bWEr?=
 =?utf-8?B?SFhsVjBpazRtRWtIcFZIRVRSOWNQOUNsWVQ5dVhLYUhnSWxBak5YS3VMbXVv?=
 =?utf-8?B?TGQ2aDU2Z2R4cTY3MHArR1JjOFp5T1VyRVYvM0R6S2ZWZWxpTGZvUSt0TVB6?=
 =?utf-8?B?cWlIL040VDFWQzRZL0JxdFU0TkM5OENIMWhJOFVnT0lrWkdiMU4xb2FzdzlM?=
 =?utf-8?B?MjY0dXJWZnI1UGJGUnUwMHYwdS95SEJpWDFQZjN5ZjN4Q3VoRnltY1dSeTJC?=
 =?utf-8?B?L3JzZlpCWkY0OElNMG5wVXgyZEVXMG1PSGxIOXdsK1V4RENCSlV1azRteFN5?=
 =?utf-8?B?ZHNWc2VvalM1dTRlZFlYNW5CYk4yWWtsUnlUVm9HUVY5em5ydWliVjZyT2U0?=
 =?utf-8?B?ZTNHN0FHYzJXeXE4WWEyU2xNaXQyaWRDbnRweElyWUVFb3hucE9oTG9rZGEw?=
 =?utf-8?B?S3RmZFN6dnRMZjluR2xKcTlDaDBOVzhINDUvRFh3WkRpdkR6NjQzWnRPaGR3?=
 =?utf-8?B?OGJjN2NxZm8xSU5uOHRVY2J5TjBPQ1JrTnJScHFEWi9yNVhWTVk0alpmcnNK?=
 =?utf-8?B?clV1OHpFK0FIQ1pVdThrM2FQRENCQTVoTUpiYmlRNTBVeVhBZkh6bzFiTm51?=
 =?utf-8?B?K3puMVZZWVMrNXNlbm1rbFR2TUVCUDRpdFh4SW95azczMXBlSnBwWDJWODE1?=
 =?utf-8?B?d0tuRDBOYTBLM3RpOVMremVIQi9iQlVadEFhSjBuc0YxeWtXY1JCNU9WWHY5?=
 =?utf-8?B?QVE1TjJRN2ltZmwrYlhiaEpSWjRwQTVnM0I4NUdFcWJsNFNxK3NSdHBNOU9D?=
 =?utf-8?B?b2dXMGtDSk9nQmhWZW40d2RqU3FFL1hWK0NuUHdzU2ZsaVF5d2hTaHJHSmll?=
 =?utf-8?B?c09OZERReUwySHM5TmEyeGlIRGRHZk13WWozU1g0OE1uWUhIcHp2YjZRc1Vj?=
 =?utf-8?B?VU9iUGVYV21VVHE5dE5sYkoxbDNTdnc3b1dmanRmaHIrZCtycmpqdEI0WTB2?=
 =?utf-8?B?MDFYOHhJbjhTQTJPV0NBaGZybWczOE1yQVRGbm9QaTZxd25SNXdGbkxIVlFx?=
 =?utf-8?B?bWYxLzBVMjl6T01ROWVoUStPSVdLTGlMSklEcUZxcURudGVJVE1Jd2lGMFky?=
 =?utf-8?B?Y2pyWFQ5MUR6Q0R4UVl4Y0Y2YmdMNXhHS0FoeVVnUENoeU9DTXF3NTRCY2k4?=
 =?utf-8?B?b240UU90MytYQ2lQdnpSdUVzMXJ6bmJpVkJYeDZjdTA3TmorNlVQMW1WWmZU?=
 =?utf-8?B?bDFFZzZBelZiUmt5YkM1L0tqa3BCWGRWZ2VpV0szRWZOTUxxNmNiWVR4Vzc5?=
 =?utf-8?B?cnFsRTRGa2duanBtQi9kM3QvMXhzMUxURUtJTWp2Sllib25MampHYTIzWEs0?=
 =?utf-8?B?aC9ETmdtSzJKL3hjbG8yK2kvTnpOdHIwUURkMXZtTHFpcGliQ3BQamlseFBW?=
 =?utf-8?B?VStLNzlNcStWVi9MQm1ZeTYyYXdleSt4Z1ZPVFNiY0pGWGI2T3pnQTBwRnpW?=
 =?utf-8?B?c05DQ0Q0UjJmaEplemN5Q1JwbEkxTG5oMVRyZ2ZtVGY1NHA4RndHRkdNZ2gy?=
 =?utf-8?B?S3k5KytLTy9YODBGbUQvdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <25357A940FEE164BB5ADA988D950D1F9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d99f291-c210-4e5e-7b6e-08d9587c8a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 01:50:16.8777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IJuoXu6I+/SBjgpTlfS9G/Nrwi8a5BRwfKaMjOB3H0nFQGi1kajIIpeFlFNhcFSd4vwe7+D/G2pXuF4VTmdnaMVk8r9xrzf8qKBLJyDSp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2943
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/3] libs/libnewipc: Alter get_used_queues api
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
> Hi Xu,
>
> I have just gone through all of the discussions on this topic
> and am feeling this method is not quite perfect but currently
> I have no better idea.
I guess a better idea should be using .sysvipc flag. But here, we  use 
the easiest way to slove this problem. In the future, we can add this 
feature.
>
> So, I agree to apply the method and see how it performs in
> real test executing.
Thanks. Let's listen whether have user complains about these two cases
after this fix.
>
> Reviewed-by: Li Wang <liwang@redhat.com <mailto:liwang@redhat.com>>
Thanks for your review. I have pushed this patchset.

Best Regards
Yang Xu
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
