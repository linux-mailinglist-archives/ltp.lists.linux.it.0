Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B475425AA6A
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 13:40:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 315FF3C5547
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Sep 2020 13:40:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F01B03C180A
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 13:39:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 89D9A6008DB
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 13:39:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C90FEB6EE
 for <ltp@lists.linux.it>; Wed,  2 Sep 2020 11:39:57 +0000 (UTC)
Date: Wed, 2 Sep 2020 13:39:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200902113954.GA22722@dell5510>
References: <20200825160735.24602-1-mdoucha@suse.cz>
 <20200825160735.24602-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825160735.24602-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] Add SAFE_SYSINFO() macro
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Changes since v1: New patch

>  include/tst_safe_macros.h |  5 +++++
>  lib/safe_macros.c         | 20 ++++++++++++++++++++
>  2 files changed, 25 insertions(+)

> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 000381c4f..053c3bcf9 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -12,6 +12,7 @@
>  #include <sys/resource.h>
>  #include <sys/stat.h>
>  #include <sys/vfs.h>
> +#include <sys/sysinfo.h>
>  #include <fcntl.h>
>  #include <libgen.h>
>  #include <signal.h>
> @@ -598,4 +599,8 @@ long tst_safe_ptrace(const char *file, const int lineno, int req, pid_t pid,
>  #define SAFE_PTRACE(req, pid, addr, data) \
>  	tst_safe_ptrace(__FILE__, __LINE__, req, pid, addr, data)

> +int safe_sysinfo(const char *file, const int lineno, struct sysinfo *info);
> +#define SAFE_SYSINFO(info) \
> +	safe_sysinfo(__FILE__, __LINE__, (info))
> +
>  #endif /* SAFE_MACROS_H__ */
> diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> index dde9b7b5e..5ef9ee1c5 100644
> --- a/lib/safe_macros.c
> +++ b/lib/safe_macros.c
> @@ -11,6 +11,7 @@
>  #include <sys/wait.h>
>  #include <sys/mount.h>
>  #include <sys/xattr.h>
> +#include <sys/sysinfo.h>
>  #include <errno.h>
>  #include <fcntl.h>
>  #include <libgen.h>
> @@ -1088,3 +1089,22 @@ int safe_mincore(const char *file, const int lineno, void *start,

>  	return rval;
>  }
> +
> +int safe_sysinfo(const char *file, const int lineno, struct sysinfo *info)
> +{
> +	int ret;
> +
> +	errno = 0;
> +	ret = sysinfo(info);
> +
> +	if (ret == -1) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
> +			"sysinfo() failed");
> +	} else if (ret) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
> +			"Invalid sysinfo() return value %d", ret);
nit: unneeded line below.
> +
> +	}
Man page mentions only 0 and -1. Sure, it does not harm to test ret > 0, I just
wonder if it's needed.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> +
> +	return ret;
> +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
