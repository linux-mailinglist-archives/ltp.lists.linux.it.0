Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 309631B3574
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 05:12:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 982073C6290
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 05:12:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 79E823C2994
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 05:12:24 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C421310008EF
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 05:12:22 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,412,1580745600"; d="scan'208";a="89401026"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Apr 2020 11:12:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3007F49DF129;
 Wed, 22 Apr 2020 11:01:42 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Apr 2020 11:12:16 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
 <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
 <48142e6b-8169-2934-e8b2-f71927cd62b0@cn.fujitsu.com>
 <20200420130140.GB11604@yuki.lan>
 <d3063175-5014-51ea-9d1c-4a9f3e2243b1@cn.fujitsu.com>
 <20200421085544.GB6577@yuki.lan>
 <4b8ee0d5-6f5d-be72-a49a-6cfe3d13e06a@cn.fujitsu.com>
 <20200421121241.GG6577@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <2713174f-fd8a-a011-a062-6a8c3af4f692@cn.fujitsu.com>
Date: Wed, 22 Apr 2020 11:12:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200421121241.GG6577@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3007F49DF129.ABB75
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 02/10] syscalls/ioctl:add common c file for
 loop ioctl
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

Hi Cyril

> Hi!
>>>>>> +void tst_assert_file_str(const char *file, const int lineno, const char
>>>>>> *path, const char *buf, const char *val)
>>>>>> +{
>>>>>> +       char sys_val[1024];
>>>>>> +
>>>>>> +       SAFE_FILE_LINES_SCANF(path, buf, sys_val);
>>>>>
>>>>> We should call the file_lines_scanf() here and pass the filename and
>>>>> lineno that this functions takes as parameter instead.
>>>> I don't understand the meaning of adding filename and line parameter(If
>>>> fail, it will report tst_assert.c: 29). Do you want to report the
>>>> correct parsed filename when failed?
>>>>
>>>> If so, I think lineno is meaningless and it also overides the place of
>>>> the code meet problem . I prefer to add some path info in safe_file_ops.c.
>>>
>>> What I want is to show the test source filename and line on failure, for
>>> that we have to pass the lineno and file to the file_lines_scanf()
>>> function. I think that it makes much more sense to print the line in a
>>> test where the problem has happened rather than some location in the
>>> library code.
>> Oh, I see. ie TST_ASSERT_INT, modify ioctl_loop01.c
>> TST_ASSERT_INT(__FILE__, __LINE__, partscan_path, 0);
>> if partscan_path doesn't exist, it will report error as below:
>> safe_file_ops.c:142: BROK: Failed to open FILE
>> '/sys/block/loop0/loop1/partscan' for reading at ioctl_loop01.c:46:
>> ENOENT (2)
> 
> I still think that we are not on the same page.
> 
> The macros are to be used from tests, such as TST_ASSERT_INT() these
> macros call the corresponding functions with __FILE__ and __LINE__, in
> this case tst_assert_int(). From that point on anything that is called
> from inside of the tst_assert_int() function should pass down the file
> and lineno so that we get the filename and lineno from the line the call
> has been called in the test.
> 
> So if we do TST_ASSERT_INT() in the test, we call tst_brk_() and pass
> the file and lineno so that we get the correct test line in case of a
> failure.

> 
> And for the same reason if we are going to get an value from a file from
> inside of the assert function we have to call the safe_file_scanf() and
> pass down the file and lineno so that if the call fails the test
> filename and the line on which the call originated in the test is
> printed.
> 
> Is it clear now?
OK. I guess I only need to use safe_file_scanf(file, lineno, NULL, path, 
"%d", &sys_val) in tst_assert_int function as you suggested at the 
beginning.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
