Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA412F4755
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:17:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D1DB3C5DC2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:17:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4C91B3C0548
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:17:06 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 18A9C1A00248
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:17:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103439201"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 17:17:02 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 34CAF4CE602D;
 Wed, 13 Jan 2021 17:16:59 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 17:16:58 +0800
Message-ID: <5FFEBA89.5040001@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 17:16:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210113075110.31628-1-pvorel@suse.cz>
 <20210113075110.31628-4-pvorel@suse.cz>
In-Reply-To: <20210113075110.31628-4-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 34CAF4CE602D.AA0AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls: Remove unused include <fcntl.h>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2021/1/13 15:51, Petr Vorel wrote:
> Tests should always use lapi/fcntl.h instead of <fcntl.h> to fix
> possible missing definitions.
>
> But in this case removing include, because fanotify tests include
> <fcntl.h> in lapi/fcntl.h (via fanotify.h) and
> {name_to,open_by}_handle_at tests include lapi/fcntl.h in
> lapi/name_to_handle_at.h.
Hi Petr,

This patchset looks good to me.
Reviewed-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Only one monir question:
Why do we remove <fcntl.h> header for all fanotify tests?
Of course, just four fanotify tests take use of struct file_handle.

Best Regards,
Xiao Yang
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/fanotify/fanotify09.c                  | 1 -
>  testcases/kernel/syscalls/fanotify/fanotify13.c                  | 1 -
>  testcases/kernel/syscalls/fanotify/fanotify15.c                  | 1 -
>  testcases/kernel/syscalls/fanotify/fanotify16.c                  | 1 -
>  .../kernel/syscalls/name_to_handle_at/name_to_handle_at01.c      | 1 -
>  .../kernel/syscalls/name_to_handle_at/name_to_handle_at02.c      | 1 -
>  .../kernel/syscalls/open_by_handle_at/open_by_handle_at01.c      | 1 -
>  .../kernel/syscalls/open_by_handle_at/open_by_handle_at02.c      | 1 -
>  8 files changed, 8 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
> index 30e212f44..918e40274 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -30,7 +30,6 @@
>  #include <stdio.h>
>  #include <sys/stat.h>
>  #include <sys/types.h>
> -#include <fcntl.h>
>  #include <errno.h>
>  #include <string.h>
>  #include <sys/mount.h>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
> index c9cf10555..6d812cdd1 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify13.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
> @@ -21,7 +21,6 @@
>  #include <sys/statfs.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> -#include <fcntl.h>
>  #include <errno.h>
>  #include <unistd.h>
>  #include "tst_test.h"
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
> index ba8259c7c..fe143823e 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify15.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
> @@ -19,7 +19,6 @@
>  
>  #include <string.h>
>  #include <errno.h>
> -#include <fcntl.h>
>  #include <sys/statfs.h>
>  #include <sys/types.h>
>  #include "tst_test.h"
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
> index 5ffaec92f..c4b8a5abc 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify16.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
> @@ -18,7 +18,6 @@
>  #include <stdio.h>
>  #include <sys/stat.h>
>  #include <sys/types.h>
> -#include <fcntl.h>
>  #include <errno.h>
>  #include <string.h>
>  #include <sys/mount.h>
> diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
> index 84ac32eab..1ac9d8214 100644
> --- a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
> +++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
> @@ -15,7 +15,6 @@
>  \*/
>  
>  #define _GNU_SOURCE
> -#include <fcntl.h>
>  #include <sys/stat.h>
>  #include "lapi/name_to_handle_at.h"
>  
> diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
> index 7c0d57485..020b25531 100644
> --- a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
> +++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
> @@ -10,7 +10,6 @@
>  \*/
>  
>  #define _GNU_SOURCE
> -#include <fcntl.h>
>  #include "lapi/name_to_handle_at.h"
>  
>  #define TEST_FILE "test_file"
> diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
> index c1b08f1b8..0d09e1ed8 100644
> --- a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
> +++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
> @@ -15,7 +15,6 @@
>  \*/
>  
>  #define _GNU_SOURCE
> -#include <fcntl.h>
>  #include <sys/stat.h>
>  #include "lapi/name_to_handle_at.h"
>  
> diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
> index 3c8f06d85..0f60752c4 100644
> --- a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
> +++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
> @@ -10,7 +10,6 @@
>  \*/
>  #define _GNU_SOURCE
>  #include <linux/capability.h>
> -#include <fcntl.h>
>  #include "tst_capability.h"
>  #include "lapi/name_to_handle_at.h"
>  




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
