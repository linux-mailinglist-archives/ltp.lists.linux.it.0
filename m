Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8F73699E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jun 2023 12:42:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FF9A3CB0D6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jun 2023 12:42:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD7793C9C7B
 for <ltp@lists.linux.it>; Tue, 20 Jun 2023 12:42:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3A06B6002A5
 for <ltp@lists.linux.it>; Tue, 20 Jun 2023 12:42:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3089A21877;
 Tue, 20 Jun 2023 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687257759;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2KY1TvebuxBA+GKjIZJkP2MPNdRrrkEWPQfw/WteQk=;
 b=jFHU1zyw0sNWkoHO2REew3OjZihspECgKoSDtjRhQkY4wvTPg2ETvsqMwJ/Sq4FuVRJQVD
 Z+vKoHXXqtaPeVJV5Z9AFvmyNdyJfF8oXcp4IZObWkvIyLY73ex9mfYFN2inaH2RLAk3xC
 T2qmPwtUKcuT7l7/lgwCAe73bs3X1XA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687257759;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I2KY1TvebuxBA+GKjIZJkP2MPNdRrrkEWPQfw/WteQk=;
 b=rXVrBnBfntChVjoEi5BxxQZT8T28dCnioGEKgbLGUxonCF/W7H5KY/Qc+WJAZKMLFqib8H
 4J6bA0idE7UA5DAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3EB91346D;
 Tue, 20 Jun 2023 10:42:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t09VOp6CkWTsYQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 20 Jun 2023 10:42:38 +0000
Date: Tue, 20 Jun 2023 12:42:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Message-ID: <20230620104229.GB281987@pevik>
References: <20230605044131.798383-1-dlemoal@kernel.org>
 <20230620091316.GB275381@pevik> <ZJFugRCzFlZYL934@x1-carbon>
 <ZJFwQRo8dOZICQJ+@x1-carbon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJFwQRo8dOZICQJ+@x1-carbon>
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] Improve ioprio tests
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Tue, Jun 20, 2023 at 11:16:49AM +0200, Niklas Cassel wrote:
> > On Tue, Jun 20, 2023 at 11:13:16AM +0200, Petr Vorel wrote:
> > > Hi Damien,

> > > > The ioprio syscall tests rely on ltp internal definitions of the
> > > > IOPRIO_XXX() macro defining priority classes and levels. With changes
> > > > to the ioprio API to support command duration limits, these internal
> > > > definitions are incomplete, causing test case ioprio_set03 to fail.

> > > > Avoid this issue by having the iprio tests use the kernel header file
> > > > definitions if that header exists. This enables additional checks in
> > > > the header file [1] which restores the expected results with test
> > > > ioprio_set03.

> > > > [1] https://lore.kernel.org/linux-block/20230530061307.525644-1-dlemoal@kernel.org/

> > > > Note: a review of this patch on the kernel block mailing list would be
> > > > very appreciated.

> > > I haven't found this patchset on https://lore.kernel.org/linux-block/,
> > > did you send it there?

> > Hello Petr,

> > The patch series for LTP can be found here:
> > https://lore.kernel.org/ltp/20230608005315.3703446-1-dlemoal@kernel.org/T/#t

> > I just checked LTP master, and it hasn't been applied by the
> > LTP maintainers yet.


> > Kind regards,
> > Niklas

> Oh, and in case you were referring to the prerequisite kernel patch,
> it is already in linux-next:

> https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?h=staging&id=01584c1e233740519d0e11aa20daa323d26bf598

Good to know, thank you (referring to kernel commits is always considered
useful).

No, I really searched if LTP patchset was also Cc'ed to linux-block.
But as the maintainers were Cc'ed I now understand why linux-block was omitted.
I'm sorry for the confusion.

Kind regards,
Petr

> So right now we are just waiting for the LTP patch series to get picked up.


> Kind regards,
> Niklas

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
