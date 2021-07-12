Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FA3C4615
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:42:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 174FB3C6740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Jul 2021 10:42:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A3CC3C1DD9
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:42:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6A0C41400DD5
 for <ltp@lists.linux.it>; Mon, 12 Jul 2021 10:41:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9E4B1FD5A;
 Mon, 12 Jul 2021 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626079318;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4klGWGwCGhMlL/LJoR6M0ERk+bKNYHhrGc2niPxddf0=;
 b=w5por9ZMyOd494YOi+WjOQfNVkjcO+Bo1fvB6zRY5EfP2Ti/aPSYTC0H+e/i2WQiNArAVc
 Up/LTb8ETXSzrqRMF7Dk3P2sAbUkYbUkQcXfXuVNpCg+nbtIKB9dbepJHWh6lc8dUHxX4a
 IVk2GcMOrkvbB14UwWI19q78c1uPvA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626079318;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4klGWGwCGhMlL/LJoR6M0ERk+bKNYHhrGc2niPxddf0=;
 b=JOtOTezoQ72/eH4lbuI7zkNqEie8JC/WdS8xjpdAjdXG+L4dZvUzLVULtsOyMdW3WC14Bt
 Eo4ChUTxgAbXNsAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47F4F13AC2;
 Mon, 12 Jul 2021 08:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2rTBD1YA7GAwFgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Jul 2021 08:41:58 +0000
Date: Mon, 12 Jul 2021 10:41:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YOwASqNKNXBl4lqe@pevik>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
 <60E50AB4.7050404@fujitsu.com> <YObbKCNKUoC7lSxd@pevik>
 <YObpRzTjx8T2GAZn@yuki> <60EBA9C3.4050103@fujitsu.com>
 <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c81eee80-6cea-de14-aeff-8919495c4396@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: Huanian Li <huanli@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 12.07.2021 05:31, xuyang2018.jy@fujitsu.com wrote:
> > Hi All
> >> Hi!
> >>>>> Yes, good point, that would be more precise for ENOSPC testing.
> >>>> AFAIK, ltp doesn't support parallel test now. I think parallel test
> >>>> maybe a future plan that is why we use docparase to collect each case's
> >>>> used resources(so we can convert many groups, like pid, memory, disk
> >>>> space..., then we can run pid group and memory groups test case parallelly).
> >>> Yes, parallel support is not supported atm. Richie and Cyril has done some work
> >>> on runltp-ng to support it. Yes, first it's needed to add support in resources
> >>> (docparse), see Cyril's old block post [1].

> >> Besides most of the SHM tests will crash and burn if executed in
> >> parallel. The SysV IPC shares a global namespace and because of that we
> >> can't really write tests without assuming that we are the only one
> >> manipulating them when the test is executed.
> > I guess we should reach a consensus that how to fix this problem
> > 1)use for loop to trigger this error
> > 2)use CLONE_NEWIPC to trigger this error

> Perhaps it can be done at the higher level, e.g. in the ltp tests
> runner if some tests request it with a newipc flag...
Well, we have at least two runners (runltp which uses ltp-pan, runltp-ng) and we
also support running tests without runner, it'd be nice to solve this in LTP
API.

Kind regards,
Petr

> > 3)Or we are the only one that use shm and we can add a api to count the 
> > existed_cnt

> > ps: I don't want to leave this problem too long time.

> > Best Regards
> > Yang Xu



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
