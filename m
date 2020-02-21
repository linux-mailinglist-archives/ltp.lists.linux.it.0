Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DB167A6F
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 11:19:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336783C266F
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 11:19:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7813D3C1315
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 11:19:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AA1A114012D0
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 11:19:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7E4BAC66
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 10:19:14 +0000 (UTC)
Date: Fri, 21 Feb 2020 11:19:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200221101913.GA24332@rei>
References: <20200220144559.22440-1-mdoucha@suse.cz>
 <8736b4gya0.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8736b4gya0.fsf@our.domain.is.not.set>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE 2017-10661
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
> > +static int fd = -1;
> > +static struct itimerspec its;
> > +static struct tst_fzsync_pair fzsync_pair;
> > +
> > +static void setup(void)
> > +{
> > +	int tmp;
> 
> All variables are temporary.
> 
> > +
> > +	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> > +	fd = timerfd_create(CLOCK_REALTIME, 0);
> > +
> > +	if (fd < 0) {
> > +		tmp = (errno == ENOTSUP ? TCONF : TBROK) | TERRNO,
> 
> Huh? This compiles?

I do not like this piece of code either, but apart from that it's
correct and works fine as far as I can tell.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
