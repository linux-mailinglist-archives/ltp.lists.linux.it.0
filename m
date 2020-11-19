Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC02B8FC8
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:05:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D73073C4EE0
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:05:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BCFF33C2E8F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:05:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 79F17100092B
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:05:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C69E3AFFD
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 10:05:54 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:06:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201119100643.GB2785@yuki.lan>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113164944.26101-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] fanotify12: Drop incorrect hint
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
> hint "CONFIG_FANOTIFY_ACCESS_PERMISSIONS not configured in kernel?"
> is wrong here (fanotify12 does not use FAN_ACCESS_PERM).
> 
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/syscalls/fanotify/fanotify12.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
> index fcb7ec0d3..7f23fc9dc 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify12.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
> @@ -146,10 +146,6 @@ static int setup_mark(unsigned int n)
>  					"FAN_OPEN_EXEC not supported in "
>  					"kernel?");
>  				return -1;
> -			} else if (errno == EINVAL) {
> -				tst_brk(TCONF | TERRNO,
> -					"CONFIG_FANOTIFY_ACCESS_PERMISSIONS "
> -					"not configured in kernel?");
>  			}else {
>  				tst_brk(TBROK | TERRNO,
>  					"fanotify_mark(%d, FAN_MARK_ADD | %s, "

Looking at the source there is the same message just couple of lines
below this one, should we get rid of that one as well?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
