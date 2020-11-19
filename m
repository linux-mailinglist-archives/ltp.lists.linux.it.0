Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1102B9018
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:29:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B30413C4EEB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:29:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CEB4D3C2E4C
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:29:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76D791A00E3D
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:29:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01B2DAA4F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 10:29:57 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:30:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201119103045.GE2785@yuki.lan>
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-5-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201113164944.26101-5-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/5] fanotify: Check FAN_REPORT_{FID,
 NAME} support
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
> +int safe_fanotify_init(const char *file, const int lineno,
> +	unsigned int flags, unsigned int event_f_flags)
> +{
> +	int rval;
> +
> +#ifdef HAVE_SYS_FANOTIFY_H
> +	rval = fanotify_init(flags, event_f_flags);
> +
> +	if (rval == -1) {
> +		if (errno == ENOSYS) {
> +			tst_brk(TCONF, "%s:%d: fanotify is not configured in this kernel",
> +				file, lineno);
> +		}
> +
> +		if (errno == EINVAL) {
> +			if (flags & FAN_REPORT_FID) {
> +				tst_brk(TCONF, "%s:%d: FAN_REPORT_FID not supported by kernel?",
> +					file, lineno);
> +			}
> +
> +			if (flags & FAN_REPORT_NAME) {
> +				tst_brk(TCONF, "%s:%d: FAN_REPORT_NAME not supported by kernel?",
> +					file, lineno);
> +			}

If we happen to have both in flags it will report only the first one
here. So maybe we should use tst_res(TINFO, "") followed by
tst_brk(TCONF, "Unsupported configuration, see above"); or something
like that.

> +		}
> +
> +		tst_brk(TBROK | TERRNO, "%s:%d: fanotify_init() failed",
> +			file, lineno);
> +	}
> +#else
> +	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
> +#endif /* HAVE_SYS_FANOTIFY_H */
> +
> +	return rval;
> +}
> +
> +#define SAFE_FANOTIFY_INIT(fan, mode)  \
> +	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
> +
>  static inline int safe_fanotify_mark(const char *file, const int lineno,
>  			int fd, unsigned int flags, uint64_t mask,
>  			int dfd, const char *pathname)
> -- 
> 2.29.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
