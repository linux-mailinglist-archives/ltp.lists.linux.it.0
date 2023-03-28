Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 059776CC018
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Mar 2023 15:04:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D96D23CCB34
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Mar 2023 15:04:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 473633C0162
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 15:04:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4557F1A006A8
 for <ltp@lists.linux.it>; Tue, 28 Mar 2023 15:04:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 175E41FDC4;
 Tue, 28 Mar 2023 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1680008674;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJPXoyvM2YV+pJ2CVyMxxyk31IlkDinbwmHhMPCI5cM=;
 b=I4TL8dNTFkg3wkfMJN/Qr9nBLh4Hg58ko5mM0XsNXcxTMcO8OF2dQeFtpEBCUOGOC/hQPj
 M4Yf1FhwzXCOTj2GLbwOcgwioom1epiDTuwd7FCnAgKCFrOHsNIIm4PkXHd0vW5M8B4jv4
 8uEQYgBAsRYCgZDzeAXNJbHASAL4ahU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1680008674;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJPXoyvM2YV+pJ2CVyMxxyk31IlkDinbwmHhMPCI5cM=;
 b=h38x/H9SdzzoTlxkO7rfk+SIcEROVUDxBtERaiz6LfgHVHySEcPOSJCs2WNXY8+c/XAL0b
 Bkb5wL16pyqEqxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2AA91390D;
 Tue, 28 Mar 2023 13:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 78P3JeHlImQ6SQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 28 Mar 2023 13:04:33 +0000
Date: Tue, 28 Mar 2023 15:04:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20230328130432.GC755576@pevik>
References: <20230328111338.766712-1-pvorel@suse.cz>
 <20230328111338.766712-3-pvorel@suse.cz>
 <CAEemH2ekO=T1x4+q+dHR5ONvGTE-jgKT1uDsoVtdG-oboBNzRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ekO=T1x4+q+dHR5ONvGTE-jgKT1uDsoVtdG-oboBNzRQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] doc: Add Release procedure
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > +++ b/doc/LTP-Release-Procedure.asciidoc
> > @@ -0,0 +1,67 @@
> > +LTP Release Procedure
> > +=====================
> > +
> > +This page contains quick summary of what needs to be done to do a LTP release. It's expected that LTP git is frozen and git HEAD was properly tested and that LTP git tree is cloned to a directory named 'ltp'.

> Should we mention the release is happening every 4 months?

> > +NOTE: The string YYYYMMDD should be substituted to the current date.

> Or, maybe add one more item about the release eve work?
> Like what we discussed in:
>   - https://lists.linux.it/pipermail/ltp/2022-September/030614.html

> For example:

> 0. Release eve work
> ---------------------------

> [source,sh]
> --------------------------------------------------------------------

> a. Collecting the (must have) patch list for new release
> b. Reviewing and merging the patch list of (a.)
> c. Widely testing, explicitly post results
> d. Tiny fix according to release testing
> e. Writing release note
> ...
> --------------------------------------------------------------------

Very good point, I agree with both. Thanks!

Kind regards,
Petr

> > +1. Tag the git
> > +--------------
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
