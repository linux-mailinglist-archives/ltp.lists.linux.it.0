Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEB96F7722
	for <lists+linux-ltp@lfdr.de>; Thu,  4 May 2023 22:37:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24B103CB7C7
	for <lists+linux-ltp@lfdr.de>; Thu,  4 May 2023 22:37:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01A073CB73D
 for <ltp@lists.linux.it>; Thu,  4 May 2023 22:37:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1D72A1000CE6
 for <ltp@lists.linux.it>; Thu,  4 May 2023 22:37:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 33C341F8AA;
 Thu,  4 May 2023 20:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1683232640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HlPDvyDwQYvcxFBoJRlv8cmIN/j1qhJ2FGYFtvPL8Do=;
 b=g8cCTjFCXp3fcWwHi8v8Cvk4Hdwrd+a3fGvf5oX3gIan7n5NnoxISfdtG/xMhiZEA2H+PD
 H6Ta5rUj7n2r/+Qk0Vci7TTyMdn6IEQKJdopHlZmECOguO9FAfl8+2D7G7CG1y6EPnkl4a
 6md2GuIX8mxfFyeFtdRjXBculc1NoEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1683232640;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HlPDvyDwQYvcxFBoJRlv8cmIN/j1qhJ2FGYFtvPL8Do=;
 b=FzNlYgc/RORcNUpvfXF7J3dmZZ2iNitYSX+zeFNZG/IgXe0YdTkNlSL/JP9NQCLThFkBEi
 QQClY01iZ3C/6PAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE25C13444;
 Thu,  4 May 2023 20:37:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AnsCIn8XVGSMKwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 May 2023 20:37:19 +0000
Date: Thu, 4 May 2023 22:37:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230504203733.GA3829456@pevik>
References: <ZEjsKC6ESB1+mM0H@rei> <20230502143711.GA3665733@pevik>
 <ZFIp4Sulcy20GWkc@rei> <20230504131706.GA3826382@pevik>
 <ZFO2vmWk-tvrZoQQ@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZFO2vmWk-tvrZoQQ@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release preparations
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

> Hi!
> > > > * nfslock01.sh: Don't test on NFS v3 on TCP
> > > > https://patchwork.ozlabs.org/project/ltp/patch/20230502075921.3614794-1-pvorel@suse.cz/
> > > > => IMHO should go in to increase NFS tests stability

> > > The discussion around it sounds like this is a kernel problem after all.

> > I didn't get if we want to keep this *not* merged.

> That goes against "do not work around real bugs in tests", if possible I
> wouldn't apply any workarounds even if there is no upstream fix yet,
> maybe just a message that this is a known bug.

Fair enough, I rejected my patch. If no fix come out of the suggestion, I'd be
for adding a TINFO message, but let's wait.

> > > > * NFS: test on all filesystems
> > > > https://patchwork.ozlabs.org/project/ltp/list/?series=352840&state=*

> > > This is rather big change, is this important enough to get it in just
> > > before the git freeze?

> > There is v5 which tests only btrfs, ext4 and xfs. That should be safe to merge.
> > https://patchwork.ozlabs.org/project/ltp/list/?series=353495

> I will have a look.

Thanks.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
