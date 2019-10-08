Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E704ACF773
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 12:50:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77EF23C1508
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Oct 2019 12:50:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 320B53C0B92
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 12:50:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9B68600BF3
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 12:49:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 171CBB0AE
 for <ltp@lists.linux.it>; Tue,  8 Oct 2019 10:50:26 +0000 (UTC)
Date: Tue, 8 Oct 2019 12:50:25 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191008105025.GB9170@rei.lan>
References: <20191008093218.15801-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008093218.15801-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getdents: Fix build under glibc 2.30
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
> glibc commit b8b3d5a14e ("Linux: Move getdents64 to <dirent.h>")
> moved the declaration from <unistd.h> to <dirent.h> to match the
> location of the declaration in musl.
> 
> Thus we need to include both <dirent.h> and <unistd.h> for getdents64().
> 
> Using getdents64() declaration requires on both glibc and musl
> _GNU_SOURCE definition, thus move it to to getdents.h.

I would rather go for _GNU_SOURCE being defined in the testcases rather
than hiding it in the getdenst.h header and depending on the order.

Other than that it's fine.

> Fixes: 587
> Reported-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> you might not like moving _GNU_SOURCE definition to the header, I can
> add the missing one in getdents01.c instead.
> 
> Travis: https://travis-ci.org/pevik/ltp/builds/595021543
> 
> Kind regards,
> Petr
> 
>  testcases/kernel/syscalls/getdents/getdents.h   | 2 ++
>  testcases/kernel/syscalls/getdents/getdents01.c | 3 ++-
>  testcases/kernel/syscalls/getdents/getdents02.c | 4 ++--
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
> index c24ed6c99..e43dacc15 100644
> --- a/testcases/kernel/syscalls/getdents/getdents.h
> +++ b/testcases/kernel/syscalls/getdents/getdents.h
> @@ -20,6 +20,7 @@
>  #ifndef GETDENTS_H
>  #define GETDENTS_H
>  
> +#define _GNU_SOURCE
>  #include <stdint.h>
>  #include "test.h"
>  #include "lapi/syscalls.h"
> @@ -54,6 +55,7 @@ struct linux_dirent64 {
>  };
>  
>  #if HAVE_GETDENTS64
> +#include <dirent.h>
>  #include <unistd.h>
>  #else
>  static inline int
> diff --git a/testcases/kernel/syscalls/getdents/getdents01.c b/testcases/kernel/syscalls/getdents/getdents01.c
> index 3962d960b..17a58731d 100644
> --- a/testcases/kernel/syscalls/getdents/getdents01.c
> +++ b/testcases/kernel/syscalls/getdents/getdents01.c
> @@ -19,6 +19,8 @@
>   * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
>  
> +#include "getdents.h"
> +
>  #include <stdio.h>
>  #include <errno.h>
>  #include <sys/types.h>
> @@ -27,7 +29,6 @@
>  
>  #include "test.h"
>  #include "safe_macros.h"
> -#include "getdents.h"
>  
>  static void cleanup(void);
>  static void setup(void);
> diff --git a/testcases/kernel/syscalls/getdents/getdents02.c b/testcases/kernel/syscalls/getdents/getdents02.c
> index 7b023c53f..c45812241 100644
> --- a/testcases/kernel/syscalls/getdents/getdents02.c
> +++ b/testcases/kernel/syscalls/getdents/getdents02.c
> @@ -33,7 +33,8 @@
>   *
>   */
>  
> -#define _GNU_SOURCE
> +#include "getdents.h"
> +
>  #include <stdio.h>
>  #include <errno.h>
>  #include <sys/types.h>
> @@ -41,7 +42,6 @@
>  #include <fcntl.h>
>  
>  #include "test.h"
> -#include "getdents.h"
>  #include "safe_macros.h"
>  
>  #define DIR_MODE	(S_IRUSR|S_IWUSR|S_IXUSR|S_IRGRP| \
> -- 
> 2.23.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
