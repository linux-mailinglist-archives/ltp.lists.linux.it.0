Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DFB3B70C6
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:33:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5FB13C6CC0
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 12:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 513E23C1CC3
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:33:49 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFEE0140053B
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 12:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624962828; x=1656498828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BbhhXhQPcnhSgkEY11kLCiGEk/cycm+GB+WAlKMbsLs=;
 b=FD9nDzyyyREi2VfE70TXnodJpQpMRxnRAABb/HFMlAIix6w+RPetdJPJ
 CUqCoqYx5VIuju+yKQJJSCX/GbM6d8dBPW/+PqpXR/J49NVz2VjBCu+t/
 xTG8RnNX7vc6yXZzMuEz6TW/q0odUPIV5VqR45ofA42Nx3QchGvpMEZjY
 ldr2v+Cb4BjyfSAsyQmNxjQvc6bRlgmIwO3dtWkkemsPPYlz9dbJdsCSR
 2fni9wgdMlcDSUDVN/NwGnUtulgMKcDO2rORACvbSODAp7QpGhXMrErA/
 vtLPzhg6PdMxzPgoHH/c5P0OKpG/RtTiNL0pOS2CjaAwa3/wy7D9K8iDz w==;
IronPort-SDR: 9j6Y3M+B1fCCPBUNWhT/4bWQhBwD5hVld8XPSqe9vtQkRZpG55PlDO/GrQYRSD4IzbIVBkSGb+
 jvVYIl+YWvH4oQxURyUMYB2GCFj69w6ve2ZCyUmsWS4lFVx24mEPQCbKN3BsN55jtiZpGClb+i
 IA6+mdJXM1JAG4U2PJ4ua2v83Rn2twPSipPTgRHrjrOis3ZXKd5XwMwKDzb5CM7cIY0LxEu8hp
 ASfkzSGtbVdlytV33jCyuOWdd5Lkk3ZGEGhx9UpChHWGy95z2rpzvCJyufCEuIg+24RHzKpYi5
 eN8=
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="42163836"
X-IronPort-AV: E=Sophos;i="5.83,308,1616425200"; d="scan'208";a="42163836"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 19:33:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAEGhDbwd2ajtaP7bzy5O7bMIDIXWkENY/6yz1DcR79dLyaeR+MMfQMbSYleVQ5IMnqnCrQ2E2cb54QpwU9LhDHv7rpCb9GW4/zh0XLVwX0qdDtAoS31qyCRuCbd+BcUPWUqT97yZUbPelequ/BbQONPhVGP9X5OOaU/2W8o/yx/w6x4Ea5gm6y7S+VCroH9GSgbfCd2KXcQxLEVlOm/oLRsEm4Q8QXX1h6VvPIWMNpukxmSNKshF4csKBhAauONPgqqJ2n4WQNM4ccBKpYlsaveXnDFhGCE7luX5U2jPsnVIvkgM7LFJkmx32/8tHAdz64YUvgUIBVSvVZFh8aOZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbhhXhQPcnhSgkEY11kLCiGEk/cycm+GB+WAlKMbsLs=;
 b=LJrExNHlMdQKf13WnmSDELptMJbCxvwHEAbpzDPEEjXjnsdfKEKpEZI5rE2/AYX4+I7kIT3s0EfUL3O6gDjKY5RWoxgu2+UmtDysWCNaJwbRm300DQbREIVl3v21iTkOe97nE1jCSgQcdCEgFtqFI6LTGTK3wTUVxm/m6ShRz1TUkJ4noA8YKo0x1BBsJ+JLH1IljYAvTZLJZTI0rZJmcd7qz0FeNU21acKP5L+eyedkc7HmUwSogPVBkUd9uTvW2P2TWGCiPlrLO14q06EFS6tUL4oPhM3wgzQkqjh6mtb3ORY40QAUU4xoY81rIA7KaAuf0D4i0oCsXTlEXr17Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbhhXhQPcnhSgkEY11kLCiGEk/cycm+GB+WAlKMbsLs=;
 b=WVI4P9Lg/6xp6LjoogsgZUl7CJ6jqx5qHwJX21BjSuCAc8/s/ZpUMyb/DCAzvQH2xzx8cU5WenwG1AdV5qiM1UqDPFiLeliEkRZTxtqnSkfdKQbw57+YaEyQZjtgUmC3Y4DgnodeNDZPhxZd796eRMJdo3xDFiqm57+j++t3iGA=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYXPR01MB1520.jpnprd01.prod.outlook.com (2603:1096:403:c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 10:33:42 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 10:33:42 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH 2/2] lib/newlib_tests/test_macros*.c: Include more
 test macros
