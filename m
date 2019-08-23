Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7339A85E
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:14:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8594D3C1D47
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 09:14:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AD26B3C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:13:56 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 79BFF14019CB
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 09:13:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,420,1559491200"; d="scan'208";a="74148893"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 15:13:51 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 7DF4A4CE03EB;
 Fri, 23 Aug 2019 15:13:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 23 Aug 2019 15:13:44 +0800
Message-ID: <5D5F922B.1050506@cn.fujitsu.com>
Date: Fri, 23 Aug 2019 15:13:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <1566541374-2225-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2fT1_ATcKB5bD9OvsnJP1vsRbib_MGyB1Bk_U=Ccd1VVg@mail.gmail.com>
In-Reply-To: <CAEemH2fT1_ATcKB5bD9OvsnJP1vsRbib_MGyB1Bk_U=Ccd1VVg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 7DF4A4CE03EB.AE166
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: use .needs_tmpdir and
 MAX_LEN
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2019/08/23 14:55, Li Wang wrote:
> Hi Xu,
>
> Seems you have to apply Petr's patch first, then do a new
> modification. Because that patch fixes another compiling issue.
>
> [1] http://lists.linux.it/pipermail/ltp/2019-August/013239.html
Hi Li


Petr' patch looks ok but I don't know why it isn't merged on master branch.

I am not sure Petr's patch whether having the next version, so I don't rebase it.

IMO, merge Petr's patch then I rebase it. Or Merge my patch then Petr rebases it.
It depends on ltp community.


Thanks
Yang Xu

> --
> Regards,
> Li Wang
>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
