Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F8E3B8D89
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:55:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAD5A3C8071
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:55:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 678803C6B01
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:55:08 +0200 (CEST)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com
 [68.232.156.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 821911A01212
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625118908; x=1656654908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eOJHUTNQXQ/X7LT3XKxJznSUVdPq2MzaW4ng7td/7/w=;
 b=bok6VApdLMOiVQrEpHy3/Xl3Y5iEOrr4MGl4PB/aa/AHOXWE4V2V7/D3
 72+aHuapWUrVYkFwKPsf+kZC3zN3hQZxvfjZA1DkQCKNa2TFyp+MWhUEP
 0gog/3yJFEGQoSJcay95lhVkQFu05gawc905OIGg11hBycsrc5OGk2zFy
 yeDetaYdSLLhAsubECgdsgmaqsxYY3KDFzpPuiw4OBfaoc2/tfZ6ovHNB
 /foP5h3rWu80BEfRXAkdI7OU6fJFYWIZZpVSxtASKWuOISmMRH7qf/Bgs
 a6vWIC1Z1poxkzxut066j6cEsQVHqdZBQwkZg0i2Cj/s108wUHAQKB0+e w==;
IronPort-SDR: 2+auOH9QMWlloNtjVAN1czz+6q/XiiWUV+jT1sD7bAPe3HxEP9UpHGjCrKJAjoFYI14zkdMlqM
 Uo8FwiiFcLUpqOsQEkYSZkpyGhIkgF7ptSa2mlEAi//qT34WNQodeiEIhzTnRzaI0W8TYjKou8
 CfrnFnNweZNhvTXCPuDB/if2SfzZ3ZgMfr59t+XkJdXNokTY4AYAP7JiAq8q81WJpu3yDqocxc
 v8GjOD3x1UxXV0rn/Vngu6kg7yT9E7JNjkDD5RW5JhzDK4d8wkLFtoFO0Vz0KG7IBae70Wq6E0
 WBA=
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="33924401"
X-IronPort-AV: E=Sophos;i="5.83,313,1616425200"; d="scan'208";a="33924401"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 14:55:06 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK0mccuvopqvfG8pD7bgMmjbez86RifNWn1tyN7LXakhNZldYFwkSLoA56KBLqt1K21ZrVmNfaCWYZH0ruHQC+7chnbQpTLXtfrim1k8ru9Sd7iafoz7On2mLNdYRYFUSpRF475K9VgFnLLM+iuhCW/zx9rr4umtcNSo0ZsyW7IjNzKJi7TeStbwq31s9GVSD5D2qwFQ+nRs3bg/9M4OCBwJRBmIMMUIrlYbzfAealn94PkrViUo1HaphJAwx9MyXgGiu4OGyWj9yRbasvfxFaLyiVgi3FDR/2LfIb0MltfGQm2IXiLR93TI0CWl0ktF1UQAwhoStDx+Ins7GoSX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOJHUTNQXQ/X7LT3XKxJznSUVdPq2MzaW4ng7td/7/w=;
 b=U3GYx/OaiF20MTzau/va8d5DkY+pO0gZGQyftTKVdUiG1ZfQhgTQ0IwHQ2ll9Jx6cPqHRjXZRDArybO86FLwLLM2YY3aYRCvqEa4WZmibPdNM3BmcMDzq6paRtKXRK7Ln6VrlZXBjGuPbpJiIiaxKwx3vXkZNWuZjNsrbSd+fVLn03MkN5JXiu699c4sc62CkQxnMBuuPHWGh5IUwi8wdwaB2a3Waga7XZsdMq/WDXHSjcHuXMZmp3v5BrseT5Xzh1sSukrD1X6RjRQgsNhqqwiIrlFB/eEJaI7OzCwUOao1EOO8EpbeBOzSIZse3bOBufTeOVSyAVLa219nJcrPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOJHUTNQXQ/X7LT3XKxJznSUVdPq2MzaW4ng7td/7/w=;
 b=PZ4DoyPKd4edcDRCBy9lMz22xhqCVON4gfmqi9ix2AeqJlPtZJsvpwXyjFmqRdZeyCSwzYbEW7xO7xibL1FaXTiUeJZKW1DVG1nsNJA3dsY63B9RsNhx085qDmvAZivldqxtLOg2bTKzmC/4/27q93bvmnJFLMt3g9je3AGtbhk=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OS3PR01MB6341.jpnprd01.prod.outlook.com (2603:1096:604:103::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 05:55:02 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 05:55:02 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <petr.vorel@gmail.com>
Thread-Topic: [LTP] [PATCH 0/2] API tests cleanup
Thread-Index: AQHXbjZ3xCQRn/PVekW/aXkMhl88yKstnvMA
Date: Thu, 1 Jul 2021 05:55:02 +0000
Message-ID: <60DD58CE.5070800@fujitsu.com>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
In-Reply-To: <20210701050314.1005067-1-petr.vorel@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4584b70-e1ee-45e3-4f78-08d93c54c4b9
x-ms-traffictypediagnostic: OS3PR01MB6341:
x-microsoft-antispam-prvs: <OS3PR01MB63418C137263B82A22147E55FD009@OS3PR01MB6341.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZCzFMDkQ6dgrU7m0J4XuZp7/Cq6TDGo+EpBwsy+Pj+/mdu7A2hg7WXza2ALujVz6qmLiFgfegvJaxjgnNZIE02ISDwky+cxjKsqeW5/K+sdwBWyllYVH2gTSuhbhPu0tOxDcrAHFtgV3BA3V6BYVROHoSUAwgQy+FfqhQg4oURoF+w27PmGQCQSLNocWyOUrv7zrCy7qUIkhol5AoA2yxGsDGWqDAEVMFBkRW/UQJGIQE7PkxmDw/uq1jwtvt3iLWuzXvxy2XtfshWNgvr5rUzxBRiyzhUN5AsP8G1ByEzqGct16p2KcwR9BYV9CQM5bXVdamlOtfstoeSORxDI4HbXYyex2+0jgDZpPW1orHmXuZhGiLQjwYCUhHalw8cEpK1ZXrFH7d1hBzGjnZzEixh9gZg+dsZh/W5/sC+zrSex6gqErj2C5TEpBY0orPIa/1WpBQxPjXEb6ntwQNV51O1xouUUzx5GagqIt7W/EGwlR3UhNBc9lPL5LYVW3j+ymH3XcwnPtkgUz6Fcn1mtoRkZfzC6zwaE/BHvgie/RaGWBOTCst4jClrzMECyPbpgv2c56mRmvy5gqZ+6M0esu8TBJc2y64Qms2oVr8etMuQkfwXHuFXdi/e5bHhEZWF3yPV8C9qA+MaqHAzxwvDTpAA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(71200400001)(38100700002)(85182001)(186003)(26005)(4744005)(36756003)(2906002)(478600001)(54906003)(316002)(2616005)(122000001)(66556008)(76116006)(64756008)(66476007)(87266011)(5660300002)(66446008)(6512007)(6916009)(8676002)(83380400001)(86362001)(66946007)(6486002)(33656002)(8936002)(91956017)(6506007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SkpzUWM2SEZLNmlmdXdzem8xV2JiNTY2V0k5R0ExN0p2R1E3MmFITlczeFVE?=
 =?gb2312?B?UFlEdzF3aEo2TzJkeWJsbm5sQ2Z5aTgySkU5UUJWT1d0c0hkbTlzYm4wcjFE?=
 =?gb2312?B?eWVJc0ZGTTRWRXVENG5GKzVRUWJOWlcvTFQ3bkZkZGFuUGJ4dUdRbUlPem93?=
 =?gb2312?B?dEpJazRXWmF0SFd4MFU3aUdLM2wvNjN0YlNDbHBvVkYxVGlid0JUTVNhUW1E?=
 =?gb2312?B?aXBnUkxoMDczNzhONTMzNVVNV1BJb0hnSUV3Y2dZMWtEQk5IQmp5dExTTUZW?=
 =?gb2312?B?RGJyTTA1bWl3cVZmdVZQOGpkNDhsOVdHR1BKQzJUYkNUblZQQVBjWnRTWEhq?=
 =?gb2312?B?VytpTnA4V3pmREZsVG9Fd0FrZlRWT0w2SHBySEhZOWkyRElhSFVEZCtIOFFV?=
 =?gb2312?B?di9GbHlQWDFxeXBBU2lRRkFkNXhSa243RXFuUG0wTzRscUF6WmdhVndYUmtD?=
 =?gb2312?B?VTh1WmpVY2YwdEJDb3FwSGp3akFsbzZIdGl6K2hQZ256S3h4SDE0UDRuczdl?=
 =?gb2312?B?TDE5ZHhyZ2ljS3c1ZGZRMHhIRUZmOFZqY2d6YkNjdURaVG94RXhhOUc0bGJp?=
 =?gb2312?B?WitOdVV3WkNkbjFxTVIvMXJIWDhLbzdyOGJ5RkhsMDR3c0tLSWZxTWw2aUwy?=
 =?gb2312?B?YVowcVVaaTNSSjFKK2hIVkdHallFYlRlcnBEMkh6cGF4T2U2dHpCdjV4bzR0?=
 =?gb2312?B?ZU9JRDBTdXJaQVFQeE1vOTVvZkVnUWFCZmptN3ZKWEc2VmxmdkZ3T3E4ekNX?=
 =?gb2312?B?RVVYRTN3OGFSTjV1aS9Ua3lybzV1TnFmRkxwZWpKRTlXcE1HK1RPalNDMmFF?=
 =?gb2312?B?a2lnazBmMW9XUXVnTkU2MitNdVdNYXdrQk0zcndvUzlYTG1ZUjdCT3A5WUVw?=
 =?gb2312?B?aVZQZEZzNlFhZEczQVNVMUpPMjZkTUpiSTR5aEcrblh2SzBOVE5nc1NwTzZO?=
 =?gb2312?B?VG1NS1NXQVo1WDFsbWQ1dTdKeElFMEU4OFAzbzE2U1FabStFZUIzUHJpL2VJ?=
 =?gb2312?B?cnlzLzRYRGtzOEFXZXp2OWN3N2Zqb3VMZWhsWTh4d3pHeVlSQjZpZjJyTnlL?=
 =?gb2312?B?bWdxN1lmbEk4UFVWbTh3a05lUGpDMDh4d1RJUmRsT1F4TG1RMkJTVFBpa01Y?=
 =?gb2312?B?cC8zbFNpRnRWY1lFYzRETDA0RGdSd1Y5enMzemQ4dTNNZ2hlbDMvU3Y0bDU4?=
 =?gb2312?B?SHNKdlRhWnpNWTV3VnFTVWQvcTJZMkVUVWZFd1RZaXVMTys1SWNqdlVhWnAy?=
 =?gb2312?B?WlBSTXROUnhHL1pCSGNpWWFiTlp1d00wTVZramxlT2QvTWZEaVQzeUlrVG5v?=
 =?gb2312?B?NUpZUXJNOGhyZ3dnZ2JTMUFMdmwyQ3FnTEI4aGRvZE0vWG5IbzhjQUUrMVdB?=
 =?gb2312?B?WTVVV2UvRHBWdlZKbWFvZlA5TzFRak43dUdsNThUVFV2MmFRdG9TWC9leVAy?=
 =?gb2312?B?QXBUN0xVQnVSOXlqUEljdjUrbEF4TmkyaU9uOWNCcGwxWW4vQVhvZXBqREpj?=
 =?gb2312?B?NnVVblV3ZmpISHpUaHc3bnRrQ3RJbWt3QkRhNTVRakhIQ3lBQnVCUnhlSjdQ?=
 =?gb2312?B?cDFYYTZmUnRwMXJZcnRjamE0REVaSzBPazF6SkpvZHVYaldySTYxSG00dzNa?=
 =?gb2312?B?cnNSWFlKZXdxL25IaXhnYVJtcUV4RndhNHcrVUlkWE4rRnEyNEN0eGpWd2xi?=
 =?gb2312?B?OVZoZ2JZT0kvMnNZSUMvbmxxRHBRNDZ5SXhRMys0Q0RPbEp6U0NhT1A4cWVp?=
 =?gb2312?B?N05HWFgvdEhBUGxURCs4YkNSdm9jaktPeXZ3YkJOeGdtYjVYYi9xUDQ4R21k?=
 =?gb2312?B?UUF6dERGRFRNM0hXSWVUdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <87A913CDEAC2524A98F4E484DC4426E5@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4584b70-e1ee-45e3-4f78-08d93c54c4b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 05:55:02.3799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjod2nqlJbpDggv2irwK/XNnLZyg0c/rreMdeEx24s9Zym67kXpWTjQNesYroIMG9mKMxC+7yuacbLcdOJmglYVk8QsYbDm9oRa57pR0F04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6341
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

Hi Petr

Why only rename these two tests?

ps:IMO, test01-test21 also can ben rename to a meaningful name.

Best Regards
Yang Xu
> From: Petr Vorel<pvorel@suse.cz>
>
> Hi,
>
> preparation for v4 test API cleanup.
>
> Kind regards,
> Petr
>
> Petr Vorel (2):
>    lib/tests: Rename test tst_print_result.c
>    lib/tests: Rename test to tst_fuzzy_sync03.c
>
>   lib/newlib_tests/.gitignore                       |  4 ++--
>   lib/newlib_tests/Makefile                         |  4 ++--
>   lib/newlib_tests/{test16.c =>  tst_fuzzy_sync03.c} |  0
>   lib/newlib_tests/{test17.c =>  tst_print_result.c} | 10 ++++------
>   4 files changed, 8 insertions(+), 10 deletions(-)
>   rename lib/newlib_tests/{test16.c =>  tst_fuzzy_sync03.c} (100%)
>   rename lib/newlib_tests/{test17.c =>  tst_print_result.c} (80%)
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
