Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4792F41B7
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 03:23:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AC913C645A
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 03:23:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 58D143C25EF
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 03:23:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id DEA8C10005C0
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 03:23:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103424711"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 10:23:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7789E4CE6031;
 Wed, 13 Jan 2021 10:23:21 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 10:23:20 +0800
Message-ID: <5FFE59B2.1040903@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 10:23:46 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210112193039.12506-1-pvorel@suse.cz>
In-Reply-To: <20210112193039.12506-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7789E4CE6031.A980E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] Build fix undefined struct file_handle
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

Hi Petr
I think detecting file_handle struct(it is in fcntl.h) in configure.ac 
is correct instead of using HAVE_NAME_TO_HANDLE_AT macro directly.

Best Regards
Yang Xu
> Hi all,
>
> this would be great to get merged before release.
>
> Kind regards,
> Petr
>
> Petr Vorel (3):
>    lapi: Move struct file_handle into lapi/fcntl.h
>    fanotify: Fix build on undefined struct file_handle
>    syscalls: Remove unused include<fcntl.h>
>
>   include/lapi/fcntl.h                                   | 10 ++++++++++
>   include/lapi/name_to_handle_at.h                       |  9 +--------
>   testcases/kernel/syscalls/fanotify/fanotify.h          |  2 +-
>   testcases/kernel/syscalls/fanotify/fanotify09.c        |  1 -
>   testcases/kernel/syscalls/fanotify/fanotify13.c        |  1 -
>   testcases/kernel/syscalls/fanotify/fanotify15.c        |  1 -
>   testcases/kernel/syscalls/fanotify/fanotify16.c        |  1 -
>   .../syscalls/name_to_handle_at/name_to_handle_at01.c   |  1 -
>   .../syscalls/name_to_handle_at/name_to_handle_at02.c   |  1 -
>   .../syscalls/open_by_handle_at/open_by_handle_at01.c   |  1 -
>   .../syscalls/open_by_handle_at/open_by_handle_at02.c   |  1 -
>   11 files changed, 12 insertions(+), 17 deletions(-)
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
