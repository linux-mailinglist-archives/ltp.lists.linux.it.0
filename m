Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C282E2AF153
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 13:57:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B63A3C5360
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 13:57:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AA4B13C2650
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 13:57:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 46C941400E01
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 13:57:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EB85ABD6
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 12:57:44 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:58:31 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201111125831.GC5870@yuki.lan>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-6-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026164756.30556-6-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 05/19] Unify error handling in lib/safe_macros.c
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
> @@ -255,10 +288,16 @@ ssize_t safe_read(const char *file, const int lineno, void (*cleanup_fn) (void),
>  	ssize_t rval;
>  
>  	rval = read(fildes, buf, nbyte);
> +
>  	if (rval == -1 || (len_strict && (size_t)rval != nbyte)) {
> -		tst_brkm(TBROK | TERRNO, cleanup_fn,
> -			 "%s:%d: read(%d,%p,%zu) failed, returned %zd",
> -			 file, lineno, fildes, buf, nbyte, rval);
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"read(%d,%p,%zu) failed, returned %zd", fildes, buf,
> +			nbyte, rval);
> +	}
> +	if (rval < 0) {
> +		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
> +			"Invalid read(%d,%p,%zu) return value %zd", fildes,
> +			buf, nbyte, rval);
>  	}

Shouldn't this be else if as well? Since otherwise we may generate two
warning messages if in cleanup() read() returns -1.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
