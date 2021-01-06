Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1C2EB805
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 03:18:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 652043C6FD7
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 03:18:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BDA0E3C54AC
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 03:18:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 54B0E140050F
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 03:18:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,478,1599494400"; d="scan'208";a="103221863"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jan 2021 10:18:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 74E994CE601C;
 Wed,  6 Jan 2021 10:18:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 6 Jan 2021 10:18:15 +0800
Message-ID: <5FF51DDD.3080709@cn.fujitsu.com>
Date: Wed, 6 Jan 2021 10:18:05 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>, Amir Goldstein <amir73il@gmail.com>
References: <20201215155650.6496-1-radoslav.kolev@suse.com>
 <5FD96C97.6020602@cn.fujitsu.com>
 <c6340b4dc96458ddd972beb28059324d44f44a99.camel@suse.com>
 <5FD9C58B.9020807@cn.fujitsu.com> <X/SEt8EfjP+w4EYw@yuki.lan>
In-Reply-To: <X/SEt8EfjP+w4EYw@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 74E994CE601C.A008D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05.c: skip test on overlay
 filesystem
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
Cc: Radoslav Kolev via ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril
> Hi!
>> diff --git a/lib/tst_device.c b/lib/tst_device.c
>> index c096b418b..de64fd908 100644
>> --- a/lib/tst_device.c
>> +++ b/lib/tst_device.c
>> @@ -534,6 +534,10 @@ void tst_find_backing_dev(const char *path, char *dev)
>>           if (stat(dev,&buf)<  0)
>>                   tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
>>
>> -       if (S_ISBLK(buf.st_mode) != 1)
>> -               tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
>> +       if (S_ISBLK(buf.st_mode) != 1) {
>> +               if (tst_is_mounted(dev))
>> +                       tst_find_backing_dev(dev, dev);
>> +               else
>> +                       tst_brkm(TCONF, NULL, "dev(%s) isn't a block
>> dev", dev);
>> +       }
>>    }
>>
>> My test environment is that
>> /dev/sda10              20G  623M   18G   4% /mnt/xfstests/test
>> /mnt/xfstests/test      20G  623M   18G   4% /mnt/xfstests/test/ovl-mnt
>> /dev/sda11              20G   46M   19G   1% /mnt/xfstests/scratch
>> /mnt/xfstests/scratch   20G   46M   19G   1% /mnt/xfstests/scratch/ovl-mnt
>>
>> and my TMPDIR env is /mnt/xfstests/test/ovl-mnt.
>
> Does this code works for everyone or should we apply patch that disables
> the test on overlay so that it's fixed for next release?
I guess it is ok for everyone, but I want to listen some advise from 
Amir since he is an expert about overlay filesystem.

Hi Amir
   Currently, Radoslav reported ltp tst_find_backing_dev api (we prase 
/proc/self/mountinfo and use " - " to delim string and get the bdev 
value after two fileds.) can not find really block dev when using 
overlay filesystem. It fails because this api doesn't consider user 
layer filesystem(like overlay). I think we should call 
tst_find_backing_dev_api again if this dev variable is not block dev and 
it is a mountpoint. I use the above environment and it is ok.
Wha do you think about it?

Best Regards
Yang Xu

>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
