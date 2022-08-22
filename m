Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0359BD90
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 12:28:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7627E3CA2E5
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Aug 2022 12:28:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8AC83CA277
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 12:28:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 896DD1000950
 for <ltp@lists.linux.it>; Mon, 22 Aug 2022 12:28:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7B3F1F895;
 Mon, 22 Aug 2022 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1661164109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8E18x9ciCb+KkpIp53WDqbk8ru59KRY9oxG2BSBHSo=;
 b=QlZf7mBk1eDYHVrkIEWgkkA2NVyTrld9Hw4rpybcM1Fh5Vzu8rqAW6fn7+Iac9zj6mh3Ru
 oZkygB05HImZMFGlV2+Z90mpowcCBvgwJ2rjQMfJSz2clrrEKqUwnWnyVB3R6JZetVDtxV
 iWGEAo97buArsDyqkhXcQ8eP8LWrA/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1661164109;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8E18x9ciCb+KkpIp53WDqbk8ru59KRY9oxG2BSBHSo=;
 b=FxGgXN7fwHw4mJkkaNcD2Lwh2oBXXAWd/oMXXTwJV8eY/TNxgSUOacEF+V+G5KZjRH0lzU
 HO1vw8EooVYhqyDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B58451332D;
 Mon, 22 Aug 2022 10:28:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jm+BKk1aA2MCDwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 22 Aug 2022 10:28:29 +0000
Date: Mon, 22 Aug 2022 12:28:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YwNaTHfTNoRdVBwJ@pevik>
References: <f710f7cc103a61c20d5ee907d9717fa384810553.1657198689.git.jstancek@redhat.com>
 <Yv+rxD5EO4MDayXT@pevik>
 <CAASaF6xWmj4Gk39E7Edbn55bfhGJiJ=nWX=XVUtV3WctFSiK4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6xWmj4Gk39E7Edbn55bfhGJiJ=nWX=XVUtV3WctFSiK4g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] commands/df01.sh: print more logs when test fails
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

> On Fri, Aug 19, 2022 at 5:27 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Jan,

> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > ---
> > >  testcases/commands/df/df01.sh | 5 +++++
> > >  1 file changed, 5 insertions(+)

> > > diff --git a/testcases/commands/df/df01.sh b/testcases/commands/df/df01.sh
> > > index f74032c962e5..6b20f21d0d74 100755
> > > --- a/testcases/commands/df/df01.sh
> > > +++ b/testcases/commands/df/df01.sh
> > > @@ -103,6 +103,11 @@ df_check()

> > >       grep ${TST_DEVICE} output | grep -q "${total}.*${used}"
> > >       if [ $? -ne 0 ]; then
> > > +             echo "total: ${total}, used: ${used}"
> > > +             echo "df saved output:"
> > I wonder why you didn't use tst_res TINFO? It'd be more readable as the output
> > can be quite long...

> It didn't cross my mind at the time. It looks like the df failures are
> coming to a resolution,
> so I don't mind if you want to drop these 'echos' later.

Thanks! I wasn't sure if the reason was to print to stdout (tst_res prints to
stderr), looks like that was not the reason.

Kind regards,
Petr

> > > +             cat output
> > > +             echo "df output:"
> > > +             $@

> > Kind regards,
> > Petr

> > >               return 1
> > >       fi
> > >  }



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
