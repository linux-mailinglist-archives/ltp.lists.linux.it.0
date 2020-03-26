Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F409819394B
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 08:08:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88ACC3C4AD8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 08:08:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4A8C33C3363
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:08:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1DAAA1A008AC
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:08:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 701D6ABE7
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 07:08:25 +0000 (UTC)
Date: Thu, 26 Mar 2020 08:08:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200326070808.GB17560@dell5510>
References: <20200319162114.3967-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319162114.3967-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE 2018-1000199
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

> +++ b/include/tst_safe_ptrace.h
...
> +long tst_safe_ptrace(const char *file, const int lineno,
> +	enum __ptrace_request req, pid_t pid, void *addr, void *data);
enum __ptrace_request is glibc/uclibc specific (musl and bionic don't have it).
Can we just use int?

> +#define SAFE_PTRACE(req, pid, addr, data) \
> +	tst_safe_ptrace(__FILE__, __LINE__, req, pid, addr, data)
> +
> +#endif /* TST_SAFE_PTRACE_H_ */
> diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
> index f5413a18e..5769b5068 100644
> --- a/lib/tst_safe_macros.c
> +++ b/lib/tst_safe_macros.c
> @@ -14,6 +14,7 @@
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
>  #include "tst_safe_macros.h"
> +#include "tst_safe_ptrace.h"
>  #include "lapi/personality.h"

>  int safe_setpgid(const char *file, const int lineno, pid_t pid, pid_t pgid)
> @@ -202,3 +203,21 @@ void safe_unshare(const char *file, const int lineno, int flags)
>  		}
>  	}
>  }
> +
> +long tst_safe_ptrace(const char *file, const int lineno,
> +	enum __ptrace_request req, pid_t pid, void *addr, void *data)
And here.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
