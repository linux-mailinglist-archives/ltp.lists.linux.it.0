Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DF3E0EB8
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:58:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 033A63C7D7D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:58:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 433953C5F73
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:58:29 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5837560071A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:58:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628146709; x=1659682709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WAUj6DtYV5bipvUgzFQl5N1azk4TcBTv2PGv/hzYsPw=;
 b=OnT2MaFxcrF5Xp7LHqHaw/Bo4x/QhidVMiNQ6jO57hTLfI1oey89Y/FB
 La8N8TlSGalawZJSkEUWVFcu+O29fCy7rU9POw0+Tgy7hC0k1CpK/TjCV
 JdoZQXBu8OrFMzViKP8aIrCZtafloBCVNhc5NHBACzTBVeaT9+s0jnVdN
 eGlyIWjZv1p5M7rOtNR+UpsF1iEjIjLLMZSIrbG/ZXaR4DwgXu9Z2KmTU
 llqBtesEpm4pD/oPVPSH/eKVkx4nRnVBDkx0rbWUhjDl7tjmIDH9rImCu
 SviD935hiV8dwEe2tP2ubbjBWSmfjH1fm3KgkroS7ul9qZjET56xSauw9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="35948408"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="35948408"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 15:58:24 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLEZXce7qpnGyXxKQmI5tzRPlBwDd6umvXfLup0FFC1xfdBz6tricrEua8BoDB6JQnaI2/liePVXskXGOrnbiFQD+2V5fCkU9mAabwKYA8gs238JYpCGglObnEasLoUK5khZCOw3rK/2zkNS2116wM6mXqVsqLjQBSk4gi9SY1CTV/9Dez0NnLLHAbRx362PJKyOnMCd6d50r8HHcCZq8jlFkZdy7zErzxwLCRSR3o1lewqpySHJ+rgAUiCwMoKjlmdzXbnEjRZNwu5PEWBoaeVVparGb8SfvVGZxWZc5fuhPEvX7UPrY//uCj/J47oRIuZug0YtTDY6yDcZg85Qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAUj6DtYV5bipvUgzFQl5N1azk4TcBTv2PGv/hzYsPw=;
 b=D/qEasi0+aVAtbzI4ovkC8m1MPiZ98hvh0XsquIQRIAJnVgib2aoc9yxzn7NZdNKtIY5MFjnt2rW1TcAkg0RtwSxKGYvzFFHFORDpkQUvk+dOb5GrpS4+3h9FOAenPLKyF9MQLGIGvUhjjiN3Gy+JgAwJzeD5fkZQHX4388Bko322akYesqtZdqitaQiZwx/KwIkLtALpRmgVOcOUzmLj0ElMD+k7WXl0jzETFErVL2ZzcxPkGv2oB9AEmgeHraXwjlBm1vIeGRf68wOAclOktCXAefpZEUL/cQhCGL6yyx9FPChrpdUY2eWflwiFV7mvuZiMVrQD7S+nnU6FeZeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAUj6DtYV5bipvUgzFQl5N1azk4TcBTv2PGv/hzYsPw=;
 b=L9ktgyyzO7KGK99nb9CG7QfQ3FQeo8xxnHfhZYylW7X/ln7Q7wEZb8zElIPjNLMK/sg8i3wTsWYUV+6FyaP9louj6SFYZdmj6+2h91uyidP6Q6Yh2fzdtUNl3DYuJ2isYYc+CpEltHUfydxe8tU3luQtknSMwWnTCv3Js7z6nUk=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5564.jpnprd01.prod.outlook.com (2603:1096:404:8035::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 06:58:20 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 06:58:20 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
Thread-Index: AQHXdvMY8HjeAIx+30uV0khJgLWyVqtOr+6AgABId4CAAA0WgIAAADEAgAFK4QCAADzZgIAF27UAgA0ogYCAANi6gIAAMBwAgAAGQ4A=
Date: Thu, 5 Aug 2021 06:58:20 +0000
Message-ID: <610B8C19.7070002@fujitsu.com>
References: <20210712075223.10682-2-aleksei.kodanev@bell-sw.com>
 <YPkkZ0Zq9DyHKBaT@pevik> <YPlhMeRRsNnemT05@yuki> <YPlsK8fsMI8T+H7c@pevik>
 <YPlsVD2gbIiX8JJk@yuki> <60FA81E4.3060709@fujitsu.com>
 <YPq0749ZnnGsAV2q@pevik> <60FF9EFA.308@fujitsu.com> <YQqor4LiNK4/Xrbe@yuki>
 <610B5E7D.1070104@fujitsu.com> <YQuG2CllvzVqdw8L@pevik>
In-Reply-To: <YQuG2CllvzVqdw8L@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ba8d3f9-2c92-4415-0801-08d957de68f9
x-ms-traffictypediagnostic: TYAPR01MB5564:
x-microsoft-antispam-prvs: <TYAPR01MB556437A00B0C93128FE72982FDF29@TYAPR01MB5564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jNMdyO24UBBKYtxzT7hU/2UuFo0uHUlpESAqnva4zjxCIMW3qibVWgiwxX+inhAP+SvdsheiVArtLDt/2Rpu0NUrJ1T3pyK4sqkI45I/XUDNU4mzrGWnxTJKF4+27q7slbkZe8R5ZtNU6KZMtQ6ZYwYGjjJG/p4Y5IE1i223JeYJBcze42/mdsMrUHcz8VJJi0VFtaECrcLtVx9DLDJXOD6APA1x12H163X3tAjiJxshK7cKfaODXbcT9SJdomxYVDiZMES8L2qhVGOpu+PzBqDqTnpYRwIdHjdV7oVNrVCTBirLyN5t5l0ZPOZLjq49o64dvALwLSQuicQIRTiAzB6VK8xhmJ94lRMPcSg5tNcJbzomqEcCj4d5iy/b59rsSeQ0E1AFITSFDruTXTDhjKFEFISyuKGE1p5G1VBxbidcyWfK1bjU7A2TZBqYypB3M7f4FUcN94rKsioIVqBOyjtTDj2cM643T5H6bR7HbNMkYo7Ot1nM83bAZL2xQg3NrsJWgQ7cuNDyPt36DLuoBdw+r+YS55PJksdRxQUdutj6Ft7/hwYjfzpBF4+V1IoseTafEA1jAY7hIolpCd72cFh2shT/VoGLEyHGJHuhA9g/BzFk0k5GSWhqQ4lS4tOLhJP3+tHVrVr+HM3VUx6l1p3ah6E433JS56A6mxk0RyEaVV4Nnoe7kO0V2EWDmx7m+mz2t3WpaAIrSNJLptcnzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(87266011)(316002)(4744005)(26005)(6506007)(66446008)(8936002)(71200400001)(54906003)(83380400001)(66556008)(66476007)(76116006)(64756008)(6486002)(6916009)(91956017)(85182001)(4326008)(66946007)(86362001)(33656002)(5660300002)(8676002)(38070700005)(38100700002)(122000001)(6512007)(2616005)(36756003)(478600001)(2906002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QWZvUWppNHVqTjBONGc3U3VsTDA4TGpJMHRBdUI1ZlFGSUMreTZvemRNRHlO?=
 =?gb2312?B?ZFMxb2VDK0lkZHFVNjNaZGlBUlhwaS80dUdyVHJDTGZQQWpPby9tRzJYVUlG?=
 =?gb2312?B?KzF5dkY0VDFsQTFiMmxUVDBCNUlNbnJGS2M1ZHh4c0s1SDdvclJxTHZlOVBy?=
 =?gb2312?B?K1lCSGxMNDVCUEdWWFcwUE4xQUZJT0dPRkxXRURiUlpSakU4eVllOSsrZlJp?=
 =?gb2312?B?dUhNYlRNV3l2cC94b21lSEhXM2Q4Z1lVL3ZqYzB3SGtBZ05UZjhVR09qa2dC?=
 =?gb2312?B?eHZmd3ZBSHNGK1gzSzJZbTZXb2U4UHd0NW5wMjJidUtYSTc4VFlNay9ZRGho?=
 =?gb2312?B?Z3cxNTU0RWJzeUhUN3UzMEtReHZHVm1WN2EvQUp5WU1XZVV1emNkaCtUNktT?=
 =?gb2312?B?QXFmUmxyYnhKOUx4M0lzYnJGb0F5dDdCdmJ2b3lsemUwa1Y3TTJ5Z2Z3cExL?=
 =?gb2312?B?TjAyNUtxMnJVZnJjU2JQSS9ra0I1TFRmTXY1Q2kwa3F0VTVCMFV1dHlNSFU4?=
 =?gb2312?B?cHB2YTJBRFdzbGxtS2pDZnZVeWZXNEdxdXp6V1NhTWN1WVV4QTFYVFM1bHJ4?=
 =?gb2312?B?RCsxbDlUUjVjMzlrUkFROU51M1NxQ1NMQzJOeFVrTjlBL3o1RzhPRENsMGNO?=
 =?gb2312?B?MEJETzRuLzZpTjBvcEZCUXRsM1I4KytUM1NpT1FkWURvR0R3UFRKSTJNU1pv?=
 =?gb2312?B?emFNR0c3a21uWS82bmd0d0E0dDc0ZmMvNjhqSE9HYzl2SUlZNE5sSGFycGdF?=
 =?gb2312?B?OVppNWVTM3JzQUl4L1JaQStNb29yczE5Q2ptUjhodFVKUTBYbG1RbSsvczIy?=
 =?gb2312?B?c3BvZDAzRHZVT25YWmZLcTV4RUhlREUyOEVaT3VWVTJDcHpSS1VMdFp6a2Jk?=
 =?gb2312?B?VGQzcVhBMTFUWjFiNnRnZm5tNVAxeTA5N2F3aU9zcUlLeGt0a0M0NkxLV2s5?=
 =?gb2312?B?YWVTcnpiUFhMVkJnYWhIOHhXQ3o1VVA2OVFKWHJhRFNVR1o1dC9uV2RyYVgw?=
 =?gb2312?B?R29TOUZkTmRQM3g2RDZsVFUvdUdBeXhsU3Z5SXM4ei9yazE1bUVqYUhvckk5?=
 =?gb2312?B?NE9ZYjZibEJ0ZGRTZm5UK2tpWkVGRzhmZjJUdFV4UFVEQkc2cVkwcWs1ZlBJ?=
 =?gb2312?B?OE1QaEVUQnhDeU5DWXdXcHJ2Wk1LU0k0WHhtaWFNbzZnQngwcVg5V0tsZlBM?=
 =?gb2312?B?U01RM2V2R2htM1lQZDJja3YveVhGYitQSUh6Y2UzblJ6TWYxeVJYNkp0SkV2?=
 =?gb2312?B?cCtiUDVDbE01WDF1SW1tTTllaUZaTElDVVFWWG9aQ2NPeXZKdGdiY2FFN3pI?=
 =?gb2312?B?czM5MCtUMTI1WXd6aGZWUVF2M2VOVWRWdHhOUWdpTGFTRGpySWdKOEVOdXlP?=
 =?gb2312?B?cVNSUktwTHpwckw4czdhZmVqYUx2c2JxUXNBTnh3Y28vQ3JHc3d4YVBZeVFj?=
 =?gb2312?B?QnpiM1lhazdQRDM3bWtKM0VPWHdMcGJyV3hyek5WUHgvVGMycHFpRFNrM0hI?=
 =?gb2312?B?TVE4M3RTQVk0aFc3OGwwM1ZKd1dpbnEyN3k5Y1EwNUNLdTlHTXd6a2p2OEw0?=
 =?gb2312?B?d0t2UXRoZFZuZWwvZUxuMkdwQkt6QmJXaC91Y0t5YXBJdTVsSWJYUi9KMk4w?=
 =?gb2312?B?YW5HK2xocjdVMDR6RllzYjhHMHd1S3FML21XQTQwMEwyNDJ2U2V6MTFWcWRm?=
 =?gb2312?B?MjI3WHZUUWFqR3JzQjdOSTY4blVlTGJ4WXBSNVk0WE5SektYemVuSlFSRTFo?=
 =?gb2312?B?TU03Vjl3eDQvL2pybzltR2t6c3JHOTQ2QzlSUkdnaGhvQnZpTlgwRll5SC9Y?=
 =?gb2312?B?YjBzbkdJYVJIUVVaais0QT09?=
x-ms-exchange-transport-forked: True
Content-ID: <BE8F5B8F51ABF3438A2406A11FD42332@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba8d3f9-2c92-4415-0801-08d957de68f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 06:58:20.3878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gP6aelJZpUtSy48hk5cP2gGEdoouQjC6XAEoKbGhe6s55z6DX24F3sqwXcb+QHci74Sl9X21yQkVDQGmqLVJYN7UoHTq4haT/Z074ZrFtXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5564
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
> Hi Xu,
>
>>>> -	if (used_queues<   0) {
>>>> -		tst_brk(TBROK, "can't read /proc/sysvipc/msg to get "
>>>> -			"used message queues at %s:%d", file, lineno);
>>>> +	if (used_cnt<   0) {
>>>> +		tst_brk(TBROK, "can't read %s to get used message queues "
>>>> +			"at %s:%d", sysvipc_file, file, lineno);
>>>>    	}
>> I also modify this info.
>> message queues =>  sysvipc resource total
> +1. nit: I'd also move "at" at the previous line (better for grep).
Sounds reasonable. Thanks.

Best Regards
Yang Xu
>
> Kind regards,
> Petr
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
