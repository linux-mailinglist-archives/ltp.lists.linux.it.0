Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C283FE95A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:38:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 406F43C993F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:38:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 892243C293B
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:37:57 +0200 (CEST)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B2FB1A0118A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:37:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630564676; x=1662100676;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Qy6pND5j7g794hFygDYHmppOkxRbbJQeDhtD6QmJRe0=;
 b=pxbEgZE57nL743BVABOueXaE4/5oFqPMC39UlgsOScFea8FMM7WnlJx5
 nYHTGc+vBIido5TOawpqsXYO4+Z8M7R4L5GN6a1Uq51HW8b7pFFB+VigQ
 hlaE9I10pxlzwhsZtfGtFf+DmH/OWA4LvfYlwQXtyXkaNIEk18hQL6Elk
 68WlIqVemFmH/v0/cftz9O9A3fsYs9esr9+ADNuZ7B5ltbVM7X0EUZu2Z
 qowsULzXolc13Doxl3Ahos5vQdFk3CiZuzz+66w4fmv5ehAT7h5fNv1YP
 Y0sVd8dZu/CvePkRA1N5brcvi2SCfFC/78Z4FE5EUFxZDE82KZMscivXz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="38266525"
X-IronPort-AV: E=Sophos;i="5.84,371,1620658800"; d="scan'208";a="38266525"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 15:37:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcFM0pqP8d2DXTYMrI2NHB1tufyWFmDI5U88Vx+88J05Ib+YSkPC1O6LHVIZVcaRurtBdXCiKoi/MUQUTwtDriIPggM9iSFZsWJVZ1aZMSoL3VJXXX5V7hSBNew3kK9+eWQiTvxk2XRKtW8WmVWm2fTCioKG9nfcT0LS9fz4CMAMqsR/5wCAqYjMlyafsLKkpWhYGZ9UPBUVIphttFyBhB/qkDIcN4jv68zetiMLkce92XK8CVo6THxgBqy3u1zCS92nJYKwHq7RWqHBPspZJvPqcJ9W8ahOKE6J+v5j4FYCKr4Hbe7alnmaYdtH4/8pTAHr0R7qwcDmis8sieT8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Qy6pND5j7g794hFygDYHmppOkxRbbJQeDhtD6QmJRe0=;
 b=E93k6wGGogPz4JmyuBsdU4pTtBstiSMlaVKDPmEf4ntlx6jPHIjQMFvI4401M3BPSzqRLwCFgvK/EUCvp6wMRcYhz3sgB2ZXB6twdxjszUdTemY/QNhpYaZdZLDV1D4pMBeArXIqm8Q36HrYjxHEScpJtFnl4j6OoGxMdTPfd1Dp5R0zYZTD3AfUei9K9IyW4JNOLuIFT+GOcgwtuh0jVDzEs5AclzLuaxGs2VH2igr58x28H394gkltSspOL411957h+xnUQMxT6hV4V4exlJbLezxrNCoJ8So9wGaBWPPPuWRGssllxq37z8V871NqL93a5fBAVGzsY4DTOOHjaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy6pND5j7g794hFygDYHmppOkxRbbJQeDhtD6QmJRe0=;
 b=ClLhAz1SullEzaUW0f9OhxfL4kWl9iFxJevY+j4QeZekXWkqpCTzSZXGijzpi+T7LDy1+/rG7+5xfsMIIWVfx2YBnpRLmZH6UDVkx/neFXlniibLZuP4Tmq8cfZEJ0QZJ2k/PrqJWjlgnaGhCl/TFgRcVrf2zkAADfqt/5EioTY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB7060.jpnprd01.prod.outlook.com (2603:1096:400:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 06:37:52 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::783d:cf1b:a4b9:5791%6]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 06:37:52 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH] syscalls/creat09: Add another linux tag
