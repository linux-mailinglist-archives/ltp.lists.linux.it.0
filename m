Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC334C211
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:57:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 641D73C2E56
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:57:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1740C3C2781
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:57:16 +0200 (CEST)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com
 [68.232.152.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BDBB2600747
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:57:14 +0200 (CEST)
IronPort-SDR: Sx56Jmn2cDcIZRkz3ubuu4PbBqfr9wNUXOj+AjNLuBxCS/36aMI7BXwRy2QUT36iaBj2YvYX2m
 LrQoNFCGLn028OWhMKSAv5TawRpahIqLT8Ds4/XV7Y3S+Z/E67pdtP2cKR2Mb06cg1u+Q5LcZu
 7VFMGYMExR6n2TLilH/v40+2TKh5G2/xvlPvH9P/XqcOHOopwx6NGcSAC45GUkB8GNUzbQO6jh
 NdpJM+V9rWf1Og8h7mbsXwSToOaI+qb6hv1bJojrZZEPgAsXEF2tMOF9wN8bF828RwXgCApmVV
 ghU=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="36860438"
X-IronPort-AV: E=Sophos;i="5.81,285,1610377200"; d="scan'208";a="36860438"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 11:57:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0fHsg7bfpIyHxxME2UIVQHJtqpDSzhAZ6q19cdZsDnSnSM9h5V4nUMny9J3qGU9bGF21+tEsm9rlg8t0MM9+M0Vq0uzQ64Pb4g66K5zr05VLw/FGSstA6uDc/IuoFbaGUjSur81jEKEvpHPulUVuEhXm/31XoAgxCMjKHU8rr+/w357LIYigpvpeZWCE8WFehKHsSI3VzJ2oN7zDZpfbgsYrkVrwqiJ+ZqCUrgp5ugkmEnSI1GHBfpJqKJc5JL3W+SuAfJFyeCzMvzaOL0XtarRvZ2G24Hw4yrrHMlu4rL6LcPAvk0MjsHUT8KQ+tKoOO2rq6LFuKXqD0RwVPav5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU3VWgmdSXonDZDuJdNOyNriIl9X1sDJwIWE6GtkToo=;
 b=Q3eAC8Cs8bhI4KupnlfOlKodTXXWlp9v26AK/LHy9KDZkgoxxNQiZ1ohgsJRL3+AmVkZRTJFHmWc2XdKP40vEEDlIKpgTrdMfJtdeo1UPxkIUBR0k9yt9FRS4rN9J+8zJnaic1IQbuUPk2FGxWFgPfHATaaKlV4/NtV+wmRVOvqH7N7sXdaefQV2U2X+56XaNwZtyckgwM4Dkro4CFzxduVc7FP0OhUwcGXmylppQQ02NY4QK+WOJz9A/okOfoe2CRCHHyZMhhpXJMnvoIfFqy1Q6XguFZHUAbWFDz+n4vVki5RlaHNZgw0zfpkFSb3jvqrvYxOCf4GVxsX18fAW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HU3VWgmdSXonDZDuJdNOyNriIl9X1sDJwIWE6GtkToo=;
 b=noftA4sEQeXk4TUGajry9FKALnADbx5SZdOQ8AZgJPToCFKed4npjFcP+NxxUGCJyxofEvUAee+UivgglvgskrlKwU3xsdeh86f1o6pIBMD75z5SPk992FRm9QmUUuB6aQyTB1sjcGjahGUFixl8cG0hr1Suzbm0aI7l9yN6008=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSAPR01MB4035.jpnprd01.prod.outlook.com (2603:1096:604:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Mon, 29 Mar
 2021 02:57:09 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 02:57:09 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
Thread-Topic: [LTP] [PATCH 2/2] syscalls/chmod0{3, 4}: Cleanup and Convert to
 the new API.
Thread-Index: AQHXFw0nofi8Ipuiq02LQXNWhpbTtKqaYE6A
Date: Mon, 29 Mar 2021 02:57:09 +0000
Message-ID: <60614203.1070904@fujitsu.com>
References: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
 <20210312065757.380144-2-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210312065757.380144-2-ruansy.fnst@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e02e5d5f-1a2c-437f-0485-08d8f25e5829
x-ms-traffictypediagnostic: OSAPR01MB4035:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB403501B656BDB6DF3FB31037837E9@OSAPR01MB4035.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:12;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j8l5Qdil3hLNhG7zHc9LDeIMvsNTFga5ZhBJikkioRoAbMIQKEk7Sh4z3d9/hAfjI1QsRx3Pl6lTuftQh4597eTjhKtk6mWE/E3ykO8xXzQoNXoBf1EGOlfu9E7IAk1eBC0HuMq9ix5UEI7I7whVoW6JxOtyB89GJJLevD1r5zqskBtZzXfTz5bKh9hVCwPSDjRD0LUKCNJPukVi+yK3Wnk2gabQbyj6x0r6mwUK55mIUNyFc/Zo+Upurc4hKX9HCnV4LvS1ap/GX5Y+uCgYuisxVJUqpUzAYG0XvUbT3YGlozXb34zzUfQV+dzozs+e9q0xDiUJSL5MMdptY4RMxUYpUdPid6OF+gPOChFSaAII188xOnb6Z+LAcwBwMqAFH4mo5CpoRLVeTXhK96FE9UN2sO9xLEXxEUOVqnppRu5TCJ6qZE/tBwFfvV/BgJu4yuymg8+V2Q7s2mdPTN2wFJqH4rpm2aaIwZlY1pUgNRLz9xKtLhcnNq63tNYjo7g/aR8EotWCAvptu20z/NwRCY9ivZzzH/dbJ/Zm6c10SCU8tmMq0Cvnty9VhrTu7uHacCZFZMEiqYbVk5m/ANVl/fbwVlDi2lMgAVO2thhvKEdK7k0Z9t5vUMDTeXN1BcBr7eJ+C1dZoLvZlUwR7dlNhXC7iciKDKaRwTWzKvnVCgdsmR2W5zSC6ReWdDM6bw/py4Yq5byV4NrLdjWrH5D9Ag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(366004)(36756003)(6512007)(64756008)(66446008)(87266011)(66476007)(66946007)(66556008)(6486002)(53546011)(6862004)(85182001)(91956017)(8936002)(86362001)(2616005)(76116006)(5660300002)(38100700001)(6506007)(316002)(186003)(30864003)(2906002)(8676002)(71200400001)(6636002)(478600001)(4326008)(26005)(83380400001)(37006003)(2004002)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?NFpOenhEd2NiYzRXSWoza2ZjRi9EcmZwak5kdU5BUm5PVEZuVW1RR0lCOUZE?=
 =?gb2312?B?amVOcmV4bGg2a0M4UGtPeWwwS2lQYldlcjVpenNSR3U3cWd4Qmd3T0VlcHlG?=
 =?gb2312?B?SGp6ckhYNTFRUFhFbzIzUWIvc2NnREtPMzZ6S0krT0tidWpSM3YzV3JkOWlw?=
 =?gb2312?B?d0J2WVhlWU9JRFZ1UGxUTjM4VE03QVJVRjRDdjBMUEdYbFU2NVZKQ09iU2hy?=
 =?gb2312?B?blN3a3RKUjVSRVJzWU4xU21WY3lzUTl3SEdJZWpoQmIwUW9nd3NOSy9QUHVW?=
 =?gb2312?B?UC9yNEtsK2I2RkZRL2tjZmZJUzRPSEQxTXRyTnFxcnAzNHIrcU1xaXUwUUhv?=
 =?gb2312?B?RjdxaVZ3dVhMcUlPQnh0WWZzMjlPckJhaWlFck5hZ3lwNnlJMm96YWQ5THB2?=
 =?gb2312?B?UlBVeXJhd2FyaE9Idi9EMWhMSVRJSWNYb0g2dGg2M2htQytuVkVvVFVJWWZ4?=
 =?gb2312?B?bG91U0Z6akQweGR1QnZrVUZqNjVudllrdEdqREdKM0R1SDZlMDZCd0MzOWxV?=
 =?gb2312?B?SmxtNmxOQzcyUHV4UVVyQ0NzaFRnUERQUnl2Sm1Bci9ING9GZ3JvNGZHRmVZ?=
 =?gb2312?B?WEhvdExlWDAvNTJjM1U2a05wQ2VSM2pMQkUvcGpOTk9rVUorcUczL0dmOFE4?=
 =?gb2312?B?TWo3RnY0enJ6ZWt6UTRRM2NGVDFieTd5cHg4bmdBbEN3cEhCR3R6SGJjSW13?=
 =?gb2312?B?NzcwTU9nZ09OYXlQWUNtbW1SSU1yTVlOYUJiRTNGSWZ1djVMNUkrUTdRcW1H?=
 =?gb2312?B?Zm1NM3lPUm0yazI5UGYvWE5sOHVnaXpiK0F3MkdoVXc2MnlLNXJNclhNbXVq?=
 =?gb2312?B?NWFsdEdSSnJmcGxaZzdMU29YZ3l2YU90MUdOM2w0N0cyTVBLOWxmS1hmS1pu?=
 =?gb2312?B?SlAzbDg3Nmg3OWprb0ZiOVhEb3JpMENFMUwzV2RNUndhOEd0OUpxRjJ1ZU9s?=
 =?gb2312?B?VFl0Y0pzKy9VWDZwU1VuOWdMSlB2alVaZmo0L3NTck1mSnQ1L0syM2RTS0NV?=
 =?gb2312?B?QXVvZ0VlaWV4emdIQWZIemh0Q3dGYXllMU5xenRsemd1TjNoajduWmNWU0Fp?=
 =?gb2312?B?YTBQS3dEdmV4NFAzUWRQL3RzeldOVXpvTSt5d3c4QlNOLzhsRldHelF4OHhZ?=
 =?gb2312?B?QmU4NUNyaWJUUmdvdExqUHJ2UVRjUmRTZmZXNlFaa1B1RkJGd1Z6UzZBNnNM?=
 =?gb2312?B?YmJmRDVlb2NqejdMaEwxMFZlb3Zqdi81Njd5YlIveEowbVV6Z1dLNHVaOHBJ?=
 =?gb2312?B?YktvMHZvaXNnZmUrMnpicmlVSENZYmJwK085YytGb2R0T0FyNkFTMjJZR1BO?=
 =?gb2312?B?aTVIQmZ0VG9EQWR5YldPYVYxRVBQTDVMcjRRQ0hhRmlubGVFdUIwS3dkOFhO?=
 =?gb2312?B?Vk9zSlp3NUJwa0dLQ2tZUlFZT0RjanFVektwd1diNHoxME9TVWllb1pCWGIx?=
 =?gb2312?B?UTJyVU5hOVJJR1o4ZWRKQUUwTmhSeEJDVEkwMnZyS2ZySWJwcmZBUURKdXlz?=
 =?gb2312?B?OElCcWhUcVU1ZkRBZmdtZ0ZhUVZlYnMxRTFERXlyOGhTY3Q1QTduakwyWk5q?=
 =?gb2312?B?VzdMaDNQeHlhTzFISXBOVHlKSk13TUtVaHh2YmJNemNGczVJNm9vZ2tvc1gw?=
 =?gb2312?B?bHFoN2Q0ZDBKS2tvcDJacjRyRHA2L1hLcnFuc1ZyMUJCZUlOUnIraTd3akxD?=
 =?gb2312?B?YVZZc1JvQXNMNWJQN2xienJrVklKSTl3Y243MUpVMXVzcUZtcWJKeHlVbU9V?=
 =?gb2312?Q?FvSdjfgrDUx/DLHmgEyR5uO92VlPgF2fRh+jmFA?=
Content-ID: <D854093A072C184397C64918B07A5A41@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02e5d5f-1a2c-437f-0485-08d8f25e5829
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 02:57:09.1372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGYbl+N39/SLSOeqKPcjNgSAhEgWD9LF6r1UoM6IJNT/rbQ2gWcM9tY1LXl6CcTeFt/Afp2y2PtjFO4ocyRQiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4035
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/chmod0{3,
 4}: Cleanup and Convert to the new API.
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

Hi Ruan,

After looking into the chmod03 and chmod04, I wonder if we can also 
merge chmod03 and chmod04 into chmod01?
Because of two reasons:
1) All of them just set mode by chmod() and check mode by stat().
2) Without needs_root =1, we can run them with any users(root or no-root).

