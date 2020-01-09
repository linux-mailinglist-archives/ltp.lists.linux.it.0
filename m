Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2908713546C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:35:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE1A93C24E9
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:35:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E36213C1CBB
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:35:41 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 370BE1401FB4
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:35:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,413,1571673600"; d="scan'208";a="81529516"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jan 2020 16:35:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 82A984CE20DE;
 Thu,  9 Jan 2020 16:26:34 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 9 Jan 2020 16:35:34 +0800
To: Cyril Hrubis <chrubis@suse.cz>, <sumit.garg@linaro.org>
References: <1578299418-4961-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200108131231.GA23619@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <bee8d39f-723f-491d-8676-a1c303f0a5bb@cn.fujitsu.com>
Date: Thu, 9 Jan 2020 16:35:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200108131231.GA23619@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 82A984CE20DE.AF259
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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

Hi
> Hi!
>> Now, tst_dev_bytes_written api can get the whole disk stat correctly(such as /dev/sda),
>> but can not get partition stat correctly(such as /dev/sda5).
>> fail as below:
>> export LTP_DEV=/dev/sda5
>> tst_device.c:388: CONF: Test device stat file: /sys/block/sda5/stat not found
> 
> It seems that in case of partitions the stat file is available under
> /sys/block/sda/sda5/stat.
> 
> For NVME it's similar as:
> 
> /sys/block/nvme0n1/nvme0n1p1/stat
> 
> I do wonder if it wouldn't be easier to try to match the prefix of the
> device name first, then try a directory with a full name after that.
Maybe, I am fine with your way(I tested it). I only  refer to kernel 
documention [1] .sysfs and proc file  use the same source for the 
information and so should not differ. So I use fixed format as kernel 
function to exact.  Also, I want to listen advise from Sumit.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/iostats.rst

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
