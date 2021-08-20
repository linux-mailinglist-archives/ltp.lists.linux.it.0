Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3583F294A
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:37:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8023C27D5
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 11:37:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 677113C1F4E
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:37:10 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7F40C1A0035B
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 11:37:09 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8C811FDEF;
 Fri, 20 Aug 2021 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629452228;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNxCISyzhiDvrHFTt2hwUN0qpPWsPgobZBWKd3g+rO0=;
 b=2fBl3SgwLwKEDKKGCnwxB2TL6IwwV9tE5Qohu43VrWC+KcETaqlP9BA6LWpSq4ICw3ncwU
 3yMZyXSO2udLYU27IdpCJpoz4+0oIvc3chiaXIECSyLN5bRVrEO/xiBvX6L3olBpAtVRLw
 ghRBSerzEY6uQ8AFMDOghfQtRYsD/SY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629452228;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oNxCISyzhiDvrHFTt2hwUN0qpPWsPgobZBWKd3g+rO0=;
 b=16efZ1wu6iCItq5god9tWWryUT5/NUgApJGbeBTFQ6Vy70vVhjsjxVUp7PU7i6AfG2VHOJ
 jiDGUfUCuJwhtKAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3D99A1378E;
 Fri, 20 Aug 2021 09:37:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id SF6vCMR3H2FEXAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 09:37:08 +0000
Date: Fri, 20 Aug 2021 11:37:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YR93wpTZMw9oT1O4@pevik>
References: <20210806025659.1962902-1-liwang@redhat.com>
 <YQzLUUKbLcoJjRVb@pevik> <YQzOxg35JjpDOj7X@pevik>
 <CAEemH2cNk-L1kRRHy=vvLVjcEm0HPQXaz8fJR00M1TyzoJAynw@mail.gmail.com>
 <YQ0C1givEZ8/H7hN@pevik>
 <CAEemH2eCbTeTziGetR-mBRP9rB=0S2CvZNuDv-3DehksKUyu8A@mail.gmail.com>
 <874kc2n8tx.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874kc2n8tx.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hell Li,

> Li Wang <liwang@redhat.com> writes:

> >> > The conflict happened early in tst_test.h and I guess some header files
> >> > between line#14 to line#44 probably involves <linux/if.h>, but I'm not
> >> sure
> >> > which one is the culprit.
> >> Interesting, really something in in tst_test.h with combination of
> >> lapi/ip_tables.h. This combination is only in 2 tests, setsockopt0{3,8}.c,
> >> setsockopt03.c already had <netinet/in.h>.


> > I eventually caught that "tst_capability.h" is the key point.
> > To includes <netinet/in.h> before that can avoid the conflict.

> > But still not sure how it made things broken (i.e. where includes
> >  <linux/if.h>).


> >> > If we simply put the <netinet/in.h> at the top of tst_test.h, the
> >> > conflict disappears
> >> > as well.
> >> > See experiment commit:

> >> https://github.com/wangli5665/ltp/commit/0155df479811d9a51f30e09accb330238607f73d

> >> I'd be for adding it there, with comment why it's there. We can prevent
> >> problems
> >> with failing another test in the future. (+ remove it from both tests).


> > I'm OK with this fix.

> > @Cyril, @Richard, what do you think? any other thoughts?

> We need to clean up our headers, which is a bigger problem. Most tests
> do not need all the stuff in tst_test.h. It is just a load of unecessary
> work.

> Cleaning up the headers is a big challenge. It would be easier if we
> know what will break older distros. So I suggest adding something like:

> #ifdef _X_H
> # error "You should include X before Y ..."
> #endif
+1 for this.

> to one or more headers.

> Otherwise I'm fine with the above solution as a "temporary" fix.
quotation marks in "temporary" are correct, "temporary" means forever :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
