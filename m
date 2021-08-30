Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CED223FB907
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 17:34:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 057273C9B2B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 17:34:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B8A0B3C2B49
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 17:34:32 +0200 (CEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (unknown
 [104.47.92.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0CCA310000CD
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 17:34:31 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpWEY31CPARp3oO+8J5cFQnjAJiB+3VyUGScl3o5u6+PD7yx19fynn/BpxTynKarxm39IOZUnR+ogHPIGPyDQw68hhPuic8hrT7L5WuixMLVdVzW/Doc6zNBSzWPKEXHxCBBTBiXgWnJ813y+h/mUlu017McJvd3zPoCBW46MRDuviDruvSY35yvZL9CTk1GrZAgn4hVWnTvvcdnuOKSIVO1yrLyFGAnfPFKQ/iDP3df2C03QzTPq+eYC1hyTOGJRKhlIre+btZw8dVd9YJeuid9OUEbrd8Xq0ZRg7nQ1f/XxQTrbGgVQsoj6fBfxlyjFsV4MoWZPFPSVB5UfvHKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ4OnpfgGv0GCelTGG7cl0n184wtf7J/8puSAYuzvA0=;
 b=RzxqVa6jwzqkX+5nG29o3GeQr4NOnOgjsIqqzQdp8gRzGSdR0eW5u5dKHJ4G0D8pxDQ+8av7zFDKJnos58otweuEGuEiqdVMrCacMcamgDlki0ezWr6UNgHGeVeDsRF6/2HFO/9Ry3UcnZcY7elVDnvc4nKhDTTF4hhRCSyO5B8ejvrUkiJTGj2oA585CycZiFCzDgzQd4ms74JgjWOdVsWM/nMiH+Okw67fv13fblcGTfG72ltmpk/e12n0MwqqilxsK5bKC1eIP4NN87zUAzvWeYxrkk//zlt3unKdz1uwtMlyudShoBFjeQyOw7feKe1hINcTt66s/CKoiY3BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ4OnpfgGv0GCelTGG7cl0n184wtf7J/8puSAYuzvA0=;
 b=NKnkT374DLwI7XzIm6VKwutQrAtsP6Zxa/CUNlXDYt0bFV89wymgGqFwPFdgc+V2xX0PqthnayRgbMHdWPS9nn1A4g07Lj8ZKPNawqGXvsczZ44Wte9ig38SVVpaCupThJwRyGPV1Y/1QoYschoKSerH5QIceIYhn3bCPjFWlFF5HjpnbrODO0wfDQmcZtHayRCSQdR9NYR2UK5l2Kf8wyx/ZOQAfS13MtltaB3LVGe543ILw5CK1rXce0S4y+321zXIdH4EvgLlJ3+XWJ6D/hL9jgB63M03FT1HUR+cwRXO/hDQLUI0NY4Tv2jCpLHT4+5iZUG9BNPHQ5pCrKiq0g==
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:e9::13)
 by OSYP286MB0312.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Mon, 30 Aug
 2021 15:34:26 +0000
Received: from OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209]) by OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fc56:5558:8b5e:4209%5]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 15:34:26 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <OSZP286MB087168E8DE5E0E49C9F90E27CCC89@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
 <YSzwIwm7q533tlpD@yuki>
From: Xie Ziyao <ziyaoxie@outlook.com>
Message-ID: <OSZP286MB0871D6BC61046333773018F1CCCB9@OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM>
Date: Mon, 30 Aug 2021 23:34:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
In-Reply-To: <YSzwIwm7q533tlpD@yuki>
Content-Language: en-US
X-TMN: [pZcYnXk/bAZmbKuTXox4dOP4brKjm3FK]
X-ClientProxiedBy: HK2PR03CA0046.apcprd03.prod.outlook.com
 (2603:1096:202:17::16) To OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:e9::13)
X-Microsoft-Original-Message-ID: <966455a7-a148-660d-a40a-f2bd9e4d8a49@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ZiyaodeMBP.lan (14.192.49.77) by
 HK2PR03CA0046.apcprd03.prod.outlook.com (2603:1096:202:17::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.12 via Frontend Transport; Mon, 30 Aug 2021 15:34:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cecdb285-909c-49c2-7d8b-08d96bcba66e
X-MS-TrafficTypeDiagnostic: OSYP286MB0312:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zaopuw15oyOwR/WV6rfcIQRVOhIukmfqHSmgqMmL1+zv0OoUmQrbX7YuzM0u6wQTPygSQJO1EWLDj2pgcBbNeZebxL0rj5ojSqkZ3W6oXYUwMTjmNhGcEC56vWIC6KLPys/QP2yX3mU3cjwY6nR8TKKxCmfGpCgawRr1LWIyEEzDpUWtAH6oAotAJCNxMgXxdRG2O/k5ZqUI5tOOJOsJhu5Sz92ZYGoSdxR5pL4KYzWut6lUIK4tFJyqqFviLJe3OqG6wD8w4CuflV5W1pY+9fjbI6JQA/tLF6TO6WZxlk3K7nmDOCTbqSmHZOfUmewdH44CAnVsen2uua2ruClU71Q3NI5oTe/2V9dXcyh7RWMx+RKBWvDb6AQWYhCh+ttnaBZWQPc9O+5Pk2jebHxugwrjMrdR12kG3Nj4xMYxzBunUSKGnUJf5FeUUaXj3XDk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aBU6E6RMyc/BxzU76XEdu03GkykLLKxkXpZ3vg+QQo9NXsuxWXnQJweA15P7mH90kE585vpkn2RYvpl2Bwy8Ugemf0ejb4q8d9BhJNWALTCvsOcB3KpmupovmEysGtkx0WbMKgmVY4Kvs0AgriBRWA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cecdb285-909c-49c2-7d8b-08d96bcba66e
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB0871.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 15:34:26.6279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYP286MB0312
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Cyril,

> Hi!
>> diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
>> index 54fd0810d..29ac3763e 100644
>> --- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
>> +++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
>> @@ -26,9 +26,8 @@ static void run(unsigned int n)
>>   {
>>   	TST_EXP_FD(tst_syscall(__NR_epoll_create, tc[n]), "epoll_create(%d)", tc[n]);
>>
>> -	if (!TST_PASS)
>> -		return;
>> -	SAFE_CLOSE(TST_PASS);
>> +	if (TST_RET)
>> +		SAFE_CLOSE(TST_RET);
>>   }
> Isn't this broken as well?
>
> As far as I can tell the if (!TST_PASS) part in the test is correct and
> we only have to change the TST_PASS to TST_RET in the SAFE_CLOSE().

Agree with you. By the way, would you mind helping to modify it?

Thanks a lot.

>
> So we should apply:
>
> diff --git a/testcases/kernel/syscalls/epoll_create/epoll_create01.c b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> index 54fd0810d..3ef5b5cac 100644
> --- a/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> +++ b/testcases/kernel/syscalls/epoll_create/epoll_create01.c
> @@ -28,7 +28,7 @@ static void run(unsigned int n)
>
>          if (!TST_PASS)
>                  return;
> -       SAFE_CLOSE(TST_PASS);
> +       SAFE_CLOSE(TST_RET);
>   }
>
>   static struct tst_test test = {
>
>
-- 
Best Regards,
Xie Ziyao
E-mail: ziyaoxie@outlook.com


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
