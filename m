Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A776310606
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 08:44:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF1203C70D4
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 08:44:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BBC4B3C2EC6
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 08:44:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A1F3A1A010EA
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 08:44:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="104235057"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 15:44:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 319144CE6D8D;
 Fri,  5 Feb 2021 15:44:42 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 15:44:42 +0800
Message-ID: <601CF76D.8020705@cn.fujitsu.com>
Date: Fri, 5 Feb 2021 15:44:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2f_mvjt4couA++RcOf9bAMO8fnqapkgG59Qvs9Ud-2SHw@mail.gmail.com>
In-Reply-To: <CAEemH2f_mvjt4couA++RcOf9bAMO8fnqapkgG59Qvs9Ud-2SHw@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 319144CE6D8D.AA636
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/5] tst_mallinfo.c: Add a common print helper
 for mallinfo
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

Hi Li
> Hi Xu,
>
> Thanks for your work.
>
>     --- /dev/null
>     +++ b/include/tst_mallinfo.h
>
>
> Do we really need to export this function into the LTP library?
> (I assumed no other tests will using this lib function anymore)
Maybe we can add tst_print_mallinfo2 in the future and mallinfo2() case
can use this header.

>
> So I prefer to create a common header file as:
> ../syscalls/mallinfo/mallinfo_common.h,
> and just use it locally.
>
> If you're hoping mallopt01.c also benefits from it, only need to
> build something like mallinfo_commo.o via Makefile and include
> it in mallopt01.c by "../mallinfo/mallinfo_common.h".
Just want to avoid random makefile. I am not sure which way is better. 
Let's listen advise from other maintainers.
>
> --
> Regards,
> Li Wang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
