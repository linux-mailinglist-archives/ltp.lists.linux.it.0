Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5112258C1
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:39:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BE4C3C2834
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:39:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0D45B3C12A0
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:39:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C93AF1400551
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:39:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96607480"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 15:39:00 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 3658D4CE1505
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 15:38:56 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 15:38:59 +0800
To: <ltp@lists.linux.it>
References: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <5e26cf6b-f579-93e2-bb85-f1a2f63b3cc1@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 15:38:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595230227-21468-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 3658D4CE1505.AB888
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 0/3] increase msgrcv coverage
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

HI!

This patchset is based on my previous msgrcv cleanup patch.
https://patchwork.ozlabs.org/project/ltp/patch/1594962618-26004-1-git-send-email-xuyang2018.jy@cn.fujitsu.com/

> 1. The first patch add check for msg_lrpid and msg_rtime.
> 2. The second patch tests different msgtyp.
> 3. The third patch tests MSG_COPY flag(basic error test),not functional
> test because kernel selftest[1] has tested this.
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/ipc/msgque.c
> 
> Yang Xu (3):
>    syscalls/msgrcv: Add check for msg_lrpid and msg_rtime
>    syscalls/msgrcv07: Add different msgtyp test
>    syscalls/msgrcv09: Add error test for MSG_COPY flag
> 
>   include/lapi/msg.h                            | 15 +++
>   runtest/syscalls                              |  1 +
>   runtest/syscalls-ipc                          |  1 +
>   .../kernel/syscalls/ipc/msgrcv/.gitignore     |  1 +
>   .../kernel/syscalls/ipc/msgrcv/msgrcv01.c     | 28 +++++-
>   .../kernel/syscalls/ipc/msgrcv/msgrcv07.c     | 81 +++++++++++++++-
>   .../kernel/syscalls/ipc/msgrcv/msgrcv09.c     | 93 +++++++++++++++++++
>   7 files changed, 215 insertions(+), 5 deletions(-)
>   create mode 100644 include/lapi/msg.h
>   create mode 100644 testcases/kernel/syscalls/ipc/msgrcv/msgrcv09.c
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
