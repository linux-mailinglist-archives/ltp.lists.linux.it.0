Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E791F4ACA
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 03:19:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E98E3C027A
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 03:19:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 45DCF3C020C
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 03:19:37 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 1B7E320039E
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 03:19:35 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,494,1583164800"; d="scan'208";a="94208681"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jun 2020 09:19:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4F86850A999D;
 Wed, 10 Jun 2020 09:19:28 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Jun 2020 09:19:27 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
 <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
 <1837993622.15296660.1591697802060.JavaMail.zimbra@redhat.com>
 <96ba542d-4ec7-bc5d-41d9-f533952f94cd@cn.fujitsu.com>
 <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <716f9011-97d8-ee14-c28a-5beb2f17a9b9@cn.fujitsu.com>
Date: Wed, 10 Jun 2020 09:19:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4F86850A999D.ACFAF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Get the logic_block_size
 dynamically
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

Hi Jan


> 
> 
> ----- Original Message -----
>>>>> Would BLKSSZGET work? It returns bdev_logical_block_size().
>>>>
>>>> But it needs a blockdev, in user space, we can specify bdev, but how can
>>>> we
>>>> figure out this inode->i_sb->s_bdev block dev.
>>>
>>> Isn't that the block device "test.img" is on?
>> Do you mean the test.img belong to some block dev, such as /dev/sda1 or
>> our mounted block_dev? If so, I think it is.
> 
> The former. Say if test.img is in /tmp, then I'd assume "s_bdev" is
> /dev/mapper/rhel-root (/dev/dm-0)
> 
> $ df -T /tmp/test.img
> Filesystem            Type 1K-blocks     Used Available Use% Mounted on
> /dev/mapper/rhel-root xfs   66789516 33211340  33578176  50% /
I try this, it is ok on my machine. I will send a v2 patch by using 
BLKSSZGET.
> 
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
