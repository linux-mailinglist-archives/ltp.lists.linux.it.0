Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F6D952989
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2024 08:53:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5D193D21A7
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2024 08:53:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D46AC3D1D10
 for <ltp@lists.linux.it>; Thu, 15 Aug 2024 08:53:38 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B3CE06002D3
 for <ltp@lists.linux.it>; Thu, 15 Aug 2024 08:53:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A27D1FFC0;
 Thu, 15 Aug 2024 06:53:35 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF3D213983;
 Thu, 15 Aug 2024 06:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zrObM+6lvWa/YQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 15 Aug 2024 06:53:34 +0000
Date: Thu, 15 Aug 2024 08:53:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: NeilBrown <neilb@suse.de>
Message-ID: <20240815065333.GA560832@pevik>
References: <> <20240814205519.GA550121@pevik>
 <172367387549.6062.7078032983644586462@noble.neil.brown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172367387549.6062.7078032983644586462@noble.neil.brown.name>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4A27D1FFC0
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] nfsstat01: Update client RPC calls for kernel
 6.9
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
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Greg KH <greg@kroah.com>, Jeff Layton <jlayton@kernel.org>,
 Sherry Yang <sherry.yang@oracle.com>, linux-stable <stable@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Chuck Lever III <chuck.lever@oracle.com>,
 Anna Schumaker <anna@kernel.org>, Trond Myklebust <trondmy@hammerspace.com>,
 Calum Mackay <calum.mackay@oracle.com>,
 "kernel-team@fb.com" <kernel-team@fb.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Thu, 15 Aug 2024, Petr Vorel wrote:
> > > On Fri, 12 Jul 2024, Jeff Layton wrote:
> > > > On Fri, 2024-07-12 at 16:12 +1000, NeilBrown wrote:

> > > > > My point is that if we are going to change the kernel to accommodate LTP
> > > > > at all, we should accommodate LTP as it is today.  If we are going to
> > > > > change LTP to accommodate the kernel, then it should accommodate the
> > > > > kernel as it is today.


> > > > The problem is that there is no way for userland tell the difference
> > > > between the older and newer behavior. That was what I was suggesting we
> > > > add.

> > > To make sure I wasn't talking through my hat, I had a look at the ltp
> > > code.

> > > The test in question simply tests that the count of RPC calls increases.

> > > It can get the count of RPC calls in one of 2 ways :
> > >  1/ "lhost" - look directly in /proc/net/rpc/{nfs,nfsd}
> > >  2/ "rhost" - ssh to the server and look in that file.

> > FYI "rhost" in LTP can be either using namespaces (Single Host Configuration [1]),
> > which is run by default, or SSH based (Two Host Configuration [2]). IMHO most of
> > the testers (including myself run tests simply via network namespaces).

> > NOTE: I suppose CONFIG_NAMESPACES=y is a must for 'ip netns' to be working, thus
> > tests would hopefully failed early on kernel having that disabled.

> > > The current test to "fix" this for kernels -ge "6.9" is to force the use
> > > of "rhost".

> > > I'm guessing that always using "rhost" for the nfsd stats would always
> > > work.

> > FYI this old commit [3] allowed these tests to be working in network namespaces.
> > It reads for network namespaces both /proc/net/rpc/{nfs,nfsd} from non-namespace
> > ("lhost").  This is the subject of the change in 6.9, which now fails.
> > And for SSH based we obviously look on "rhost" already.

> That patch looks like a mistake.  The author noticed that the rpc stats
> were not "namespacified" and instead of reporting the bug (and surely
> the whole point of a test suite is to report bugs), they made a change
> that seems completely unnecessary which had the effect of entrenching
> the bug.  Unfortunately the commit message only says why it is same to
> make the change, not why it us useful.

Fully agree. With nowadays experiences I would have asked him to discuss that on
this ML. Ironically, Alexey back then (as part of Oracle) did had report and
even fix few network protocol related bugs, did some testing for NFS related
fixes.

> > > But if not, the code could get both the local and remote nfsd stats, and
> > > check that at least one of them increases (and neither decrease).

> > This sounds reasonable, thanks for a hint. I'll just look for client RPC calls
> > (/proc/net/rpc/nfs) in both non-namespace and namespace. The only think is that
> > we effectively give up checking where it should be (if it for whatever reason in
> > the future changes again, we miss that). I'm not sure if this would be treated
> > the same as the current situation (Josef Bacik had obvious reasons for this to
> > be working).

> Stats should always be visible in the relevant namespace.  server stats
> should be visible in the name space where the server runs.  client stats
> should be visible in the namespace where the filesystem is mounted.
> This has always been true (as long as we have had stats) and if it ever
> stops being true, that is a bug.

+1

> I think the test suite should test for precisely this case.  Testing if
> the stats are visible from a different namespace is not likely to be an
> interesting test - unless you want to guard against the possibility that
> we will one day accidentally de-namespaceify the stats (stranger things
> have happened).

There could be additional check for namespaces only (skip in SSH) that there is
no information leak.

Kind regards,
Petr

> Thanks,
> NeilBrown


> > @Josef @NFS maintainers: WDYT?

> > Kind regards,
> > Petr

> > > So ltp doesn't need to know which kernel is being used - it can be
> > > written to work safely on either.

> > > NeilBrown

> > [1] https://github.com/linux-test-project/ltp/tree/master/testcases/network#single-host-configuration
> > [2] https://github.com/linux-test-project/ltp/tree/master/testcases/network#two-host-configuration
> > [3] https://github.com/linux-test-project/ltp/commit/40958772f11d90e4b5052e7e772a3837d285cf89

> > > > To be clear, I hold this opinion loosely. If the consensus is that we
> > > > need to revert things then so be it. I just don't see the value of
> > > > doing that in this particular situation.
> > > > -- 
> > > > Jeff Layton <jlayton@kernel.org>





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
