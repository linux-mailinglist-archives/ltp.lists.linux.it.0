Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6861AFFDB
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 04:24:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74EB33C2A6D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Apr 2020 04:24:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E80B73C2A3D
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 04:24:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 817FB1BDFA2A
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 04:24:19 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,405,1580745600"; d="scan'208";a="89249759"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Apr 2020 10:24:13 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 9FB8A49DF149;
 Mon, 20 Apr 2020 10:13:39 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Apr 2020 10:24:15 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200417151050.GA2491@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8dd0a496-c46f-55d2-2393-5566eff618ff@cn.fujitsu.com>
Date: Mon, 20 Apr 2020 10:23:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200417151050.GA2491@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9FB8A49DF149.A17E1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> + */
>> +#define TST_NO_DEFAULT_MAIN
>> +#include "ioctl_loop_support.h"
>> +#include "tst_test.h"
>> +
>> +void check_sys_value(char *path, int setvalue)
>> +{
>> +	int getvalue;
>> +
>> +	SAFE_FILE_SCANF(path, "%d", &getvalue);
>> +	if (setvalue == getvalue)
>> +		tst_res(TPASS, "%s value is %d", path, setvalue);
>> +	else
>> +		tst_res(TFAIL, "%s value expected %d got %d", path, setvalue, getvalue);
>> +}
>> +
>> +void check_sys_string(char *path, char *setmessage)
>> +{
>> +	char getmessage[1024];
>> +
>> +	SAFE_FILE_SCANF(path, "%s", getmessage);
>> +	if (strcmp(setmessage, getmessage))
>> +		tst_res(TFAIL, "%s expected %s got %s", path, setmessage, getmessage);
>> +	else
>> +		tst_res(TPASS, "%s string is %s", path, getmessage);
>> +}
> 
> In the end I've renamed and moved these functions into the test library
> because the functionality is generic enough and I doubt that these
> tests would be the only one using it.
That's great.  I remember prctl cases use this function. Also, in some 
cap cases, it needs bitwise operators(I only know prctl08.c). Maybe we 
can add TST_ASSERT_BITWISE?
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
