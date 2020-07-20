Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D122583D
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:14:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C28383C2834
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 09:14:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 083C63C097D
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:14:12 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B0163100095B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 09:14:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96606132"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 15:14:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id ED5AF4CE5059;
 Mon, 20 Jul 2020 15:14:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 15:14:09 +0800
To: Cyril Hrubis <chrubis@suse.cz>, <ltp@lists.linux.it>
References: <20200717163453.9587-1-chrubis@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <432e05a0-985a-3fbb-9578-45b7019464c1@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 15:14:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717163453.9587-1-chrubis@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: ED5AF4CE5059.AFE95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/9] Rewrite shmctl() testcases
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

Hi Cyril


> This patchset mostly rewrites old shmctl testcases from scratch and also
> increases the coverage at least threefold.
> 
> There are still missing pieces though, there are no test that would
> check that shm_atime and shm_dtime are valid as well as shm_lpid as well
> as the coverage of ipc_perm is still lacking and should be added later
> on.
It seems that we miss shm_next_id. Also for msg_next_id, sem_next_id in ltp.
> 
> Cyril Hrubis (9):
>    syscalls/ipc: shmctl02: Convert to the new library
>    syscalls/ipc: shmctl03: Remove.
>    syscalls/ipc: shmctl04: Rewrite from scratch.
>    syscalls/ipc: shmctl05 remove lib dependency
>    lib/tst_assert: Add TST_ASSERT_ULONG()
>    syscalls/ipc: Add shmctl() IPC_INFO test
>    syscalls/ipc: Add shmctl07 test
>    syscalls/ipc: Add shmctl IPC_SET test
>    syscalls/ipc: Rewrite shmctl01
> 
>   include/tst_assert.h                          |   9 +
>   lib/tst_assert.c                              |  14 +
>   runtest/syscalls                              |   2 +
>   runtest/syscalls-ipc                          |   2 +
>   .../kernel/syscalls/ipc/shmctl/.gitignore     |   2 +
>   testcases/kernel/syscalls/ipc/shmctl/Makefile |   3 +-
>   .../kernel/syscalls/ipc/shmctl/shmctl01.c     | 586 ++++++------------
>   .../kernel/syscalls/ipc/shmctl/shmctl02.c     | 263 +++-----
>   .../kernel/syscalls/ipc/shmctl/shmctl03.c     | 214 +------
>   .../kernel/syscalls/ipc/shmctl/shmctl04.c     | 190 +++---
>   .../kernel/syscalls/ipc/shmctl/shmctl07.c     |  66 ++
>   .../kernel/syscalls/ipc/shmctl/shmctl08.c     | 101 +++
>   12 files changed, 593 insertions(+), 859 deletions(-)
>   create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
>   create mode 100644 testcases/kernel/syscalls/ipc/shmctl/shmctl08.c
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
