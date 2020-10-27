Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 158AC29AD5B
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:32:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D10403C55FE
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 14:32:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 244213C23B8
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:32:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 10928600F30
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 14:32:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,424,1596470400"; d="scan'208";a="100558275"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 21:32:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5FEB248990D2;
 Tue, 27 Oct 2020 21:32:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 21:32:42 +0800
Message-ID: <5F982179.1070804@cn.fujitsu.com>
Date: Tue, 27 Oct 2020 21:32:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5FEB248990D2.AE71D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.8 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/19] Unify error handling in LTP library
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

Hi Martin

I have seen the patchset and send some comments on 2,3,5,11 patch,
for the patchset,  you can add Acked-by.
Acked-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>


Best Regard
Yang Xu
> LTP helper functions, mainly safe syscalls, often report two different source
> code locations in error messages and sometimes handle syscall return values
> incorrectly. This patchset unifies source code location formatting to only
> show the calling line in the test program and fixes invalid return value
> handling. Safe syscalls now make pedantic distinction between common errors
> and invalid return values where applicable.
>
> Some safe syscalls returned no value so they were not usable in test cleanup.
> This is also fixed along with potential control flow issues when tst_brk()
> does not immediately terminate the program.
>
> Martin Doucha (19):
>    Unify error handling in lib/tst_safe_macros.c
>    Unify error handling in lib/tst_safe_sysv_ipc.c
>    Unify error handling in lib/tst_safe_timerfd.c
>    Unify error handling in lib/safe_file_ops.c
>    Unify error handling in lib/safe_macros.c
>    Unify error handling in lib/safe_net.c
>    Unify error handling in lib/safe_stdio.c
>    Unify error handling in lib/tst_mkfs.c
>    Unify error handling in lib/tst_checkpoint.c
>    Unify error handling in lib/tst_net.c
>    Unify error handling in lib/tst_fs_setup.c
>    Unify error handling in include/tst_safe_clocks.h
>    Move executable code out of tst_safe_macros.h
>    Unify error handling in moved functions
>    Unify error handling in include/tst_safe_macros.h
>    Unify error handling in include/tst_safe_posix_ipc.h
>    Unify error handling in include/tst_safe_prw.h
>    Unify error handling in lib/tst_resource.c
>    Unify error handling in include/lapi/safe_rt_signal.h
>
>   include/lapi/safe_rt_signal.h |  25 +-
>   include/safe_file_ops_fn.h    |   8 +-
>   include/tst_safe_clocks.h     |  48 ++-
>   include/tst_safe_macros.h     | 130 ++++----
>   include/tst_safe_posix_ipc.h  |   6 +-
>   include/tst_safe_prw.h        |  16 +-
>   lib/safe_file_ops.c           | 207 +++++++-----
>   lib/safe_macros.c             | 602 ++++++++++++++++++++++------------
>   lib/safe_net.c                | 262 +++++++++------
>   lib/safe_stdio.c              |  34 +-
>   lib/tst_checkpoint.c          |  23 +-
>   lib/tst_fs_setup.c            |   8 +-
>   lib/tst_mkfs.c                |  36 +-
>   lib/tst_net.c                 |   9 +-
>   lib/tst_resource.c            |   9 +-
>   lib/tst_safe_macros.c         | 201 ++++++++++--
>   lib/tst_safe_sysv_ipc.c       |  79 +++--
>   lib/tst_safe_timerfd.c        |  32 +-
>   18 files changed, 1100 insertions(+), 635 deletions(-)
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
