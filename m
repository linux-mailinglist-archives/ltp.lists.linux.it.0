Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E619252F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:12:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C55603C4BDA
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 11:12:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CA1353C0358
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:12:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 71966601AED
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 11:12:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C02AEAC66
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:12:10 +0000 (UTC)
Date: Wed, 25 Mar 2020 11:12:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jozef Pupava <jpupava@suse.cz>
Message-ID: <20200325101209.GC5404@yuki.lan>
References: <20200325110148.07f0a740@daedruan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325110148.07f0a740@daedruan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Replace deprecated <strings.h> with <string.h>
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
> Closes: #521
> 
> Signed-off-by: Jozef Pupava <jpupava@suse.com>
> ---
>  testcases/kernel/containers/share/ns_create.c                           | 2 +-
>  testcases/kernel/fs/fsx-linux/fsx-linux.c                               | 2 +-
>  .../open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c     | 2 +-
>  .../open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/testcases/kernel/containers/share/ns_create.c b/testcases/kernel/containers/share/ns_create.c
> index 1d0339e71..4a4007c3a 100644
> --- a/testcases/kernel/containers/share/ns_create.c
> +++ b/testcases/kernel/containers/share/ns_create.c
> @@ -30,7 +30,7 @@
>  #include <sys/stat.h>
>  #include <unistd.h>
>  #include <string.h>
> -#include <strings.h>
> +#include <string.h>

The string.h include is already there, so we just need to delete it
here.

>  #include <errno.h>
>  #include "test.h"
>  #include "lapi/namespaces_constants.h"
> diff --git a/testcases/kernel/fs/fsx-linux/fsx-linux.c b/testcases/kernel/fs/fsx-linux/fsx-linux.c
> index 02f3eb827..4a20f4da6 100644
> --- a/testcases/kernel/fs/fsx-linux/fsx-linux.c
> +++ b/testcases/kernel/fs/fsx-linux/fsx-linux.c
> @@ -43,7 +43,7 @@
>  #include <sys/param.h>
>  #include <limits.h>
>  #include <time.h>
> -#include <strings.h>
> +#include <string.h>
>  #include <sys/time.h>
>  #endif
>  #include <fcntl.h>
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
> index dd42bbd91..97bdbff5d 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
> @@ -20,7 +20,7 @@
>  #endif
>  #include <semaphore.h>
>  #include <stdio.h>
> -#include <strings.h>
> +#include <string.h>
>  #include <time.h>
>  #include <unistd.h>
>  #include "posixtest.h"
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
> index 79de0af7f..da2cd3084 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
> @@ -21,7 +21,7 @@
>  #endif
>  #include <semaphore.h>
>  #include <stdio.h>
> -#include <strings.h>
> +#include <string.h>
>  #include <time.h>
>  #include <unistd.h>
>  #include "posixtest.h"

As far as I can tell there are no string functions used in the
sem_timedwait() tests, so we can as well just remove the include in
these two.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
