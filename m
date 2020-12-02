Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE42CC16B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 16:57:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EABC3C590E
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 16:57:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E234C3C4CD5
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 16:57:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A5835200AFE
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 16:57:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0598BAC2D
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 15:57:18 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:58:12 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201202155812.GA13529@yuki.lan>
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-8-pvorel@suse.cz>
 <20201202155519.GG12342@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202155519.GG12342@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 07/10] fanotify: Introduce SAFE_FANOTIFY_MARK()
 macro
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
> > +static inline int safe_fanotify_mark(const char *file, const int lineno,
> > +			int fd, unsigned int flags, uint64_t mask,
> > +			int dfd, const char *pathname)
> > +{
> > +	int rval;
> > +
> > +	rval = fanotify_mark(fd, flags, mask, dfd, pathname);
> > +
> > +	if (rval == -1) {
> > +		tst_brk_(file, lineno, TBROK | TERRNO, "fanotify_mark() failed");
> 
> I would be a bit more verbose here, i.e. print the mask, pathname and
> file descriptors as well.

Looks like the rest of the safe helpers are not verbose either, let's
push this as it is and we can make them more vebose later on in a
follow up patch.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
