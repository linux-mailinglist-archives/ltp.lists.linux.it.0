Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E03B8BC0
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 03:29:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A86C03C9372
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 03:29:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0656D3C6F41
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 03:29:05 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2F9AB1401155
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 03:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625102945; x=1656638945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=y+L5uamu6bHtWObVbUZD53nba1uxF1cyqrqAtIuRcek=;
 b=kkIp5q3Af1VPYBTfSdGr22rac8O2qeUviYz2rlA3lTRIkV+kh4egOj+f
 0404+xhQpz/nMQkg4ZI1sK7NEcr2CshEY4o01aOc83bgJo09WGgcwb5eL
 vK26MvgnhCI7+389Ix8UV0srdcEsRj9vvCIHomWkN8I9MyVBo56Dq1RwZ
 khFdX0t2Y/168r+xLE282YKsGyPd3u0L8em02ro8P0KrxBE9t+ro+OpNg
 WV1QeN7gEUUt9hAXn1THrManQ8nJqZplfJxzzalPpitOkC9oh0CISzj/4
 z90ULdr8rvhGxLQIwmC3SBRbY4aoNDGD1fZHZkCV/LI7M96wttiHkWUaG A==;
IronPort-SDR: X/YBarz3Y51WtDh4iBLdIkGu9nB//mLbRdpqIlKm0iBcU8REIwtz0Cv1nOkPaZZgZ78FRlShdr
 ohdrtZs+8shti3UJtW+h0R4Hx7gHoVHkI0PTNQyT/b0zPkYrhV+gOLpGCq1JV1jo5M9HqM4NPk
 IdPh4b4BpM2PXXMSmxNjQzo5AOijxv7Okw4DbuqnoEiv8QCuKTEzstVBNjrtvV/Ixfn+DdSwBg
 G4pg5XD4mEhuYkHl/APekEpCENkQZPSb2qsO1/9sRyJVXz1Ybu9azRZ6q3hbZSKixb4Va5K7Ja
 TFc=
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="42052113"
X-IronPort-AV: E=Sophos;i="5.83,312,1616425200"; d="scan'208";a="42052113"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 10:29:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEl1qsgK7nPD0nTkwbkidyXjDZh34e/mrisetE+6DdNNAYIATiuyXeZgU4dUxf8fmkVkJN5Cv1jVTwYBp50Usoio2CFZyhNXBY6iXHOddu+WTL0zP6Tjrb6v63rczc125BQr9KmTpt9c+qLZaeTKmPi6pa1XaFrORrq8sxjA2sPAd9E8YfhdUGGhPnp0e8ceeDtVjCmF3+aCtU2NjHV8155dsS5osDw8f9eHhmQm/Mv0wfiD/Y1Iel+bIY6/hF5GrAbYsyWzSotQoSLD5+s7PVVJPGB2f7vOsJXCt5hJg5wmWuhtO1uS+VM8o417pFzecaEomvPgzhTTT6ECGvEMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+L5uamu6bHtWObVbUZD53nba1uxF1cyqrqAtIuRcek=;
 b=EO1eB6B7hojB8QM6yBxeF2RHvoPJdxkEPdd/nmUg+bCP6t12x3hBRxvD8/aqyTMELT4yxAHUy1pCXVKEGo98GeGOwn05+cw0A8IGJlAXH/Zvvjh/cc8pBdg89mMvmPUHjRAsPp8hOqz5CkmOm2X0zkBYT85WWyd36JR8x1XErMSle8s3c9pgafj6AWk8zUtlVp/B6XwxSSWkw3ikLl/KyIzuUimvU377ypzlXUF9RePMkpDm1C8t089Km6d2tV/PUUILA9ZR0vjlTpYgVkTQ8zni15+IYLKnBQGL2m1YJOcmchZ5JqCGlSPuc1GzNayKjjBt/ZoB5ngcmk6kTLtjKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+L5uamu6bHtWObVbUZD53nba1uxF1cyqrqAtIuRcek=;
 b=ocw2f61vqEpxv+fzvIcK14MFdAcGcZ+Qqjx/bTcRuuiE2grkiyCkAF+kDr2sXlr5L9vcpokzZ4Fp6KSI8u9XxDW3aBZLdI4kDWze3d9dFbY1NkgXht30XA/JFnZtychmO6tW3+rAnyodeaLyottyxYi1aLJrg5SHqwLb0nNk/Zw=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OS3PR01MB6595.jpnprd01.prod.outlook.com (2603:1096:604:109::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.22; Thu, 1 Jul
 2021 01:28:59 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::fc72:e334:e2b9:f68b%5]) with mapi id 15.20.4264.026; Thu, 1 Jul 2021
 01:28:59 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v2 2/2] syscalls/ipc: Make use of TST_EXP_FAIL or
 TST_EXP_FAIL2 macro
