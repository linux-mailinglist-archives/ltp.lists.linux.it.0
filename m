Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF9951862
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2024 12:09:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBC973D2133
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Aug 2024 12:09:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD5813D20CD
 for <ltp@lists.linux.it>; Wed, 14 Aug 2024 12:09:36 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 873C66018BA
 for <ltp@lists.linux.it>; Wed, 14 Aug 2024 12:09:33 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C199B227B0;
 Wed, 14 Aug 2024 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723630172;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bXFXgpDvTgn3zDMsa6ryngGfJZ6wle3EjQ9H3J9PXM=;
 b=XCmmNEn+sgBjhO/SY/88xiysaWwdfkBwoMG9jUN0mn0AdzNw5ePQQJAZGna2lG1/ErORrh
 RwxhDCZD9osgYoTpMPaR8juDE1sAxLqLPIzRNqs3sitvw4T3X7dDuzhqLCOCZPEEJwaR+v
 /dmxLfkywcn/xIQjUhlLwemQQ0Zf1ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723630172;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bXFXgpDvTgn3zDMsa6ryngGfJZ6wle3EjQ9H3J9PXM=;
 b=DGLQ1FRAxAFIrApMIdZuvLwzF5fI+iA8KFVW9uitxB02yq9oI77ct0AuoKOIiVH+FTGGAQ
 v/CkPrgzbg3/6OAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1723630171;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bXFXgpDvTgn3zDMsa6ryngGfJZ6wle3EjQ9H3J9PXM=;
 b=rMOtcBb/iucToTGTMzfzRktTS0BsorpMjWPZd3GhLaUVfw48N36jkgFbv6RrOcqj8aPHRA
 L8+vCmMbsD2PDbdYJ3J35vd9QtzHb+MGdqFznAYBqoFkHFY4T9TngPDILkUQFDOnuKlqC1
 U7XfMRyQ33bgeadkoBS5yLBDb9E/M/4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1723630171;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bXFXgpDvTgn3zDMsa6ryngGfJZ6wle3EjQ9H3J9PXM=;
 b=XXPL0PTXdP+FOyO7JBpuF4QCuynrru4hN5XZ+CHQLcyZ66v4in9/szIDRtUDLQOK5dABxQ
 4C5A3JyPPev0HKCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7720C139B9;
 Wed, 14 Aug 2024 10:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fwXOG1uCvGaBAgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 14 Aug 2024 10:09:31 +0000
