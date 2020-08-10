Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29824070B
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 15:56:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C74A53C3157
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 15:56:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 237DC3C08AB
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 15:56:46 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80111.outbound.protection.outlook.com [40.107.8.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1A7CE14004E3
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 15:56:45 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAHGE50AKy0WTEAf4HszY1Y+gUOemYgFwHRm7bATFMaPEv+e6zAkq+cgijBQ00eASA5SNxgVK7y++KRhrvNo79QRXidq4y4wCY6N56Wevq453nyBAvebhSwYFIcftue8LtGyRANzVQAJaG90+JldPrvFXkCz+1Sqkmkd2HhmAFsMg39oJcyjO+RXBURuiPdT5AcyCpU1kH3nKOiHn8DzK+ttHZmSENmlKIN+j7wAYJiAei/xzZNOSooMDyYi9JSFaNEDQOgWhB3umhEMjnnmh5D1yIK3wHVbigfRzRi1P0wyoxZAVqfCzxNxEsuE8mSM5I/P3DfCbb6g2IkpF0AzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BFtGL+IjDZ76jyRLyLHrInDgxANsAmOH+1Q7gMW+2M=;
 b=ZcyKhxn+kVjVMF+fxvRTQjAiwJZEic4E+PsYfhAi/8Y1NqeLMMUUPZ1Sr8VZ4vK/BftC5lBsk74WNVRqjmvx7N4YRTdvIQNaOPGxRm/tic94cv4k8VBRM+Z3HvK8Rxliq1u9W6trqMu2LznEwtjk0bJATFua1iH4FQKF5ESgOaUuckpY6bGHnDHwCaKPx0n29tK0xwThZxA7/wBTKHT4Twp59gvD+5JITsRVg2gBG1sFI7NJFvnYvY+NxypDG2N0g9xZh+X+AbN8FzliroLSTeKiy1uf18rNd9n9VFAHRITPTAfnqm5nuduxCv5q4nFzDYIMar/Dpogvt/YI9t49fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BFtGL+IjDZ76jyRLyLHrInDgxANsAmOH+1Q7gMW+2M=;
 b=gGWwcwIYsJ/dqWNknaZ7yJSHwU/0HpAMMS6J8VweXdqAJc9LRWoqnmaZ9VHAtt/BlgO+ZNeMNUX5eZR1OvqyX5BzSX/0ag4iE81pntLqEhWeAGpaGDhA/7H2kz4t+EN2n7G3NIiwIOKtd5o0B3eSSnBRe4BtGJ34QYxITMUSiPI=
Authentication-Results: vivier.eu; dkim=none (message not signed)
 header.d=none;vivier.eu; dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com (2603:10a6:802:a1::22)
 by VI1PR03MB4160.eurprd03.prod.outlook.com (2603:10a6:803:54::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Mon, 10 Aug
 2020 13:56:43 +0000
Received: from VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362]) by VE1PR03MB5246.eurprd03.prod.outlook.com
 ([fe80::3568:5b4f:ab6b:e362%6]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 13:56:42 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200807113950.69052-1-Filip.Bozuta@syrmia.com>
 <20200807113950.69052-3-Filip.Bozuta@syrmia.com>
 <20200810125719.GC11869@yuki.lan>
From: Filip Bozuta <Filip.Bozuta@syrmia.com>
Message-ID: <ceb37d42-c6db-4438-efe8-221f1da0d556@syrmia.com>
Date: Mon, 10 Aug 2020 15:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200810125719.GC11869@yuki.lan>
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::16) To VE1PR03MB5246.eurprd03.prod.outlook.com
 (2603:10a6:802:a1::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.62] (109.245.34.160) by
 AM0PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:208:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.15 via Frontend Transport; Mon, 10 Aug 2020 13:56:42 +0000
