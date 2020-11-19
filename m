Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 523BF2B8FFA
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:16:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F0ED3C59EF
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:16:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E7BC33C302E
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:16:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BC311000A22
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:16:07 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7B6BAC24
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 10:16:06 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:16:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201119101655.GC2785@yuki.lan>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113164944.26101-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/5] fanotify: Handle supported features checks
 in setup()
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

Hi!
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify07.c b/testcases/kernel/syscalls/fanotify/fanotify07.c
> index c2e185710..f4e8ac9e6 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify07.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify07.c
> @@ -195,6 +195,8 @@ static void test_fanotify(void)
>  
>  static void setup(void)
>  {
> +	fanotify_access_permissions_supported_by_kernel();
> +
>  	sprintf(fname, "fname_%d", getpid());
>  	SAFE_FILE_PRINTF(fname, "%s", fname);
>  }

Shouldn't we drop the check for EINVAL in setup_instance() as well?

> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 90cf5cb5f..b95efb998 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -64,6 +64,7 @@ static unsigned int fanotify_class[] = {
>  static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
>  
>  static char event_buf[EVENT_BUF_LEN];
> +static int support_exec_events;
>  
>  #define MOUNT_PATH "fs_mnt"
>  #define MNT2_PATH "mntpoint"
> @@ -451,6 +452,11 @@ static void test_fanotify(unsigned int n)
>  
>  	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
>  
> +	if (support_exec_events != 0 && tc->expected_mask_with_ignore & FAN_OPEN_EXEC) {
> +		tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC not supported in kernel?");
> +		return;
> +	}
> +

Maybe we should rename the variable to "exec_events_unsupported" then
we could write:

	if (exec_events_unsupported && tc->mask & FAM_OPEN_EXEC)

Which is a bit easier to understand.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
