Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D062F261A
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D41D3C6C90
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 03:12:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 900873C313B
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:08 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 26CDA6014E3
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 03:12:06 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,340,1602518400"; d="scan'208";a="103381934"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jan 2021 10:12:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 03AC44CE6035;
 Tue, 12 Jan 2021 10:12:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 Jan 2021 10:12:01 +0800
Message-ID: <5FFD058A.5050104@cn.fujitsu.com>
Date: Tue, 12 Jan 2021 10:12:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>, Radoslav Kolev <radoslav.kolev@suse.com>
References: <20201215155650.6496-1-radoslav.kolev@suse.com>
 <5FD96C97.6020602@cn.fujitsu.com>
 <c6340b4dc96458ddd972beb28059324d44f44a99.camel@suse.com>
 <5FD9C58B.9020807@cn.fujitsu.com> <X/SEt8EfjP+w4EYw@yuki.lan>
In-Reply-To: <X/SEt8EfjP+w4EYw@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 03AC44CE6035.AD3FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

Hi Radoslav
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
Thanks for this patch, merged.

Best Regards
Yang Xu
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