X-Originating-IP: [109.245.34.160]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50006113-7f8f-4998-1583-08d83d353646
X-MS-TrafficTypeDiagnostic: VI1PR03MB4160:
X-Microsoft-Antispam-PRVS: <VI1PR03MB41603137CCC3103318782F04EB440@VI1PR03MB4160.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t4EHGnUt/fcbKkpwQvYU4LtHegDcpmtQ4TUZ9j9rv85Hgky0ihwKH5zZHlBl75nVodRpaSjdb6cTvlqhru9C5tmphTpLHOGy4rutYzhpwLonIFMC2p6ii8TIukS+T0k0ZN3wzIoMkbGc+rD2tfM8lL/lquTbI6m3o/gYm50ZGTpmXP5vTxFYa+Llvrb1Ps+3MA23+crt1CCRpry2dZvoul2tt+bgUJiQ13ymErYmLoEJn9Iv274p/pAnkY21oFeaS5Yvg2O4Sa6jfxz8+qgAT0rVXzVfQzXpMFFo1O4KZd1XCfcPtWXXWHXXEDcezULcnQiC25jZd0QkM9PMiXn0WPLTWQdArku0SkxFLApU6xR/lvB5c+BSrPt/vqF3YTjZAqfaKINsxSLOHZxY6uKwCviAUcGTIXiRgC1YysIPQOufJBmYC6Xw22Y1qYN77SvhaRht1yZJF+Svv7mrC8LMbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5246.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(39830400003)(346002)(136003)(376002)(966005)(316002)(36756003)(8676002)(8936002)(66476007)(66556008)(6486002)(6916009)(66946007)(4326008)(2906002)(31686004)(26005)(508600001)(16576012)(83380400001)(16526019)(86362001)(5660300002)(186003)(31696002)(6666004)(52116002)(956004)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Cwk+agpL5IOwiXQ4x8sxRyw+W229OoPJbnU2zDmlaBhNqqaWvybHvXG0Ekc8+LKCydKpP+CrqKryr8SrX0oyb4ZR4ckoJZi1Fnlzsx2+mx6TAVRO7sXizxIxTqRwtXe34iFZ1aYvm+kDdPNgZs4WwJXCH57V6ul4R2lI5S4y7xAFZWMBWCAjJ4NUZNokB/WWniz8/YFb8MJVK0YOEixAyycrJmqvoDCl7K5xsuV8RBFhsS2FQ8hrvZ4I6c1cWhHQeIT+EYaA+HPcIlC4dtzWi4aWw8vv8Fy1C8HHiv1vHir4PmQFFC+o0i0Gq6xB4/RVCFSv303p2veIQp0sYFR01hgP4CU0C+PR9KCcb5I2kPHl4ZrvNBoTu8wcdyMQ5sw8LMD35PZseTRMxM2AwYsdg9+nEmdC9c16jiFM/15rP2dAnelDslbzoatjFzgKT21Nu98SYyAfFHqwERGeKIQGpHmHwI0sqUafYjVnfJd3U+yiV2g5k4kC30FmFDLQJ1SVdgwXIxWK0lvzlBnxQbJv9kV72eJnibKBSLwbgoxzhJdFx4otjdmPjcMwaCAvZyZvCAxYPK+7IFadROCIMr6u+SNN0dHij1oQd2JFVp5/MjuxN2x/iKLkyuweB/uLzxjCwVxCtN7v8bLYASWQEhUMtw==
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50006113-7f8f-4998-1583-08d83d353646
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5246.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 13:56:42.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYrc42VX6NIAymBfXTb1RQsM4UC4CffNJR1/7UctLYqwcV5MCHWTZsd62qeMna8EbmpijyRpDRJgC4btDHo0Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4160
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] syscalls/clock_nanosleep: add a test case
 for bad timespec address
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
Cc: laurent@vivier.eu, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

thanks for the review!