Thread-Index: AQHXbMjy4uW9yXJjdkqRTcGfNoJFqasqxyaAgAAD9oA=
Date: Tue, 29 Jun 2021 10:33:42 +0000
Message-ID: <60DAF735.1060401@fujitsu.com>
References: <1624958759-5562-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624958759-5562-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
In-Reply-To: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7baba740-fe20-4f0f-7b6a-08d93ae95e06
x-ms-traffictypediagnostic: TYXPR01MB1520:
x-microsoft-antispam-prvs: <TYXPR01MB1520039E7A8F9CF70569C5E3FD029@TYXPR01MB1520.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K45a0U/LzsWcOS2xExj9kZoYMRBcdWALuN90ms9GGVmIkrWkH6J4IQVoOCPxpjXzJVaq5+Pb6dtBJr31ubn6XnBmBbMc2gH+ai1lMC8v3LR8F99BRuvRrBwa68FdjtnfVVm9sdwhCke6YVRB06laD1iBZkp0dyyyXQk1zV+lwzyCoDALhYTJJxtsS+yA+/Hb4r0N19SmBvz6xRwBxWXx2/sBMRU6Jtvqk4O0NJUsVKJ9CDycaqKgWBBGB3/XiyqASRgS059gnezICra6hIg8B6IWno3Ky/GeNc4ltza72gG0pKNkSghTBFkUUOS2eNLqYnk+SO+f/P8Fr9rsMR8jyWCOfnBQEXzuIupCpvfF4IUUl/EFyb/RCsi1SQuItLHYu+N7TgwpFJJRb7iX2P7wt4ykFrx2dC891loaywEvhSryaOtL3QwgnaUiQd6xe35AhZXh5PUrhMxBjePCK3dz1GVlTgLtGCH/w8vGjbiDgXB2NFrPx5oJ804NUNuh4HK7zdJO8Huwy63MYUeK9ya130G5YWyF9vfHdoi2e/8hd2dg0O6ceZzuAZwb20Y0Qul3JAmB/VbCid2jY3+jkWIydX4taNZHuqM2qYJy1UHDEQNe6d6AB4YiGO1/Q2D7iV2HXCm1lNN42SQYPy0R1trM2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(86362001)(122000001)(33656002)(6512007)(5660300002)(53546011)(66446008)(66946007)(6916009)(76116006)(85182001)(478600001)(4744005)(6486002)(66476007)(66556008)(38100700002)(64756008)(6506007)(4326008)(87266011)(8936002)(316002)(2616005)(91956017)(8676002)(36756003)(2906002)(186003)(26005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3M0QWd3RTFtRGVEN3dVT0NJdjdUeVduSHFUYUxhTnZaTFcveno0cVozWXZK?=
 =?utf-8?B?Y0xJb2lTdzFxSmM2YkJJam5GckRITVFnT3RFVm1XZGppeHY3UFNoL3hvdDVu?=
 =?utf-8?B?N2gwWWxyR2ViK0ZSRlBkWnZOOWVhRW85RnpxalFmQjBOUEtEaGJKWlgwV0NM?=
 =?utf-8?B?L2d0MktaZDk1QTcySnBLSnIrMm5hbmhPSlhsZWkxbWoxY0c5WDBhWlNLYVdX?=
 =?utf-8?B?VG8vTEhtM0h4cU9lRW9oK0Jsc05wNEFUZStXVjBnbC82dmdFYVN3TkgzdzEv?=
 =?utf-8?B?NFpLWi9SNVk3RzM2RXNJREYvVkxLWFB1ZnQ5TEZIZjZCVmVZeDI5cE82aldN?=
 =?utf-8?B?NGM0U0ROTVd5WmhSWVFvMmxXWE9WVy9nVU1BR1JVSFEzOUorVS9hL2xCaENK?=
 =?utf-8?B?TmtsekNXOHlyVmdIcmhWRm9oc1E3ajZpR1pVOXNZeTl4MlB4ZkYxZFBqMTFk?=
 =?utf-8?B?aXVDeGR3TmJ3eTlNclNiL2dEOWpPRXNUV1c3bmx1cDMyKzU2QUs0SmlaRVo3?=
 =?utf-8?B?dy9SbFZIM2NMUkQ2bWFhc0YrdEFpVEJFYWQwRTRCZUtwUHVIaGQ3aWh5Nm5j?=
 =?utf-8?B?QmQ3dzFIN2wrYVpoRk5VVU94QTNEbWZNNmRmdUt6MGdMYUVRUGpVdFptTzQy?=
 =?utf-8?B?VThXY0QzZ1VBRDVPNGYzN3VZRnh6M09RS2sxdHZTZEIwbEdtU3pLSnl4VW1Y?=
 =?utf-8?B?SzIwbDZSNCt5SkVUb3NtRHF6elRzL1BOTGdFdG5nRUU0bXVLZTVneThQMVFX?=
 =?utf-8?B?Q1dWVU5Ib1pCRHNUeklhSURFcEJZTkw4S1JNR1ZNbG1lQ0FQY0txYkd3NUoz?=
 =?utf-8?B?dDhMSkxTeTJ0ZmlMNmNWdFoyaUJraUhGOUY3emJiYXNSaWJXOHloSysyY1F5?=
 =?utf-8?B?eHJraVZLN3dTUm5TL3NDWVNVNVIwVGNnaThhbXk1VUEwai9TZ2FkMXFaWDlj?=
 =?utf-8?B?WjNRTFgzZW9GZHZkQjlDd2h3YnRYZzRaZ3hmd0Fxd2ZjWmNoSnFDeElXWUd0?=
 =?utf-8?B?eXhqQXBSRE0wUXZzZ1A4MTE4RFJxaUxlQlVpU0tHK1M3aW1VL3dPUnlGM3NP?=
 =?utf-8?B?T1dnRmpDcFdCdmRYUHBUUkJMSWZyWldmK3FYQ2Yyd1YwQzlKVlBtMnN4ejgv?=
 =?utf-8?B?MnhtZ0lZUkwvdU9OZktnSVkyZGhGdXRzZ0pPdXFKRk5RQXQrblM5WVV4WitB?=
 =?utf-8?B?WW1uTXMvcS9EemFEOG9heUN0eUxkb3ZnWlR3TXEwbkFYM0hUcUZNODcyMDdQ?=
 =?utf-8?B?NWllRTdML2RBZXNSamJlSFF1NGdoVGcyRTFFTlU5dHByUW92UWtzYTc5N2tL?=
 =?utf-8?B?eXFQVzJZU1F5VVcyWUdNdVVpdjlqbFNjMTljOEo0SWZPVFBFVHRQTXhLQVYz?=
 =?utf-8?B?OGxXM2R4bmhja2FHNkkvQWp2NWovYjB6N2pDTStENzhsL1JKVDNvR1ZhTHM0?=
 =?utf-8?B?UzdVZWpaczB3d09QRkNTUDFUYjVtR0FRMWpHSk9WOXAvSmdwd0pvNjZjTVpx?=
 =?utf-8?B?aEdHZUNBYWhJV1dUU3RvNEhISDdWbXRhalhhOUYxVFpDd0dXcjZQK3YvNjd2?=
 =?utf-8?B?Z2tPeVpTdjJwUzlzVzVsUitRNEJPaEJ2YytOYVBkd0MyeUsxL2N5VVBYVmNU?=
 =?utf-8?B?dU01eVJOQmFsSTdjMSt3S2d1elRWaE5Xam9JM1FsckczbnQ4VFNUM0ZJSWFZ?=
 =?utf-8?B?S01LUjY0di9ZSlQ2d3pIZUhBbW9aS3F2aUZvdEVENVNGUHo2eTZnNUhoZnhn?=
 =?utf-8?Q?UPVQ+1zJHPB1YFKGwNNvoa6Td+T+7lk/DXGq0cA?=
x-ms-exchange-transport-forked: True
Content-ID: <57F236EDDCCEF944A160476DED2489F8@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7baba740-fe20-4f0f-7b6a-08d93ae95e06
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 10:33:42.8372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZlSQZAPkV/uOMWqq7Ys2dPHX3WRfkH6fUIeVU7CJc/EVNvwiF3//qzE1eXnKrVt1C/ONtfO4J43OulUZfJ630ow14ODbFwkyubb+7DS3iw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1520
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/newlib_tests/test_macros*.c: Include more
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

Hi Li,
> Hi Xu,
>
> On Tue, Jun 29, 2021 at 5:27 PM Yang Xu <xuyang2018.jy@fujitsu.com
> <mailto:xuyang2018.jy@fujitsu.com>> wrote:
>
>     1) test TST_EXP_FD_SILENT macro in test_macros01.c
>
>
> I'm thinking maybe we should add more info to indicate the TST_PASS result
> from which TST_EXP_FD_SILENT? Because as TST_EXP_FD_SILENT will
> keep silent, the only returned looks strange to us.
Sound reasonable.  I will make these output more clear in v2.
Thanks for your review.

Best Regards
Yang Xu
>
> e.g.
>
> TST_EXP_FD_SILENT(pass_fd(), "%s", "SCALL");
> - tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> + tst_res(TINFO, "TST_PASS = %i from TST_EXP_FD_SILENT(pass_fd, ...)",
> TST_PASS);
>
>     2) test TST_EXP_FAIL2 macro in test_macros02.c
>
>     3) test TST_EXP_PASS_SILENT macro in test_macros03.c
>
>
> here as well.
>
>     4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros
>
>
> and here.
>
> Btw, the remaining part looks good to me.
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
