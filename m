Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6236F1904
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 15:12:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B95D3CBA47
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Apr 2023 15:12:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2E0C3CBA25
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 15:12:20 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A93CC600A65
 for <ltp@lists.linux.it>; Fri, 28 Apr 2023 15:12:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 021DD21F4A;
 Fri, 28 Apr 2023 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1682687537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8JKnVsz8wGP0p0WnaCP0mvfxlRDBPf1RnT+NnWU5+tU=;
 b=q6jX89ilR1TUD/f9mtkevvZCO+oAke/0uyIv4jcmyU98e+FGYnWKMZsvFnekzZBctsBakc
 y5qcks5qhWsfL80VcrlzgCPNQC71kZWHiXeKoyFy8Vje4hxxNieKKKbU0RrVqQioru3aTA
 +OIi03RQfcM+k72v8slLfdxmneo1h/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1682687537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8JKnVsz8wGP0p0WnaCP0mvfxlRDBPf1RnT+NnWU5+tU=;
 b=EhPTB0yxrjau86K9hsfIWwE1H+RULnOF3cVQD6vMsNLBKI446Z5lq0RDLH4FlyzzJASywM
 9Lqdqd1CYgB3VhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C8C0138FA;
 Fri, 28 Apr 2023 13:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yxo0JjDGS2RJFAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 28 Apr 2023 13:12:16 +0000
Date: Fri, 28 Apr 2023 15:13:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <ZEvGchayVsZfrAH5@yuki>
References: <20230428084922.9834-1-liwang@redhat.com> <ZEufJa+TyZdY9gsq@yuki>
 <CAEemH2fcvpRLS7-rdpiGt-fqEwXCiAb-jpRdisb33axhdP3CoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fcvpRLS7-rdpiGt-fqEwXCiAb-jpRdisb33axhdP3CoA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_cgroup: Avoid mixing mounts V1 and V2
 simultaneously
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
> That's the original design. We tried to keep flexible but ignored
> one exception V1 mounts all controllers and V2 only basic mount.
> (No controllers conflict in this mounting).
> 
> From my observation, if a system(e.g. RHEL8) only announces
> Cgroup V1 support but does not guarantee V2 to be used.
> A test required 'CTRL_BASE' could mount V2 success but
> that V2 is only part work and test will get TBROK.
> We are unable to say this situation is a bug.

So the V2 does not actually work unless there is at least one controller
enabled? That sounds like a bug to me, my system actually uses v1
controllers and unified hierarchy at the same time. The unified
hierarchy is used to group deamon processes and kill them with the
cgropu.kill if needed.

What exactly happens on your system?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
