Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF953FC1C6
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 06:15:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3871C3C9B47
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 06:15:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7E8E3C2A9C
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 06:15:41 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-os2jpn01olkn0175.outbound.protection.outlook.com [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DCABD600774
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 06:15:40 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngVvnA9mzmOUzWi0YpkcG+iy4lJC2U44aNWu0MJPc18dOgPiF5xeUgxabrtf+RawK9jTKETtKGeVZFP0+NUaNgngwP6iyiIlFqW52FPuXfk+0C5m4E2O4a9C0v3rKjshW9PAQz9vWKoccSWQ4CgjXwpc3muqymqt4NpS8ejjEEdnniYYq4+8H+yHDv2P+vMyIhIfBNTypcZXsH1RY1FqwlwL9zCKoGe4abUcGOfCT21BAw7ViZIXdzZxfUynSnG8dYcVsolUdUB1CDmSWCY53cb1GMkRQQfv6kStNM/0KdTnJRcPTTMxCkv/u+cHOCqc59Hx43yepNCz2C7Q/TsdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dMDbL48UjoGcac6dEVLjz/PqIUMjHGhIIQTYaIueTs=;
 b=eobknpAHlCzX9gHWnwqWBJ4NpuhVfm0KxmNGPsuUe8wvPdluzREUgyW6OGO3/4Cvl0BOMY7aQit91wseaJ8/6KimHg2WjGj0VnpfaYhcDStEqrLfi4BKLKj3SSkzWG5qnZoRg572wO+lKB1z4NBAnPql5wA34Yy/S8OBXFsffBaGoeLvqtTW3jDYLWGyETOXdL1XQeICa4NOY23hrdRR9cG+HyK2Ef5euF9nlw4T0q/JzqDWPv6y6mBHVzYXmpuprMSP7cQkcuV/J6JavyxsifY3hJt4st0i+6wblyz1I4ztSbOFZ4gHTvrppJL6GdJCJvxH1ZcVkijRriT7J9rtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dMDbL48UjoGcac6dEVLjz/PqIUMjHGhIIQTYaIueTs=;
 b=Co10IENHgCS9j958RGnaAbe9NI9Qqqr/TDnIhzruuQUzHSsIIhIJUiUTeMB95wG5BWZ6i1vAxDW4/JYLfIzCVgCnSaRcryH9CPDbVOr2A5lPocZ6yubCQ73W4KonqsCRT319vgKEHLDgGEeKq91JMixIblTpH4+X721sxlUXgZ3zaMtZeaJrJRHmRXELHsdkHrBaqnBTHfsKl+XWv8Yn1wjH2foiFkSeny/8ebCh7wbG2skumCr10uNzLGZ37P+C1TS8yXdg4I602mfwujVuiEfm5E5DiB4+3UcW1VsHXxAjKb9NRwtHgPt8pjzunzIJ+gGhVucaaf2k9z7YR29Ljw==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSZP286MB1275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 04:15:37 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 04:15:37 +0000
To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>, ltp@lists.linux.it
References: <20210831024617.246758-1-threefifteen.wangkunfeng@huawei.com>
From: Xie Ziyao <ziyaoxie@outlook.com>
Message-ID: <OSZP286MB08712631399F14EC1329DFEDCCCC9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Date: Tue, 31 Aug 2021 12:15:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <20210831024617.246758-1-threefifteen.wangkunfeng@huawei.com>
Content-Language: en-US
X-TMN: [vJzRoidxektFJCVehOGpLEtt/AXI4Gnt]
X-ClientProxiedBy: HK2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:202:16::13) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <9aeefd61-1806-f847-1235-61fd842c11bc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ZiyaodeMacBook-Pro.local (14.192.49.77) by
 HK2PR02CA0129.apcprd02.prod.outlook.com (2603:1096:202:16::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.20 via Frontend Transport; Tue, 31 Aug 2021 04:15:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed5db081-bcba-4428-1a76-08d96c35fc37
X-MS-TrafficTypeDiagnostic: OSZP286MB1275:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dEMXc4LxDYNuxyfeR7sPizPNm01pv2DjvclR5yJttsv3w+Y6nijfmYF0vLNsGbDYy0iezQ7A87gk01aA9sLNociBiAxoaTd6F/WjMOmMuqgr0nrZyDi6M5DaTKR+9rwCcQ2GfFwio3EIHFrW8540iq/7aLuQxdBZz3agbR0+EyQoRCaNBYWm5jWbNyHmuMeheaOIMkZEkzPwHREEF4+5ociD9el5NIDfmEZmgSVnVvc7mUK82tArs0rJsF5vfdvORTDjj2APz14EJZLEjLUGw105hY5tys31l/DXNuioNqaKXrWRaaTLEY9AV0qDXBXssBM7CY/G1WPi1ZVS5yqJmH5GRR+w6C7yoE+zZlMJOYex8bbfC2nMAutD5Z9CVQ8dMe3+ZFZfTH8XanE1o0bBe3n5xio5leZxtgAe/jqOsk0J9bm06bHnm1IaMV07OBli
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OhlEX6I3VmBYmcD5T1gLCG1Bk+1YmObdoDoFmT6mf+R2BWz4yUFVNoo8RvF459i94RS2Jhiava8PXS8fq9nfSdF0hmXP0gdhWGfKEQuIAOYoPPFCFquoZ4+LexHgUTIT6XvVY1SyZxUtu/AyUnoPJw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5db081-bcba-4428-1a76-08d96c35fc37
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 04:15:37.1984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1275
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] gettid:Convert gettid01 to new API
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Kunfeng,

