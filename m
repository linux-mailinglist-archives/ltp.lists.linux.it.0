Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 428CD3D52F8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 07:58:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE3813C6727
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 07:58:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11BC53C32EE
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 07:58:14 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6362A1A00804
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 07:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627279094; x=1658815094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PriejdvdSkAVyKavLqPOVDwqTqGt9JF4jVyaIaa5eu4=;
 b=kF5tI6vhH/A/uTca8g411IuDUArMwU0TBCkWWwQFWKSedjmj6Hk1s9LL
 XNspvdjR+W3mcreU/WT5p1GEWN14HYCnq/kGLiwNWYZ6eeAyB4zTzXg/T
 guhOkzqSo7Qmwo6F34jLV00r3M6VbE2vPNbXC+1gfSEkzzJAFee3zNOU/
 s+Sz1AUOo4dIigJlRvTv4Wpf5WFdabxDwm93cx8NQanJIkFAcz9jksNbC
 AFDthqSIU3FNsPo0H21sLHfQUgZ27O8985jFfsr1h51B2TmQjW8Ipxyz4
 jt9niiPoVjSxVTJysaG76u2/wTMbo+xJtdZcvmMDaYpaPpBuR0oiCBRZd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="35479734"
X-IronPort-AV: E=Sophos;i="5.84,270,1620658800"; d="scan'208";a="35479734"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 14:58:11 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp2oI2QTAJC2oXXHbnlv5BkKRu0fTYyiZ98h54toFW5d4irbh7JH8JwNtZWKsgnVegmW6rjG49KAbTX8lCP2RtbdOxlY5JL4AAZnLhjjgqwiEBno0Y1z4ELmNyclFtlwkpY1K7R83DZZToxXDcq4pZIvWGGK+MYavm6hrOR8AkjVcn1rD80leY+sbHD79y1Mdsbu/GQNUGGjESndqWmjMBKID2leBcv83r1zWwljpzKuM6pXmXMwC0Ig5rnFHIF3t98lhnkryaqgKLPmA3ZbCcHUnZpBR2Dk7G4FXF3FqrkdwVjdqtWb0mIAaSFfHtUal2S14+AL51B9blNl+WJ1MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PriejdvdSkAVyKavLqPOVDwqTqGt9JF4jVyaIaa5eu4=;
 b=PV7459UUww0PAcD+WaZpQIOGhHWyfwlJ6//zARD3zixqRyXoh99qldwdRJoS5y7wpeawTD+J89eoTUfQ/8RoWWfxM3G+KgE/9jieCFdv1Pkt6lvmClPKqeMXCmnQFZqWwzxminI4eeA6ZKmQ7xxdilodayhKk7HF3Qix/NObegM1bTYnq0LnEw+VbXxxO/DR4q+ZO6F/gUy2QMlrEqsRB5UUCY1CBR1IaFKVj4JI94mPLuyDz+x6TpFhB8wS8rPmvWnagTFCiB9cfPe7ycBXXwXJ2YKkxgVyzo58qr1LqcZXUzN/Cqu+I+OrzkUU3twXikNdVIQeesf38Zp6y1ktHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PriejdvdSkAVyKavLqPOVDwqTqGt9JF4jVyaIaa5eu4=;
 b=qFckOtLQ1LorPfNY4fu69jwFEGVy3LyzqyLfoXLc6MgIL/nr48GSJRDIpVfn9qNcQfodQogyNAhXtqm2gODyuahLq9akfw/W/rpE5UGq5aNBYyuUAperv04AEbSsgJLG75PM3/Ubb3hJSM6Y0w1WtvJSir8wOiOXSsvAbcKz0+A=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6523.jpnprd01.prod.outlook.com (2603:1096:400:a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 05:58:08 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 05:58:08 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0
 bug
Thread-Index: AQHXf4JaL/BfBAoGK02D/Wfh/7I7tqtQp+eAgAQee4CAAAEmgA==
Date: Mon, 26 Jul 2021 05:58:08 +0000
Message-ID: <60FE4F0D.1030403@fujitsu.com>
References: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YPrZhzFng/7nHywg@yuki> <YP5OF3waDlOS1ES/@pevik>
In-Reply-To: <YP5OF3waDlOS1ES/@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d8ad4b2-da4a-42f1-7438-08d94ffa582c
x-ms-traffictypediagnostic: TYAPR01MB6523:
x-microsoft-antispam-prvs: <TYAPR01MB6523DEFFE26E8011B98C4A52FDE89@TYAPR01MB6523.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OT6BSY/EnsGK4d1XEg3orgCqt/F91D9EXamOKdUahz0p3LCmVvxYSIYJUcTSg9m6hquhCKXHOptcdFRPBkKGD5lUTO6mQlx7KbRy9/2KYIM1ys9ucpd7uTDz+MtVS9qyaAO3HR4QOv7hZgUjxTdhcTRlSObQ7vhuEM88KcLyRc7zyLJhvoY9FNhOSnoxG7ADjKDThhmgqDSZoueRLuhfV/3PUmpWQzWcKRl8u2dFloSxsrbyXqUQA5pR1GyyiUZrU3k+hhT4Rrqb/wIEkKp9d08m0IScjh300Be653fLvFPd0ZeoZpne7fwsfsG4nGX2bHXJCQ2PZKR6an3ivhzbmxr/qOHlGUlwjaKlVZ/1SB8W50lrmx+FsMRHrA4WSpcQNL1ifVHIdZjSMDl77RmGzfTfT0Dwr3mkx2TJu4MhfsK6u3k/jzsi7wIhWwWH7nYbihg6UAKh7ByE8kjgclrGIgXo/4wSE/B2nDKiZgDZJXeoRbDs9GBRstA1BCnn6/eU5EKvyjuG8i12LeGk29ZK4hf3dBQju1zFS2axl6HupsXddZzfj92REHGmg1X+BAcQAKQpw/Sy4Av4iTv65/wToXd+5dxQOJRmhTK1MJM0z/nfufODYbv78YHH0ixNBQWjrXRTDDVD25fvlx+V4PYmh/WGmFnhLAOV2NfUbd3uYUIQozJxWlI0bOrwg4awH0ZnWqnV7QuXn2r/FaTw1A4UK0/GRUzqTg3Kb10w/wtQuqM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(71200400001)(6512007)(33656002)(6486002)(83380400001)(36756003)(478600001)(558084003)(66946007)(2616005)(38100700002)(6506007)(8936002)(316002)(186003)(66476007)(66446008)(64756008)(66556008)(122000001)(85182001)(5660300002)(76116006)(86362001)(91956017)(26005)(8676002)(87266011)(2906002)(4326008)(54906003)(6916009)(142923001)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?b3BIS2MwU3I2b2hRYXkvNlFkSFJuaWdmZ3cwQWdHK1pvRXNtOWVSRTBsN0M3?=
 =?gb2312?B?VmR1Vy9qNEpTUVN3OTZHeFpseVNROEhNbzlJaFRFQ2J4eFd4dmFqV2N3QVR2?=
 =?gb2312?B?V215a2h5NlhnWkhRem00RzlTb29zQWR1MjRETklqRC9WbkhoU1gzejdORTNU?=
 =?gb2312?B?eUJnb01jODZ1K2x6MUR6M2psNS9CczN2S3RTeVVXVDhNVlV1TWNDbTBWSUZU?=
 =?gb2312?B?SzVmRjZuSnpzNnhnRGtIVWhwNm8wSmJDRUFOZ2duRndzWUxyS1hXQ3pWUDdD?=
 =?gb2312?B?aGpLOTZmVHhkRTVSM3NJd2MvTmNtR0JiQlVyZ2xHcDRzSTVtc1lKOTVyNDAv?=
 =?gb2312?B?cmxSMFMyd3ZPQ2FMU2tGVUJHazhoQ2RJV0ZwVnBtZGJsa01FUkJTc2NiUE05?=
 =?gb2312?B?cmZoRXBpaGQyMUQwRHFJMHJkREI2Y3hQdG9uY3hKdVVjcFdXVThzV0txNnE0?=
 =?gb2312?B?WElsSnJkSTBQZFlzak1CcC90OXdhRiswdHpsY0IzRXAvRXB6UFhYREdYU1ZC?=
 =?gb2312?B?a28vcFBONVp2SVRYcHYvaU0zS0NIYkI3Skkzci9zbGRkNmtmSkF2ek0xb2t2?=
 =?gb2312?B?WGdic2J2dGdnV0U5ZHQzOGlJWW51NlJIY09abGNTNFV0Qk0wSmtweDJhajFw?=
 =?gb2312?B?d2pNdGRxZHJVYStkaDI3WHd2bW53MFhvZVNjMXlCTjczcEVkNlpzR3lqU001?=
 =?gb2312?B?Y2VpVVQyWVdVRHRZUjFTVEo2dUZkc3VYdXNKTEdSdnFYM2Vwb2tPNUFGLzZV?=
 =?gb2312?B?OElhOXYwTU10aUs4TlhRRjQ2RFFzelBlWnc3MThQSmRkTXVBWER3akppTEQz?=
 =?gb2312?B?djAvaGViVWZ6T21iRGxiTzFFMEJXeEJyR3V0b1RTYXV4bFVkcWs1U3VmYjlx?=
 =?gb2312?B?RWtpKzdVNUdXOXNLRDhUZ3dCaHdHVHZXVnFMaGhtMHBZVTVPZjRweGlTOFc3?=
 =?gb2312?B?aHBxYm1NUVBpQU9IeUtTblkwakJOTXBDR0JVRzF2aXpZdkFOY0pnSzJNYW1u?=
 =?gb2312?B?bjVkc2RqaGY5MzFLVVp1aERVSDZFRzl6SEg3Z28xUUF6NUtRR1M5QkN6dm5V?=
 =?gb2312?B?YzZaS0xzOWlQbSttYXl5YjNxclloK3NKU01ZcTRiNmRCSXA2Nzk4aXZKSDJH?=
 =?gb2312?B?OWZ1aUhuTStwanBCTVVVZElIVkxlMXBxZXF1anZ1eG03Q0JHYUhOT2Q3MW1N?=
 =?gb2312?B?YUJNMWQrdXZzTEFWL3B5dUJOc1Axa3FYcE9XRkU4Z2lpS0pOb2pOWlBLTXhZ?=
 =?gb2312?B?M3RDbFlJTkNNNFgvakR3R3BCeE9lTENUaFJYaitTRmZ5aG5ScjJkbmtBbjBa?=
 =?gb2312?B?NGVzOEs2TEhSTk1DN2VHS05jSEZNZHBURjI2d1BLanB3OXcrMStaQVJRQlhV?=
 =?gb2312?B?YVhtZGtQSXNlSjE4NGNQTzkrbEhFU2FCODRXdEFRMHI1OStBNXhGMko2ZGhF?=
 =?gb2312?B?VVhvR0NFb0hLU3E3dnl3RzNja2k4NGZ1UUdwTVdoTEpTVEpobjdqTi8xekFu?=
 =?gb2312?B?SmNVVjk3TUxuRk0yRTFkMnloNitZbmFGQmlqaFErR2ZOTXJjckdTS0EzMjlJ?=
 =?gb2312?B?VnNmOE9XQ1UvZmhUSHpIUWlVc01YNlpDZ2hiMmo3c0Vpc2tvbHFRUjU2V2Nt?=
 =?gb2312?B?YUx1Smt0VGJjTmxZQ3l6T3ptc0Q3NTZtZlI0UGFXUjhUL3REdjk1QzR3cGkv?=
 =?gb2312?B?dURLQ2tEWFQ4SGxhdGZNVCtCTFRvM1hQQUk0VWFsSGZNeno0a1lwQUhxMjdO?=
 =?gb2312?B?RlJKTGxMZitVNGI3bFJ1elVCbkFwM1hoTTdQK1BCNHNqazFwNGZCaG5WS282?=
 =?gb2312?B?NUs1eUo5eUlOelV3WkMrUT09?=
x-ms-exchange-transport-forked: True
Content-ID: <D0B35B037137B140967A6AE257DF994A@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8ad4b2-da4a-42f1-7438-08d94ffa582c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 05:58:08.8844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ywXkqMOfWrIyA0afLWL8mEizLN7okRfQsLz8jRqXMSs8nkaEPTEgxxGLlWs/XyXrbRILBSysGfANWMp2BlfSplcEtkN39TyFdZGT+Fueqbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6523
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0
 bug
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
> thanks for fixing it! I updated also wiki (ltp.wiki.git repository).
Thanks. Sorry, I forgot this.

Best Regards
Yang Xu
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
