Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20D3F98B1
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 14:03:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 548C03C2DDB
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 14:03:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C9ED3C2D5C
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 14:03:55 +0200 (CEST)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com (unknown
 [104.47.93.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 532101A003D4
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 14:03:53 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0r3FwEmnBeM8ZZGMru4/Yi/W8gAhmLfjWsnp6js7N41wM7R54ykyM+ah3ogSWpdxYJ3P6iBq9JoNXo4+cq922UpZMOPfSW1CLqplgeSHpaAbqJvd2etFnP8j9wdc/EZ8H7EQfIGgyHevAdwfhZmwhdxTCRyJ6YcEccQFxAS6oaprGBicy/HfGKLPSBECadTf5boI5UDm/ce3VYBL+xH4yOsp3ANC0HZWTIdac+evps53E/eJbIszjIzvVOTiosQLtAN1FgOVhnTt+FxKAv/Fx/jmJdPm4iRCeFPtUVq7P2+9nDLUfKrKpUdwZsf/vC0XFwwMz/5HuqULgknma0sjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP1yfXn9Dx5CW9WSw6x3+1F6YX0TpKKJjcdYNZNqjgQ=;
 b=HmCetEGDYyg42dQ+nkKywoFAHELvM2wUY5WYn0BmEeu65AHG7yzUlkvr1fY82hk2cp3cyPBDj4BviEVOduXIt7sRtG530xlLvXt4UW9AxO4OS+252GO3YogcAzQicFoS+RiaFPb3tVAZ+t1LOiUv9BWVn4uRAjPSJCcluCdsY9WtGZnP4MeSxFFg3gAe5smYaZskD6X8ecqSVPVYnE2FkXhnkytihxUjLnpztYojD84fDFdnx1VADAuNSTotqPog7BFvjC1VWC0QDN2e12LmM5rCi/J1Wp7xxnH4PFFwhBJsj7kR/DFmM6beGjXZJU1BtAtskdXotVYtj0OIv3fNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP1yfXn9Dx5CW9WSw6x3+1F6YX0TpKKJjcdYNZNqjgQ=;
 b=QaFES7C79xvchAdpu8QHuAYfx0cK3wueBEiGIBK8isnf75lhXjlu2u1XzCgojUgwEZsq3nvMY3Pe4EHdQzkoU3WiA34tsYh1u/lbc6RHpKxVeHbYzrlqdT0fSjUhwyAkYJJb265FmiR+bzPOifjrCcQhBD/DyE640avHDb471mx8xX95RrUFMhL/0EPHVCfoTsOYJmZjYMRpr5WqrcXIA49ClRN9FeHVXkS61nnZckei3YfJZUl9eX9bLDugPJxcgHKW04ha0Ulmzh9Fa7uGeN5DwgYChtTLIWeibU6icY7W6dBlViJVTFUAwQMJa/7mvbhR0OKk4IIWCFvAe3MklQ==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSYP286MB0102.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:81::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 12:03:50 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.021; Fri, 27 Aug 2021
 12:03:50 +0000
From: Xie Ziyao <ziyaoxie@outlook.com>
To: ltp@lists.linux.it
References: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <OSZP286MB0871564CA6D3D879E4E9B94DCCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Date: Fri, 27 Aug 2021 20:03:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
X-TMN: [TtWdLxgziEpiSOryET2WXjVOSr7cBa9E]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <32f30a4a-b9f9-9b02-8a6b-8de9efc68429@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ZiyaodeMBP.lan (14.192.49.77) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 12:03:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d894c9a-6e77-4911-d99e-08d96952bb52
X-MS-TrafficTypeDiagnostic: OSYP286MB0102:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HfEV22msesFSsLqk+k66uMX6yg+sf1b9EaWsOU7Vfb3DxxG/03VbZ0QCAzTMxSYlESj0dkmhW5g8mkanU2u7tD8wn8RFQP1Blr5sagrGKISPVhNRJ/KGSXSI1MY2rSMQl7Bw+q1ugLSSVhORwlkkHSXlxTHbUVBYs6OJkhxBUQemPMZ2rw0ij2w0lCbmhEUaU4IoMp124gFmBjMT50g1V0fwPeCuChUXZGQ95x/0o0zfuuvSJ89gXkkhQD7YOQa+S0GdLdspOY2whAHZqIt4YhlidAsXfh3wFT6lDI9KemTehMHYWQIFs4FYes4rWsn/BAjoSYaK7b/B11J8P7Um0ofilF1j2Az9uM9aC66ko68g75hz2H0sOv9+qSqal6p/DWiDS5ZLShS2I5SvBrulow3bTehh2qR/nK9sJxAyKE0KgiD50A4XTKcZQjN3J+xA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kTvwBGd8RRG2ZLcXkhj/W4bahymE3AtfzJutf3HiHtIZUDObEtg1+KLBVTlK4KXj0ej7wHf4zS7xc/zDyd01+1JJA4cKcFFU7R30aM7Eo5qW+QRiQ2ImAwJ46KgSbsG5YnAK1GljQ5QeaNPQeAl61g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d894c9a-6e77-4911-d99e-08d96952bb52
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 12:03:50.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYP286MB0102
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] epoll_creat01: Replace TST_PASS with TST_RET
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

Hi,

> In TST_EXP_FD(), the value of TST_RET is the returned fd, not TST_PASS.
>
> Fixes: 081f940b2df00 ("epoll_create: Add test for epoll_create01")
> Signed-off-by: Xie Ziyao <ziyaoxie@outlook.com>
> ---
>   testcases/kernel/syscalls/epoll_create/epoll_create01.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> index 54fd0810d..29ac3763e 100644
> --- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> +++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> @@ -26,9 +26,8 @@ static void run(unsigned int n)
>   {
>   	TST_EXP_FD(tst_syscall(__NR_epoll_create, tc[n]), "epoll_create(%d)", tc[n]);
>
> -	if (!TST_PASS)
> -		return;
> -	SAFE_CLOSE(TST_PASS);
> +	if (TST_RET)
> +		SAFE_CLOSE(TST_RET);

This patch fixes the incorrect use of TST_PASS in commit 081f940 
("epoll_create: Add test for epoll_create01"), which I noticed when 
reviewing the merged commit.

Sorry for this minor mistake.


>   }
>
>   static struct tst_test test = {
> --
> 2.25.1
>
>
-- 
Best Regards,
Xie Ziyao
E-mail: ziyaoxie@outlook.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
