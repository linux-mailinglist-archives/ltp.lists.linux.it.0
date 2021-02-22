Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B53321200
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 09:28:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 746913C6111
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 09:28:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B95133C2688
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 09:28:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EC5262009C2
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 09:28:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1734AE05;
 Mon, 22 Feb 2021 08:28:12 +0000 (UTC)
Date: Mon, 22 Feb 2021 09:28:11 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YDNrG9A8Dlm2k8uh@pevik>
References: <20210219144704.20433-1-pvorel@suse.cz>
 <20210219144704.20433-3-pvorel@suse.cz> <878s7k59tk.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878s7k59tk.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] netns_netlink: Rewrite into new API
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

Hi Richie,

> Hello,

> Petr Vorel <pvorel@suse.cz> writes:

> > From: Richard Palethorpe <rpalethorpe@suse.com>

> I don't remember this :-)

I'm sorry, that should be me :). I normally does not have problems with git,
but this time I messed things up with rebasing.

> > This also require to rewrite netns_helper.h.
> > New test still uses legacy libclone.h.

> > ...

> >  	pclose(ipf);
> > @@ -67,14 +53,14 @@ static void check_netns(void)
> >  	int pid, status;
> >  	/* Checking if the kernel supports unshare with netns capabilities. */
> >  	if (CLONE_NEWNS == -1)
> > -		tst_brkm(TCONF | TERRNO, NULL, "CLONE_NEWNS (%d) not supported",
> > +		tst_brk(TCONF | TERRNO, "CLONE_NEWNS (%d) not supported",
> >  			 CLONE_NEWNS);

> >  	pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET | CLONE_NEWNS,
> >  	                            dummy, NULL);

> I guess you are considering replacing this with something that uses
> SAFE_CLONE?

> This should be quite easy as this function is not cloning with CLONE_VM
> or anything special. It is just fork() with CLONE_NEWNET | CLONE_NEWNS,
> so we probably don't need most of the wierdness in libclone.
+1, I'd also like to get rid of libclone.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