Thread-Index: AQHXbNPMZY/i0sSTNEqlZsLF0L5+W6ssno0AgAC41QA=
Date: Thu, 1 Jul 2021 01:28:59 +0000
Message-ID: <60DD1A72.6020300@fujitsu.com>
References: <YNHCQ8qWSBdHIAra@yuki>
 <1624963486-6614-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624963486-6614-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <YNx/ZvzdI9AifBHK@yuki>
In-Reply-To: <YNx/ZvzdI9AifBHK@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 778f4fa8-e425-4485-627c-08d93c2f99e0
x-ms-traffictypediagnostic: OS3PR01MB6595:
x-microsoft-antispam-prvs: <OS3PR01MB65954973E1DE3DBA2833ECF3FD009@OS3PR01MB6595.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 460yqPvEinz2EBPyr578k55XShLDq5Q4fA50pj1iay1xQdLdGyfEvO8LU8RrLe8wcPRQ214I5kaTJ+tixd8NL86MUzoNMk3k+IaAWqBegyHC2s9JjGV0uAkmbTkfjnOWELmZaBcVnpgu0enVNgoivalmOpibrgXqs3aSTUQb137P8cV1y1TNyPt2yS/iibTwXU0A/S8+94D5M+b2e2dCabn7YCvCK1/gsGN3EojrTn4wltjnuDGPlDa3KoX1xLCgkvJzU5iQOObjhh3Hrko8tpXDqKBGzw2M5MALUNKjq5BemZ6J24yvj2VXbOGRNS/WOXSGMNIpHkbcFjWhjsl00JVVY3+RqMVJ0keOjxTI0xh3yqJUd239Mj69GENT8S4LxPAc7B659nHg9/thBPeNNELpD31Tl+A4STbleEMSCkHwhxBiD/tiFeZSD88dWT2biXLyRljDXpZvYMHkK7vcaWEx9o9rYJyabhm+kuw027GRC89NPPIgwrIRmU/EFGLW9+qiWU8b3qrGyr6y3f5XSsQPFUjBP6wmTpRaUrTyN+rirsLhkCucb9tQFVAy2QXBc6N96olOa9zBYH4Z/A6uiGiwd0/6vc5+sHDk2VL0v7MwpanRnqtcUCFuDBazM7Sa5dT63ab6hFoXf7CN72IFxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(66946007)(66476007)(66556008)(4326008)(64756008)(6486002)(66446008)(36756003)(122000001)(4744005)(85182001)(8676002)(6916009)(6506007)(76116006)(91956017)(38100700002)(478600001)(2906002)(87266011)(33656002)(86362001)(2616005)(26005)(8936002)(71200400001)(6512007)(316002)(186003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TE9VMVRlcDM1R1RYQjdkdDVhL2ZJRDhPd0tncUJWRGY0cGMxM09xaXpOSzNU?=
 =?gb2312?B?TlRNK2llR3ptQVZ3MjFJSFBxc0JFOEpuMFQzQm81K2xnMHNGYmxRRGZ4TTNK?=
 =?gb2312?B?TFFzVUc5M1JHMGNCc3h0YnY3aG1xaWx2Uzk3WWJkZW9zejFsMUZYWS9YVlJR?=
 =?gb2312?B?c1FiaFdIL0ZvRnlyZWFkNHRmNlB6NVRtOW1Bd3lJZEVrTXhtbDRGZlplRDQ0?=
 =?gb2312?B?cG13bmZieEJJVmZFMEV5M051bFBWTjlDMldXZTEwN240YmdyNTB0am5iNDJr?=
 =?gb2312?B?dGEvK1kxb2dUL2Iwc2MxUitiN0ZqOExlckpWMUNkVlRTdGtWemFBc1lsTHMw?=
 =?gb2312?B?VlZWb3dKSDFQYjhQTU8zeVk2b09TU2hEN3RrOHd2MVRvR3lLM3dIY2tacUw5?=
 =?gb2312?B?NDRFZWVXSnF2SjQxTVc2bCtUWk1BYmJibnNCM3kzT1Q3VEt3bkVrYUlxck1m?=
 =?gb2312?B?V3p1dVUyTStqdWlOMkhXY0x3MnN5T0Z1NTFFd2NteGcyZjUxQllSVXlVTjAy?=
 =?gb2312?B?VE9vTHdkZHlRR0RIcDBEUmw0WHQrT1YxREU3MExzdzN2R0FhYnpRT3gwNG1h?=
 =?gb2312?B?TDg1WURtWVVuQXVjYndsZk1tbnFweit2Z21ZN2lJaWZMVm51WVF1OHpGOU1J?=
 =?gb2312?B?MU5TcmdWRUlWcUJ6WnZFbmJhbmNXSlJQemUrakJFbjRGaXh4TWRxVEliUnQv?=
 =?gb2312?B?MG1pTTdpZzlWdVdDMjRRS3p5bVE3dlBGL3VmTnY2M2R2T3BPR0NzaFVZT1hh?=
 =?gb2312?B?LytXaHdHRVZuek44T0h5UG9SNFhTSFFSNnBwa0NZRFNKckdtQkJCYVlGdVVM?=
 =?gb2312?B?YVJTaU1hbE5ZY3l3WTVnZmZFV3dvbjF6MFJNbHJLNmNpTlhxaFBMclN4NkJQ?=
 =?gb2312?B?MmZ3SlpGb2pmL3czUlN3cnVOUmhNc2xpYmp4WUFYNVQrK1pwM1MvZVJiWFBT?=
 =?gb2312?B?SFlvbnVrYlV3byt4LzZTSGtRblVnV1haMGhKbEVxcVJDazBWbmZQZ0h2UzFy?=
 =?gb2312?B?RDdCUk9HL0kxNjA5MGhJRXBmYnd6N0tuckFPZ2JmTWFKc1BJMkJVQXRzeVZr?=
 =?gb2312?B?NVpyR3BFZ04yY05ZZTZUbDAwRFowZlhtSDNPS3d1c1JxK3FkWThCeXhKTENh?=
 =?gb2312?B?VnR0TXNJanprMGFrRUZaYXYxd2lzTTE2dksvT3VwQ0pxcVdFdE83SWp3bFVh?=
 =?gb2312?B?aUU3YTlmQVlKMitFdGR5OEM2N0s1c1NuUlcyc3N2Mko1OEY4TjlvWVk2ZjFy?=
 =?gb2312?B?bXRXN1ZMSkVVdjg4T3NZUmtMQ3VlN0Fwd3doMlRaYWdnSEMyTEcvV0Iyd1VC?=
 =?gb2312?B?azQvRHBVdzhoOXhvZk1SUjRhSklTQTg2VGNzS1FOeWplZGZSekUyUDFkbTdJ?=
 =?gb2312?B?QUo1UFFObVdlS29wK1A4U25mZlJpd2NRcW9Gd0ErRHV2K3g1UFVGdUkvekF0?=
 =?gb2312?B?Mjk2RktTeGRVWnJlZkNOU3RWbVN5MDIxYXorcnZBOEJsbFVPbHdvWlBEUk1Z?=
 =?gb2312?B?OWdnSHhBYWx4eG9GU3dOc1VxUFJrV0tjUmFQaW83TEhvdFpiN05jZnBWSXVQ?=
 =?gb2312?B?NlZoSmNQRHdOQ09jci82Y0FpQjRlTW9NeW12UFkzVHlUb2x5MzRibTRXM1Nn?=
 =?gb2312?B?WEJqMERlN0xSV1Y4ZjVBTzVlWXNIbnY2QjNDeS9DVkZMK3hhLzdUYnRxcnhG?=
 =?gb2312?B?bmJ0MmtUdG9IZWNaWjByTnIwQnAxVTdwbDFQRStoQmd0UE1rSWE1Rk93akM1?=
 =?gb2312?Q?i0hPPlKcRedMr3VvS7D6K+zipyEx4PFyt00SoLX?=
x-ms-exchange-transport-forked: True
Content-ID: <CDF3C30B4F157E4D97DA2085D6140A64@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778f4fa8-e425-4485-627c-08d93c2f99e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 01:28:59.1508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oNB2UB5EIlTUvwZaz7ue8e5Tey+yePFV5hT/yZTY/1aVQgBlqYgz7uFwVL71qbvxFarvJT4yRi/TYgkth4MylY/z0lL2SZJi7WHJrytpEC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6595
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/ipc: Make use of TST_EXP_FAIL or
 TST_EXP_FAIL2 macro
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

Hi Cyril
> Hi!
>> +	TST_EXP_FAIL(msgget(*tc->key, tc->flags), tc->exp_err, "msgget(%i, %i)",
>> +		*tc->key, tc->flags);
>>   }
>
> I've changed this one to TST_EXP_FAIL2() since msgget() returns
> non-negative integer on success and pushed the patchset, thanks.
Oh, yes! I pasted from v1. Sorry for not changing this.

Best Regards
Yang Xu
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