Best Regards,
Xiao Yang
On 2021/3/12 14:57, Shiyang Ruan wrote:
> chmod03 and chmod04 test on file and directory with same logic, so
> combine them together.
>
> Signed-off-by: Shiyang Ruan<ruansy.fnst@fujitsu.com>
> ---
>   runtest/syscalls                           |   1 -
>   testcases/kernel/syscalls/chmod/.gitignore |   1 -
>   testcases/kernel/syscalls/chmod/chmod03.c  | 196 ++++-----------------
>   testcases/kernel/syscalls/chmod/chmod04.c  | 191 --------------------
>   4 files changed, 36 insertions(+), 353 deletions(-)
>   delete mode 100644 testcases/kernel/syscalls/chmod/chmod04.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 6108d5fdb..2bf870709 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -62,7 +62,6 @@ chdir04 chdir04
>   chmod01 chmod01
>   chmod01A symlink01 -T chmod01
>   chmod03 chmod03
> -chmod04 chmod04
>   chmod05 chmod05
>   chmod06 chmod06
>   chmod07 chmod07
> diff --git a/testcases/kernel/syscalls/chmod/.gitignore b/testcases/kernel/syscalls/chmod/.gitignore
> index 072fa5b80..27ddfce16 100644
> --- a/testcases/kernel/syscalls/chmod/.gitignore
> +++ b/testcases/kernel/syscalls/chmod/.gitignore
> @@ -1,6 +1,5 @@
>   /chmod01
>   /chmod03
> -/chmod04
>   /chmod05
>   /chmod06
>   /chmod07
> diff --git a/testcases/kernel/syscalls/chmod/chmod03.c b/testcases/kernel/syscalls/chmod/chmod03.c
> index f53e437e4..e451ca65a 100644
> --- a/testcases/kernel/syscalls/chmod/chmod03.c
> +++ b/testcases/kernel/syscalls/chmod/chmod03.c
> @@ -1,183 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * Copyright (c) International Business Machines  Corp., 2001
>    */
>
> -/*
> - * Test Name: chmod03
> +/*\
> + * [DESCRIPTION]
>    *
> - * Test Description:
> - *  Verify that, chmod(2) will succeed to change the mode of a file
> - *  and set the sticky bit on it if invoked by non-root (uid != 0)
> - *  process with the following constraints,
> - *	- the process is the owner of the file.
> + * Verify that, chmod(2) will succeed to change the mode of a file/directory
> + * and set the sticky bit on it if invoked by non-root (uid != 0) process with
> + * the following constraints:
> + *	- the process is the owner of the directory.
>    *	- the effective group ID or one of the supplementary group ID's of the
> - *	  process is equal to the group ID of the file.
> - *
> - * Expected Result:
> - *  chmod() should return value 0 on success and succeeds to change
> - *  the mode of specified file with sticky bit set on it.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *   	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *   	Verify the Functionality of system call
> - *      if successful,
> - *      	Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *   Delete the temporary directory created.
> - *
> - * Usage:<for command-line>
> - *  chmod03 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS:
> - *  This test should be run by 'non-super-user' only.
> - *
> + *	  process is equal to the group ID of the directory.
>    */
>
> -#include<stdio.h>
> -#include<sys/types.h>
> -#include<sys/stat.h>
> -#include<fcntl.h>
>   #include<errno.h>
> -#include<string.h>
> -#include<signal.h>
> -#include<pwd.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -#define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
> -#define PERMS		01777	/*
> -				 * Mode permissions of test file with sticky
> -				 * bit set.
> -				 */
> -#define TESTFILE	"testfile"
> +#include<sys/stat.h>
> +#include "tst_test.h"
>
> -char *TCID = "chmod03";
> -int TST_TOTAL = 1;
> -char nobody_uid[] = "nobody";
> -struct passwd *ltpuser;
> +#define FILE_MODE	(S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
> +#define DIR_MODE	(S_IRWXU | S_IRWXG | S_IRWXO)
> +/* Mode permissions of test directory with sticky bit set. */
> +#define PERMS		01777
>
> -void setup();			/* Main setup function for the test */
> -void cleanup();			/* Main cleanup function for the test */
> +static char *tpaths[] = { "testfile", "testdir" };
>
> -int main(int ac, char **av)
> +static void verify_chmod(unsigned int i)
>   {
>   	struct stat stat_buf;
> -	int lc;
> -	mode_t file_mode;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	char *tpath = tpaths[i];
>
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> +	TST_EXP_PASS_SILENT(chmod(tpath, PERMS), "chmod(%s, %#o)", tpath, PERMS);
>
> -		tst_count = 0;
> +	if (stat(tpath,&stat_buf)<  0)
> +		tst_brk(TFAIL | TERRNO, "stat(%s) failed", tpath);
>
> -		TEST(chmod(TESTFILE, PERMS));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
> -				 TESTFILE, PERMS);
> -			continue;
> -		}
> -		if (stat(TESTFILE,&stat_buf)<  0) {
> -			tst_brkm(TFAIL | TERRNO, cleanup,
> -				 "stat(%s) failed", TESTFILE);
> -		}
> -		file_mode = stat_buf.st_mode;
> -
> -		/* Verify STICKY BIT set on testfile */
> -		if ((file_mode&  PERMS) != PERMS) {
> -			tst_resm(TFAIL, "%s: Incorrect modes 0%3o, "
> -				 "Expected 0777", TESTFILE, file_mode);
> -		} else {
> -			tst_resm(TPASS, "Functionality of "
> -				 "chmod(%s, %#o) successful",
> -				 TESTFILE, PERMS);
> -		}
> +	/* Verify STICKY BIT SET on file/directory */
> +	if ((stat_buf.st_mode&  PERMS) == PERMS) {
> +		tst_res(TPASS, "Functionality of chmod(%s, %#o) successful",
> +			tpath, PERMS);
> +	} else {
> +		tst_res(TFAIL, "%s: Incorrect modes 0%03o, Expected 0%03o",
> +			tpath, stat_buf.st_mode, PERMS);
>   	}
> -
> -	cleanup();
> -	tst_exit();
>   }
>
>   void setup(void)
>   {
> -	int fd;
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	tst_require_root();
> -	ltpuser = getpwnam(nobody_uid);
> -	if (ltpuser == NULL)
> -		tst_brkm(TBROK | TERRNO, NULL, "getpwnam failed");
> -	SAFE_SETUID(NULL, ltpuser->pw_uid);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	/*
> -	 * Create a test file under temporary directory with specified
> -	 * mode permissios and set the ownership of the test file to the
> -	 * uid/gid of guest user.
> -	 */
> -	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
> -		tst_brkm(TBROK | TERRNO, cleanup,
> -			 "open(%s, O_RDWR|O_CREAT, %#o) failed",
> -			 TESTFILE, FILE_MODE);
> -	}
> -
> -	SAFE_CLOSE(cleanup, fd);
> +	SAFE_TOUCH(tpaths[0], FILE_MODE, NULL);
> +	SAFE_MKDIR(tpaths[1], DIR_MODE);
>   }
>
> -/*
> - * void
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *		completion or premature exit.
> - *  Delete the testfile and temporary directory created in setup().
> - */
> -void cleanup(void)
> -{
> -
> -	tst_rmdir();
> -
> -}
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.tcnt = ARRAY_SIZE(tpaths),
> +	.test = verify_chmod,
> +	.setup = setup,
> +};
> diff --git a/testcases/kernel/syscalls/chmod/chmod04.c b/testcases/kernel/syscalls/chmod/chmod04.c
> deleted file mode 100644
> index cbc13cf61..000000000
> --- a/testcases/kernel/syscalls/chmod/chmod04.c
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -/*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> - */
> -
> -/*
> - * Test Name: chmod04
> - *
> - * Test Description:
> - *  Verify that, chmod(2) will succeed to change the mode of a directory
> - *  and set the sticky bit on it if invoked by non-root (uid != 0) process
> - *  with the following constraints,
> - *	- the process is the owner of the directory.
> - *	- the effective group ID or one of the supplementary group ID's of the
> - *	  process is equal to the group ID of the directory.
> - *
> - * Expected Result:
> - *  chmod() should return value 0 on success and succeeds to set sticky bit
> - *  on the specified directory.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *   	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *   	Verify the Functionality of system call
> - *      if successful,
> - *      	Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *   Delete the temporary directory created.
> - *
> - * Usage:<for command-line>
> - *  chmod04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS:
> - *  This test should be run by 'non-super-user' only.
> - *
> - */
> -
> -#include<stdio.h>
> -#include<sys/types.h>
> -#include<sys/stat.h>
> -#include<fcntl.h>
> -#include<errno.h>
> -#include<string.h>
> -#include<signal.h>
> -#include<pwd.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -#define DIR_MODE 	S_IRWXU | S_IRWXG | S_IRWXO
> -#define PERMS		01777	/*
> -				 * Mode permissions of test directory with
> -				 * sticky bit set.
> -				 */
> -#define TESTDIR		"testdir_4"
> -
> -char *TCID = "chmod04";
> -int TST_TOTAL = 1;
> -char nobody_uid[] = "nobody";
> -struct passwd *ltpuser;
> -
> -void setup();
> -void cleanup();
> -
> -int main(int ac, char **av)
> -{
> -	struct stat stat_buf;	/* stat struct. */
> -	int lc;
> -	mode_t dir_mode;	/* mode permissions set on testdirectory */
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		/*
> -		 * Call chmod(2) with mode argument to
> -		 * set sticky bit on TESTDIR
> -		 */
> -		TEST(chmod(TESTDIR, PERMS));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
> -				 TESTDIR, PERMS);
> -			continue;
> -		}
> -
> -		/*
> -		 * Get the file information using
> -		 * stat(2).
> -		 */
> -		if (stat(TESTDIR,&stat_buf)<  0) {
> -			tst_brkm(TFAIL, cleanup,
> -				 "stat(2) of %s failed, errno:%d",
> -				 TESTDIR, TEST_ERRNO);
> -		}
> -		dir_mode = stat_buf.st_mode;
> -
> -		/* Verify STICKY BIT SET on directory */
> -		if ((dir_mode&  PERMS) == PERMS) {
> -			tst_resm(TPASS, "Functionality of "
> -				 "chmod(%s, %#o) successful",
> -				 TESTDIR, PERMS);
> -		} else {
> -			tst_resm(TFAIL, "%s: Incorrect modes 0%03o, "
> -				 "Expected 0%03o",
> -				 TESTDIR, dir_mode, PERMS);
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -/*
> - * void
> - * setup() - performs all ONE TIME setup for this test.
> - *  Create a temporary directory and cd to it.
> - *  Create another test directory under temporary directory.
> - */
> -void setup(void)
> -{
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	tst_require_root();
> -	ltpuser = getpwnam(nobody_uid);
> -	if (setuid(ltpuser->pw_uid) == -1)
> -		tst_resm(TINFO | TERRNO, "setuid(%u) failed", ltpuser->pw_uid);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	/*
> -	 * Create a test directory under temporary directory with specified
> -	 * mode permissios.
> -	 */
> -	SAFE_MKDIR(cleanup, TESTDIR, DIR_MODE);
> -}
> -
> -/*
> - * void
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *		completion or premature exit.
> - *  Remove the test directory and temporary directory created in setup().
> - */
> -void cleanup(void)
> -{
> -
> -	tst_rmdir();
> -
> -}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
