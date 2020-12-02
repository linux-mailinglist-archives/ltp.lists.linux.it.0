Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD542CC47B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 19:04:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2124A3C590B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 19:04:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9B6C63C2BEA
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 19:04:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AFC54200B71
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 19:04:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4670ABCE;
 Wed,  2 Dec 2020 18:04:12 +0000 (UTC)
Date: Wed, 2 Dec 2020 19:04:11 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X8fXG3ix4oq2Gab6@pevik>
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-5-pvorel@suse.cz>
 <20201202154604.GD12342@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202154604.GD12342@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 04/10] fanotify: Add helper for FAN_REPORT_FID
 support on fs
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

Hi Amir, Cyril,

> > +	if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname) < 0) {
> > +		if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV) {
> > +			rval = -2;
> > +		} else {
> > +			tst_brk(TBROK | TERRNO,
> > +				"fanotify_mark (%d, FAN_MARK_ADD, ..., AT_FDCWD, \".\") failed", fd);
>                                                                                    ^
> 										   fname?
...

> Maybe this would be just easier to read as a macro:

> #define FANOTIFY_FAN_REPORT_FID_ERR_MSG(res_func, fail) do { \
> 	if (fail == -1) \
> 		res_func(TCONF, "FAN_REPORT_FID not supported in kernel?"); \
> 	if (fail == -2) \
> 		res_func(TCONF, ...); \
> 	} while (0)

...
> > +static inline void require_fanotify_fan_report_fid_supported_on_fs(const char *file,
> > +	const int lineno, const char *fname)
> > +{
> > +	int rval;
> > +
> > +	rval = fanotify_fan_report_fid_supported_on_fs(fname);
> > +	if (rval)
> > +		fanotify_fan_report_fid_err_msg(file, lineno, tst_brk_, rval);

> We don't have to do the if here, just pass the rval, it will not trigger
> tst_brk() if we pass zero.


> The rest is good.

Both your comments fixed, patchset merged.

Thank you both for your patient review,

Amir, I'm sorry it took me that long.
Looking forward to your patchset :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