Date: Wed, 14 Aug 2024 12:09:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Calum Mackay <calum.mackay@oracle.com>
Message-ID: <20240814100930.GA525252@pevik>
References: <20240812223604.32592-1-cel@kernel.org>
 <20240814074559.GA209695@pevik>
 <BN0PR10MB5143EDD71EF92A181D4255A0E7872@BN0PR10MB5143.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BN0PR10MB5143EDD71EF92A181D4255A0E7872@BN0PR10MB5143.namprd10.prod.outlook.com>
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_EQ_ADDR_SOME(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; MISSING_XM_UA(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 6.6.y 00/12] Backport "make svc_stat per-net
 instead of global"
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "cel@kernel.org" <cel@kernel.org>, Sherry Yang <sherry.yang@oracle.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Chuck Lever III <chuck.lever@oracle.com>,
 "kernel-team@fb.com" <kernel-team@fb.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Calum,

> Hi Petr,

> There are two sets of changes here, for NFS client, and NFS server.

> The NFS client changes have already been backported from v6.9 all the way to v5.4.

> Here, Chuck is discussing the NFS server changes (and others), which were not backported from v6.9 (actually, a few were, but only to v6.8).

Thanks for info! Now I'll see the patchset "Make nfsd stats visible in network
ns" [1]. kernelnewbies [2] starts with d98416cc2154 ("nfsd: rename
NFSD_NET_* to NFSD_STATS_*"), the others are probably some preparation commits.

Anyway, I'll update the patch with NFS server patchset.

Kind regards,
Petr

[1] https://lore.kernel.org/linux-nfs/cover.1706283433.git.josef@toxicpanda.com/
[2] https://kernelnewbies.org/Linux_6.9#File_systems


> Thanks,
> Calum.

> Sent from Outlook for Android<https://aka.ms/AAb9ysg>
> ________________________________
> From: Petr Vorel <pvorel@suse.cz>
> Sent: Wednesday, August 14, 2024 8:45:59 AM
> To: cel@kernel.org <cel@kernel.org>
> Cc: stable@vger.kernel.org <stable@vger.kernel.org>; linux-nfs@vger.kernel.org <linux-nfs@vger.kernel.org>; Sherry Yang <sherry.yang@oracle.com>; Calum Mackay <calum.mackay@oracle.com>; kernel-team@fb.com <kernel-team@fb.com>; Chuck Lever III <chuck.lever@oracle.com>; Cyril Hrubis <chrubis@suse.cz>; ltp@lists.linux.it <ltp@lists.linux.it>
> Subject: Re: [PATCH 6.6.y 00/12] Backport "make svc_stat per-net instead of global"

> Hi Chuck,

> > Following up on:

> > https://lore.kernel.org/linux-nfs/d4b235df-4ee5-4824-9d48-e3b3c1f1f4d1@oracle.com/

> > Here is a backport series targeting origin/linux-6.6.y that closes
> > the information leak described in the above thread. It passes basic
> > NFSD regression testing.


> Thank you for handling this! The link above mentions that it was already
> backported to 5.4 and indeed I see at least d47151b79e322 ("nfs: expose
> /proc/net/sunrpc/nfs in net namespaces") is backported in 5.4, 5.10, 5.15, 6.1.
> And you're now preparing 6.6. Thus we can expect the behavior changed from
> 5.4 kernels.

> I wonder if we consider this as a fix, thus expect any kernel newer than 5.4
> should backport all these 12 patches.

> Or, whether we should relax and just check if version is higher than the one
> which got it in stable/LTS (e.g. >= 5.4.276 || >= 5.10.217 ...). The question is
> also if enterprise distros will take this patchset.

> BTW We have in LTP functionality which points as a hint to kernel fixes. But
> it's usually a single commit. I might need to list all.

> Kind regards,
> Petr

> > Review comments welcome.

> > Chuck Lever (2):
> >   NFSD: Rewrite synopsis of nfsd_percpu_counters_init()
> >   NFSD: Fix frame size warning in svc_export_parse()

> > Josef Bacik (10):
> >   sunrpc: don't change ->sv_stats if it doesn't exist
> >   nfsd: stop setting ->pg_stats for unused stats
> >   sunrpc: pass in the sv_stats struct through svc_create_pooled
> >   sunrpc: remove ->pg_stats from svc_program
> >   sunrpc: use the struct net as the svc proc private
> >   nfsd: rename NFSD_NET_* to NFSD_STATS_*
> >   nfsd: expose /proc/net/sunrpc/nfsd in net namespaces
> >   nfsd: make all of the nfsd stats per-network namespace
> >   nfsd: remove nfsd_stats, make th_cnt a global counter
> >   nfsd: make svc_stat per-network namespace instead of global

> >  fs/lockd/svc.c             |  3 --
> >  fs/nfs/callback.c          |  3 --
> >  fs/nfsd/cache.h            |  2 -
> >  fs/nfsd/export.c           | 32 ++++++++++----
> >  fs/nfsd/export.h           |  4 +-
> >  fs/nfsd/netns.h            | 25 +++++++++--
> >  fs/nfsd/nfs4proc.c         |  6 +--
> >  fs/nfsd/nfs4state.c        |  3 +-
> >  fs/nfsd/nfscache.c         | 40 ++++-------------
> >  fs/nfsd/nfsctl.c           | 16 +++----
> >  fs/nfsd/nfsd.h             |  1 +
> >  fs/nfsd/nfsfh.c            |  3 +-
> >  fs/nfsd/nfssvc.c           | 14 +++---
> >  fs/nfsd/stats.c            | 54 ++++++++++-------------
> >  fs/nfsd/stats.h            | 88 ++++++++++++++------------------------
> >  fs/nfsd/vfs.c              |  6 ++-
> >  include/linux/sunrpc/svc.h |  5 ++-
> >  net/sunrpc/stats.c         |  2 +-
> >  net/sunrpc/svc.c           | 39 +++++++++++------
> >  19 files changed, 163 insertions(+), 183 deletions(-)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