Thread-Index: AQHXn8SdYeyswPpFzEqmmqyWVZkw0auQSpsA
Date: Thu, 2 Sep 2021 06:37:52 +0000
Message-ID: <61307148.1050605@fujitsu.com>
References: <1630564446-3393-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1630564446-3393-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a4638a9-2857-419a-4a47-08d96ddc306a
x-ms-traffictypediagnostic: TYCPR01MB7060:
x-microsoft-antispam-prvs: <TYCPR01MB70608CA70FC78703271FAF1BFDCE9@TYCPR01MB7060.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:178;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZ6OEhroGpANK7OLon2uTtIZ8d/vzKU8cMkWblo3fqvv2/s0CszLFQ4z4AqDRJuGiEic33sVovnP1oREJn1QF5FvuNeAu0ankg3IvWV5vnCNWSpVxLltROkCTWrVlMDfRnSjUBJ1H4jnxvWIULkJy9NwpqsHYpMsLdlVa3awm8QrQ6jMTnfWBOelVcpxzxTeXMGmbGC7qM1E7LeJn+GDoYEmcxKuJLCv4KqmqLRFrUNQUrOVMwqLxCMWHFXwagsZrqWlkYCyCjaQzxQbP/2wKAUUzzjVRwYErxHYcHiBM+CnJGHwfEP0Zn5iyZl5kkaQ8cFLxbULGzGaziOSIB4GM0CBh0nD+8TUeS8fXWxADFnkbQY89vUmZEgRa3uJkPLOrjSFGIn/j6I5iyer53g0nsz3krSIB1ytkVOEL5FYy9+CmnMBChRdYz8PkQ50wLAx5yDHdjgnk2pof7FmCxD26cKhm1bCvy6F5KA/WLoJp3oJatGMxS/bxxZyO2cDhRU2V96erSysUflTcdEGue/qjb2PsUqPXRY57mepgxznW8+3HEsGRVrqaZL6b2Zy4shHkhFCldWY8PYOOleQ9kDrn7vg8BMG4KjT2KdU9MAxeW4QMVQS/4KXiKZLf7WpzvButhycpZmUXlx5Jzovd4iSqIUZB2ZGWrQid2Sj9w0f9NEfhk6PPvsg8djqYo1SDyps3qFRDCYPDqGqyrpB2vPWUKfQIpueVzU9Szoa9GxoFQc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(2906002)(5660300002)(6486002)(8676002)(76116006)(91956017)(38070700005)(85182001)(6512007)(26005)(478600001)(64756008)(66556008)(66476007)(6916009)(66446008)(66946007)(316002)(6506007)(87266011)(2616005)(36756003)(186003)(122000001)(71200400001)(38100700002)(8936002)(86362001)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NVJWTlV0WEdCMXFqUDBzcm5WeVlhZDFkWFkwU0dqdVBGdlY3ZFVmUW0wQmYz?=
 =?gb2312?B?WktwdGplTlgvSXFzT1B3aUdYVnl3Z0VaV0xwNnJDa0JDN0hEL29xK1JpdVRS?=
 =?gb2312?B?MUNOTENDNmhwS1hub1VYOUJWblNvUUFzZGVFZGxlUERTN2R6YkRud3l6RlFs?=
 =?gb2312?B?aUtBeU1rWTRoTVdwZ0hyN1ZqNWhkT01mamFxck1aN0RuOThNeEtxdDd0Zmo1?=
 =?gb2312?B?bzAwUXE1akdjVm5LR0FDMGJYcEZOc3R6bjJlMUJtYXhCTkdZN3Q3b0dQdVUx?=
 =?gb2312?B?Y29uWkFyOGxVNGFPK3JWeUtZaHFlTmFrRFZRUVc4MGpiL3A5MkNPalFGZndH?=
 =?gb2312?B?a2N0V2x1VFovV0NDTXBXTHRreE1mSXBRVktjZndNaUJOdlR3NjQ2SUNmWXhI?=
 =?gb2312?B?UUcxOHp5Q1FPb29lL2FRMEM0NVB1S3diOUJENTh4LzdndnRoc2tHSUVScWli?=
 =?gb2312?B?OTdaSjY2THlUUWxaMFUybGNyZzVIR0w0QjJuSzV2WDc0VFFGbkc2MWtMUnJU?=
 =?gb2312?B?eWxWRVFWVGJqMmwyZG53Z0NEK05tYTRNZ3JlRzdHTWV1T2FNaUpsS1VERjFl?=
 =?gb2312?B?ei94ank0RGhGcUpDMmhOQmNzUUFrVXNLOS9CWUFXeTF6NldzanVwQlduZ2VS?=
 =?gb2312?B?VFRRL0RXRjdDM3BST3ViNEpZMzJ4NDBsNlR6UzFzY204aUE2Y01PTWJ0TWhh?=
 =?gb2312?B?TnJManhuRXR2OHc2RjJKa3U4eEFOWWNOZlRFbGRnY2pJaVB3bE5aNkZpK2JF?=
 =?gb2312?B?Ym10eGpzcHFwS01neFBKVWRDSkV6SngrNmcrd0RSWUdMekJxVEduTndJWTFM?=
 =?gb2312?B?MzdRbGdKV0d6QUoyZ3UvUGV2dmp1eUhVZENxams3R3UyRUp0N01zK1RHeVF4?=
 =?gb2312?B?ZHd4RGh6YnpIQTBLSk1iLzcvRldNUi9KazVNTmpjT0ZTZnM1VEJ6M3VMdWxa?=
 =?gb2312?B?RFpKUUhVaXB3MDBoRW9TVmZ0OUR5NERxeitWczdJZ2hZbEhSVnRWMXhETThJ?=
 =?gb2312?B?NjIrYit3YUFXeUFBUjRXK0NZczVWMmJTK3ZITXpDOTRBVlJCbnVDV2VVV1M2?=
 =?gb2312?B?YjFxOGFldlBueVpESkhNZ1hSN2VGOGZOOTFJd3lGOFdTWUFvMjdtTFVITFgy?=
 =?gb2312?B?bTkrTkxYMUlWcFI2YmNZbVY5dTYzOTNNSDNDamxjT3N0Zm4rV2RNOFF4ZHFt?=
 =?gb2312?B?MFY2bnRac3pBLzFNT3ZkRmxZVEJJbk03RHVlaUZDWUtIYjN1Z0FKMHp1ODVt?=
 =?gb2312?B?R0JRdi96bW9ma2plU1hSZGZFUjIzSndEM0lkdkt1a3VRWVFLWE95TzZzK0dB?=
 =?gb2312?B?cnRsMm5qYjNSdWxDV1VjTWhMMlY0SHA4Z3NoZTZqODU4aStCWDNMZWxuWGEz?=
 =?gb2312?B?QW16NnBISU10NjlXUHNiM0dOeUdFVXFaQk4rQXB0czhqdTdGTjRoWXJmSHg3?=
 =?gb2312?B?VFh0SjhLdkNuWVk1RTRCSUxQVnIzR0lGRXA4U05kYUdrUGk2YUx0enRSWmd4?=
 =?gb2312?B?alB0U1hXc2JlTWZZbHAzVVNOMWZtWTNVSnJuYW9hZVQ3elNlYlNFQXg4TmpQ?=
 =?gb2312?B?N3dsQmozRktHVWUrTWVOdWlyZWs2V3Y3dWo4ejRzUTFyUy9ST0tQa1p5UHdN?=
 =?gb2312?B?YnVzSWN1MFh2aHhOb29DMDkramlUVUw0TUZWUjluUitKc2N1RVNiWk5MWEFV?=
 =?gb2312?B?QUIvb09PZ2NmZHhZNW04SllsM2Foa25jUHVQNk9NY3VVeTZXVW12bEgvQmNU?=
 =?gb2312?B?SnRhaWlKMGNIZkJocWNoRkpVdG5pZ1ZSZXRJY015QVh6M3JRWTVuQUhrcU90?=
 =?gb2312?B?S0VVK2hqRXBWRXVWVUJGdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <7506CD634C272B49A4C1B4C4C2A48104@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4638a9-2857-419a-4a47-08d96ddc306a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 06:37:52.1543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6/nftAYfY5l/YjoQSrdVRXZbWQx5HCKEXtEDn/lORdNST3WnToRDLUddsL68GjfDd9VuCrJlCu2EiUsg+GBmCzgRhfJgpRD0hrCWfi8PoAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7060
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/creat09: Add another linux tag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   testcases/kernel/syscalls/creat/creat09.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
> index 53ab202c1..9b88acd1a 100644
> --- a/testcases/kernel/syscalls/creat/creat09.c
> +++ b/testcases/kernel/syscalls/creat/creat09.c
> @@ -18,6 +18,16 @@
>    *  Date:   Tue Jul 3 17:10:19 2018 -0700
>    *
>    *  Fix up non-directory creation in SGID directories
> + *
> + * This fix is incomplete if file is on xfs filesystem.
> + *
> + * Fixed in:
> + *
> + *  commit 01ea173e103edd5ec41acec65b9261b87e123fc2
> + *  Author: Christoph Hellwig<hch@lst.de>
> + *  Date:   Fri Jan 22 16:48:18 2021 -0800
> + *
> + *  xfs: fix up non-directory creation in SGID directories
>    */
> 
>   #include<stdlib.h>
> @@ -112,6 +122,7 @@ static struct tst_test test = {
>   	.tags = (const struct tst_tag[]) {
>   		{"linux-git", "0fa3ecd87848"},
>   		{"CVE", "2018-13405"},
> +		{"linux-git", "01ea173e103e"}
Sorry, I miss comma here.
>   		{}
>   	},
>   };

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
