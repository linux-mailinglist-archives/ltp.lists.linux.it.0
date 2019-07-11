Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC96573F
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:45:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 260233C1C93
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 14:45:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3C1813C0374
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:45:42 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8B5851000403
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 14:45:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 41874A705;
 Thu, 11 Jul 2019 12:45:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3633C1001DD9;
 Thu, 11 Jul 2019 12:45:40 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BF5E1843765;
 Thu, 11 Jul 2019 12:45:40 +0000 (UTC)
Date: Thu, 11 Jul 2019 08:45:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1337100107.32641000.1562849136661.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190711123441.GA8709@rei>
References: <20190705051603.24599-1-liwang@redhat.com>
 <02ade9af1634c4681156dceecfd51721284044e3.1562591065.git.jstancek@redhat.com>
 <20190711123441.GA8709@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.3]
Thread-Topic: add tst_no_corefile()
Thread-Index: pnlhIm2haOTRVwr7xBYGL5rZQMuUog==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 11 Jul 2019 12:45:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3.1] lib: add tst_no_corefile()
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
Cc: liwan@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > +void tst_no_corefile(int verbose)
> > +{
> > +	struct rlimit new_r, old_r;
> > +
> > +	SAFE_GETRLIMIT(RLIMIT_CORE, &old_r);
> > +	if (old_r.rlim_max >= 1 || geteuid() == 0) {
> > +		/*
> > +		 * 1 is a special value, that disables core-to-pipe.
> > +		 * At the same time it is small enough value for
> > +		 * core-to-file, so it skips creating cores as well.
> > +		 */
> > +		new_r.rlim_cur = 1;
> > +		new_r.rlim_max = 1;
> > +		SAFE_SETRLIMIT(RLIMIT_CORE, &new_r);
> > +	}
> > +
> > +	if (verbose)
> > +		tst_res(TINFO, "Avoid dumping corefile for process(pid=%d)", getpid());
> 
> Should we print the message here only
> 
> 	if (old_r.rlim_max <= 1 || geteuid() == 0)
> 
> because otherwise we will print the mesasge even in cases that the
> corefile is not in fact limited.

Depends on setup of core_pattern, if it's core-to-file it's already limited.
If it's core-to-pipe, then it's no limit, so I agree, we can move it above.

> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