> Convert gettid01 to new API
>
> Signed-off-by: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
> ---
>   testcases/kernel/syscalls/gettid/gettid01.c | 95 ++++-----------------
>   1 file changed, 15 insertions(+), 80 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/gettid/gettid01.c b/testcases/kernel/syscalls/gettid/gettid01.c
> index 7e5b6b175..2e45be588 100644
> --- a/testcases/kernel/syscalls/gettid/gettid01.c
> +++ b/testcases/kernel/syscalls/gettid/gettid01.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
The license here should be GPL-2.0-later.
>   /*
>    * Crackerjack Project
>    *
> @@ -6,91 +7,25 @@
>    *            Yumiko Sugita <yumiko.sugita.yf@hitachi.com>,
>    *            Satoshi Fujiwara <sa-fuji@sdl.hitachi.co.jp>
>    *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License
> - * as published by the Free Software Foundation; either version 2
> - * of the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> - *
> - * $Id: gettid01.c,v 1.5 2009/10/26 14:55:47 subrata_modak Exp $
> - *
> + * Porting from Crackerjack to LTP is done
> + * by Masatake YAMATO <yamato@redhat.com>
>    */
>
> -/* Porting from Crackerjack to LTP is done
> -   by Masatake YAMATO <yamato@redhat.com> */
> +/*\
> + * [Description]
> + *
> + * Basic test for gettid() function.
> + */
>
>   #include <sys/types.h>
> -#include <linux/unistd.h>
> -#include <errno.h>
> -
> -#include "test.h"
> -
> -void setup();
> -void cleanup();
> -
> -char *TCID = "gettid01";
> -
> -int TST_TOTAL = 1;
> -
> -pid_t my_gettid(void)
> -{
> -	return (pid_t) syscall(__NR_gettid);
> -}
> -
> -int main(int ac, char **av)
> -{
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
>
> -	setup();
> -
> -	/*
> -	 * The following loop checks looping state if -c option given
> -	 */
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(my_gettid());
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "gettid() Failed, errno=%d: %s",
> -				 TEST_ERRNO, strerror(TEST_ERRNO));
> -		} else {
> -			tst_resm(TPASS, "gettid() returned %ld",
> -				 TEST_RETURN);
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
> -void setup(void)
> +static void verify_gettid(void)
>   {
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> +	TST_EXP_POSITIVE(tst_syscall(__NR_gettid), "gettid()");
>   }
>
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *		completion or premature exit.
> - */
> -void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = verify_gettid,
> +};
> --
> 2.17.1
>
>
-- 
Best Regards,
Xie Ziyao
E-mail: ziyaoxie@outlook.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
