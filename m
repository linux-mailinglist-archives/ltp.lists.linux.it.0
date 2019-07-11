Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E91650B6
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 06:00:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C70A3C1C93
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 06:00:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 62C043C03AD
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 06:00:27 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A6908600A60
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 06:00:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,476,1557158400"; d="scan'208";a="71154220"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jul 2019 12:00:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id BAED74B40405;
 Thu, 11 Jul 2019 12:00:15 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 11 Jul 2019 12:00:15 +0800
Message-ID: <5D26B44D.4010208@cn.fujitsu.com>
Date: Thu, 11 Jul 2019 12:00:13 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190710135710.GC5628@rei.lan>
In-Reply-To: <20190710135710.GC5628@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: BAED74B40405.ADE06
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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


> Hi!
>> Alter find_free_loopdev() to return the free loopdev minor
>> (and -1 for no free loopdev) and then WE can safely use the
>> minor number that find_free_loopdev() returned in test cases.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Amir Goldstein<amir73il@gmail.com>
>> ---
>>   doc/test-writing-guidelines.txt |  9 +++++++++
>>   include/tst_device.h            |  6 ++++++
>>   lib/tst_device.c                | 12 ++++++------
>>   3 files changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
>> index c6d4e001d..887801e68 100644
>> --- a/doc/test-writing-guidelines.txt
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -1045,6 +1045,15 @@ IMPORTANT: All testcases should use 'tst_umount()' instead of 'umount(2)' to
>>   -------------------------------------------------------------------------------
>>   #include "tst_test.h"
>>
>> +int find_free_loopdev();
> Once this is exported as public API it should be prefixed with tst_.
>
OK.

>> -static int find_free_loopdev(void)
>> +int find_free_loopdev(void)
>>   {
>>   	int ctl_fd, dev_fd, rc, i;
>>   	struct loop_info loopinfo;
>> @@ -82,10 +82,10 @@ static int find_free_loopdev(void)
>>   		if (rc>= 0) {
>>   			set_dev_path(rc);
>>   			tst_resm(TINFO, "Found free device '%s'", dev_path);
>> -			return 0;
>> +			return rc;
>>   		}
>>   		tst_resm(TINFO, "Couldn't find free loop device");
>> -		return 1;
>> +		return -1;
>>   	}
>>
>>   	switch (errno) {
>> @@ -121,7 +121,7 @@ static int find_free_loopdev(void)
>>   				continue;
>>   			tst_resm(TINFO, "Found free device '%s'", dev_path);
>>   			close(dev_fd);
>> -			return 0;
>> +			return i;
>>   		}
>>
>>   		close(dev_fd);
>> @@ -129,7 +129,7 @@ static int find_free_loopdev(void)
>>
>>   	tst_resm(TINFO, "No free devices found");
>>
>> -	return 1;
>> +	return -1;
>>   }
> This needs more changes than this.
>
> The problem here is that the function modifies dev_path which is
> returned by tst_acquire_device() so if you call this function after
> tst_acquire_device() it will rewrite the dev_path which means that the
> test would end up with wrong device path in tst_device->dev.
>
> I guess that the easiest solution would be changing the function to get
> buffer parameter which, when non-NULL, is filled with the path.
>
> I.e. the function prototype would became:
>
> int tst_find_free_loopdev(char *path, size_t path_len);
>
> And we would pass the dev_path inside of the tst_device.c and NULL from
> the copy_file_range() tests.
Hi Cyril

This is a good comment. But I doubt why we don't use a set_devpath_flag todistinguish it.
Or you have a future plan(in different directory ,/dev,/dev/loop/,/dev/block)?

Thanks
Yang Xu





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
