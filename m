Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF02150FF
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 03:45:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D3EF3C5549
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 03:45:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 16AE33C1E06
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 03:45:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B3CFB2005FD
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 03:45:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,318,1589212800"; d="scan'208";a="95795725"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Jul 2020 09:45:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 846394CE4B10
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 09:45:33 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 6 Jul 2020 09:45:36 +0800
To: <ltp@lists.linux.it>
References: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <e3919ef3-9219-d69c-d7e3-b24bccfeb518@cn.fujitsu.com>
Date: Mon, 6 Jul 2020 09:45:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1591871716-21250-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 846394CE4B10.AC7CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 0/4] *** Add LOOP_CONFIGURE ioctl test ***
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

Hi
ping.

> Since kernel commit[1], it has added LOOP_CONFIGURE ioctl test.
>  From this commit, loop_set_fd calls loop_configure with zero
> loop_config.
> 
> struct loop_config {
> 	__u32			fd;
> 	__u32                   block_size;
> 	struct loop_info64	info;
> 	__u64			__reserved[8];
> }
> 
> In addition to doing what LOOP_SET_STATUS can do, LOOP_CONFIGURE can
> also be used to:
> - Set the correct block size immediately by setting
>    loop_config.block_size (I test this in ioctl_loop08.c, like old
> ioctl_loop06.c)
> - Explicitly request direct I/O mode by setting LO_FLAGS_DIRECT_IO
>    in loop_config.info.lo_flags (I test this in ioctl_loop09.c, like old
> ioctl_loop05.c)
> - Explicitly request read-only mode by setting LO_FLAGS_READ_ONLY
>    in loop_config.info.lo_flags (I test this in old ioctl_loop02.c)
> 
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3448914e8cc550ba792d4ccc74471d1ca4293a
> 
> Yang Xu (4):
>    lapi: Add fallback for LOOP_CONFIGURE ioctl and struct loop_config
>    syscalls/ioctl_loop02: Using LOOP_CONFIGURE to set read_only
>    syscalls/ioctl_loop08: Add LOOP_CONFIGURE error test with invalid
>      block size
>    syscalls/ioctl_loop09: Add LOOP_CONFIGURE ioctl test with direct I/O
>      flag
> 
>   configure.ac                                  |   1 +
>   include/lapi/loop.h                           |  23 +++
>   runtest/syscalls                              |   2 +
>   testcases/kernel/syscalls/ioctl/.gitignore    |   2 +
>   .../kernel/syscalls/ioctl/ioctl_loop02.c      |  53 ++++--
>   .../kernel/syscalls/ioctl/ioctl_loop08.c      | 101 ++++++++++++
>   .../kernel/syscalls/ioctl/ioctl_loop09.c      | 151 ++++++++++++++++++
>   7 files changed, 324 insertions(+), 9 deletions(-)
>   create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop08.c
>   create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop09.c
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
