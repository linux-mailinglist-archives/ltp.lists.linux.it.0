Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9BF1719F0
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 14:49:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0174B3C24B8
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 14:49:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 427073C20BC
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 14:49:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 42FF51000CA5
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 14:49:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A018AACF2
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 13:49:25 +0000 (UTC)
Date: Thu, 27 Feb 2020 14:49:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Message-ID: <20200227134924.GB24778@rei>
References: <20200226172620.29815-1-cfamullaconrad@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226172620.29815-1-cfamullaconrad@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Stringify flags to improve error msg of
 unshare()
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
> If your test has multiple calls of unshare() it is hard to read which
> unshare() call really failed. With this we improve the error message to
> something like this:
> 
>   sendmsg03.c:43: CONF: unshare(CLONE_NEWUSER) unsupported: EINVAL (22)
> 
> Instead of having a hard to understand number like:
> 
>   sendmsg03.c:43: CONF: unshare(268435456) unsupported: EINVAL (22)
> 
> Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
> ---
>  include/tst_safe_macros.h | 5 +++--
>  lib/tst_safe_macros.c     | 7 ++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 80c4d9cb9..f2f8bd10f 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -544,7 +544,8 @@ int safe_personality(const char *filename, unsigned int lineno,
>  	}							\
>  	} while (0)
>  
> -void safe_unshare(const char *file, const int lineno, int flags);
> -#define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
> +void safe_unshare(const char *file, const int lineno, const char *flags_str,
> +	int flags);
> +#define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, #flags, (flags))

I would actually prefer to have a lookup table instead, because this
breaks when pass flags by a variable, e.g.

	int ns_flags = CLONE_NEWNS | CLONE_NEWPID;

	SAFE_UNSHARE(ns_flags);


Looking that the flags, these are bigflags, which makes it a bit tricky,
so we will have to write it as:

void get_ns_flags(int flags, char *flags, size_t flags_size)
{
	int first = 1;

	if (flags & CLONE_VM)
		append_flags("CLONE_VM", &first, &flags, &flags_size);

	if (flags & CLONE_FS)
		append_flags("CLONE_FS", &first, &flags, &flags_size);

	...
}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
