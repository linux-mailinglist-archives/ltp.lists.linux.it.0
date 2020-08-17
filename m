Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609B245B27
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 05:46:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6EA03C304A
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 05:46:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8EB983C0489
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:46:54 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 471CA1000A61
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:46:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,322,1592841600"; d="scan'208";a="98142316"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Aug 2020 11:46:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7054F4CE34F5;
 Mon, 17 Aug 2020 11:46:46 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 17 Aug 2020 11:46:48 +0800
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>, Martin
 Doucha <mdoucha@suse.cz>
References: <20200806162356.16920-1-mdoucha@suse.cz>
 <752669298.7180757.1597047872449.JavaMail.zimbra@redhat.com>
 <CAEemH2cCq1LL_91pOavNWHmHGQs6EfFsyGXaOBuqh-CrFxP7Pg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <462582af-8a13-e5c1-a8f7-63a7e03571c7@cn.fujitsu.com>
Date: Mon, 17 Aug 2020 11:46:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2cCq1LL_91pOavNWHmHGQs6EfFsyGXaOBuqh-CrFxP7Pg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7054F4CE34F5.AE423
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Drop the mem01 test
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
Cc: Michal Hocko <mhocko@suse.com>, LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li


> 
> 
> On Mon, Aug 10, 2020 at 4:24 PM Jan Stancek <jstancek@redhat.com 
> <mailto:jstancek@redhat.com>> wrote:
> 
> 
>     ----- Original Message -----
>      > The mem01 test often fails on PPC systems mainly because it
>     doesn't take into
>      > account page sizes larger than 4KB. Test scenario review revealed
>     that it's
>      > not particularly useful because it doesn't have any more specific
>     goal than
>      > filling large amount of memory and the hardcoded allocation
>     limits are too
>      > low for modern and future systems. The useful part of this test
>     mostly
>      > overlaps with coverage by existing OOM tests.
>      >
>      > Signed-off-by: Martin Doucha <mdoucha@suse.cz
>     <mailto:mdoucha@suse.cz>>
> 
>     Acked-by: Jan Stancek <jstancek@redhat.com <mailto:jstancek@redhat.com>>
> 
> Pushed, thanks!
> 
[root@localhost ltp]# git grep mem01
testcases/kernel/syscalls/ioctl/ioctl_sg01.c: * a read-accessible 
SCSI-compatible device (e.g. SATA disk). Running mem01
[root@localhost ltp]#

ioctl_sg01.c has such description " Running mem01
  * test program before this one may increase the chance of successfully
  * reproducing the bug."

I guess we should also remove this or use oom testcases can also 
increase this rate(I don't try ).

Best Regards
Yang Xu
> 
> -- 
> Regards,
> Li Wang
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