On 10.8.20. 14:57, Cyril Hrubis wrote:
> Hi!
>> This patch introduces test cases for already existing test
>> for syscall 'clock_nanosleep()' (clock_nanosleep01). These test
>> cases are for situations when bad timespec addresses are passed
>> for arguments 'request' and 'remain' in which case errno
>> EFAULT ('Bad address') is expected to be set.
>>
>> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
>> ---
>>   .../clock_nanosleep/clock_nanosleep01.c       | 35 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
>> index 4542995f2..66108ed8e 100644
>> --- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
>> +++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
>> @@ -20,6 +20,8 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
>>   enum test_type {
>>   	NORMAL,
>>   	SEND_SIGINT,
>> +	BAD_TS_ADDR_REQ,
>> +	BAD_TS_ADDR_REM,
>>   };
>>   
>>   #define TYPE_NAME(x) .ttype = x, .desc = #x
>> @@ -78,6 +80,22 @@ static struct test_case tcase[] = {
>>   		.exp_ret = -1,
>>   		.exp_err = EINTR,
>>   	},
>> +	{
>> +		TYPE_NAME(BAD_TS_ADDR_REQ),
>> +		.clk_id = CLOCK_REALTIME,
>> +		.flags = 0,
>> +		.exp_ret = -1,
>> +		.exp_err = EFAULT,
>> +	},
>> +	{
>> +		TYPE_NAME(BAD_TS_ADDR_REM),
>> +		.clk_id = CLOCK_REALTIME,
>> +		.flags = 0,
>> +		.tv_sec = 10,
>> +		.tv_nsec = 0,
>> +		.exp_ret = -1,
>> +		.exp_err = EFAULT,
>> +	},
>>   };
>>   
>>   static struct tst_ts *rq;
>> @@ -106,24 +124,37 @@ void setup(void)
>>   	SAFE_SIGNAL(SIGINT, sighandler);
>>   }
>>   
>> +void cleanup(void) {}
> Please just pass NULL to the tst_get_bad_addr() instead.
>
> Also it should be called only once in the test setup, as I explained for
> the previous patch.

Yes I will change this and send v3 for this patch soon. I will pass NULL 
and move the tst_get_bad_addr() in test setup() same as in the first 
patch. Thanks for the explanation!

>
>>   static void do_test(unsigned int i)
>>   {
>>   	struct test_variants *tv = &variants[tst_variant];
>>   	struct test_case *tc = &tcase[i];
>>   	pid_t pid = 0;
>> +	void *request, *remain;
>>   
>>   	memset(rm, 0, sizeof(*rm));
>>   	rm->type = rq->type;
>>   
>>   	tst_res(TINFO, "case %s", tc->desc);
>>   
>> -	if (tc->ttype == SEND_SIGINT)
>> +	if (tc->ttype == SEND_SIGINT || tc->ttype == BAD_TS_ADDR_REM)
>>   		pid = create_sig_proc(SIGINT, 40, 500000);
> Does the kernel access the remaining time only if the call gets
> interrupted by a signal?
Yes, the the 'remain' argument is accessed only in a case when call gets 
interrupted by a signal and in case it is not NULL and if flag 
TIMER_ABSTIME is not set, the argument gets updated with the remaining 
time from the timeout. For that reason a signal should be set in this 
test case so that the test fails with expected errno (EFAULT) when 
kernel tries to access the argument.
>
> I guess that this would be better written down in comment.
>
> Generally LTP testcases usually have short documentation in a comment
> just after the license and copyright. In this case it should be
> something as:
>
> /*
>   * EINVAL - negative tv_nsec
>   * EINVAL - tv_nsec > 1s
>   * ...
>   * EFAULT - invalid request pointer
>   * EFAULT - invalid remain pointer while interrupted by a signal
>   */

Thanks for pointing this out. I will put these short comment 
explanations in my v3 version of this patch.

Best regards,

Filip

>>   	tst_ts_set_sec(rq, tc->tv_sec);
>>   	tst_ts_set_nsec(rq, tc->tv_nsec);
>>   
>> -	TEST(tv->func(tc->clk_id, tc->flags, tst_ts_get(rq), tst_ts_get(rm)));
>> +	if (tc->ttype == BAD_TS_ADDR_REQ)
>> +		request = tst_get_bad_addr(cleanup);
>> +	else
>> +		request = tst_ts_get(rq);
>> +
>> +	if (tc->ttype == BAD_TS_ADDR_REM)
>> +		remain = tst_get_bad_addr(cleanup);
>> +	else
>> +		remain = tst_ts_get(rm);
>> +
>> +	TEST(tv->func(tc->clk_id, tc->flags, request, remain));
>>   
>>   	if (tv->func == libc_clock_nanosleep) {
>>   		/*
>> -- 
>> 2.25.1
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
