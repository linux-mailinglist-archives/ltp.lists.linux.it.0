Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AD58F06B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Aug 2022 18:30:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C56503C95DC
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Aug 2022 18:30:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B65F43C920E
 for <ltp@lists.linux.it>; Wed, 10 Aug 2022 18:30:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1C49F14002D3
 for <ltp@lists.linux.it>; Wed, 10 Aug 2022 18:30:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4345C348C6;
 Wed, 10 Aug 2022 16:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660149001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6P3aQVR77miV0IBQlhtScivKZAr53D52+udYIz4RsNo=;
 b=wgVcv5CoOAcFkl6a4HJxOsapEJG1+7KEALEjxnlUhS9gHSeiu3Yj5e5aFaX6+jA06koERb
 66ry0NsmWHy7fRrooVMNXP+ejKclwO3fovtxW5jRq8HZ7ptqUokVMueKEhiGvwyOgQAqKn
 b+5qnG1bjUtLK2ho4o/dl9hbDeojjr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660149001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6P3aQVR77miV0IBQlhtScivKZAr53D52+udYIz4RsNo=;
 b=2Xpmshxp7SAwI2QAvNwFqHnPqoDOTRgxqPOxwdtXoii/yQxBH5QMFN4R9M6IitdvGZ66Wi
 W/MV6qzFS3h+e3AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F365313AB3;
 Wed, 10 Aug 2022 16:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WD6aOAjd82IwbQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 10 Aug 2022 16:30:00 +0000
Date: Wed, 10 Aug 2022 18:29:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YvPdB6YhTlDAlPBR@pevik>
References: <20220808113756.11582-1-pvorel@suse.cz>
 <20220808113756.11582-4-pvorel@suse.cz>
 <7d501d57-2438-cd28-5e49-019ea06fb8f2@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d501d57-2438-cd28-5e49-019ea06fb8f2@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/4] tst_test.sh: Fix _tst_cleanup_timer() on
 set -e
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

Hi Martin,

> Hi,
> a comment explaining why this is needed would be nice, otherwise looks
> good. For patches 2 and 3:

> Reviewed-by: Martin Doucha <mdoucha@suse.cz>

> On 08. 08. 22 13:37, Petr Vorel wrote:
> > If test exits on time (i.e. no timeout) kill in _tst_cleanup_timer()
> > have nothing to kill therefore following wait exits 143.
I thought this is the explanation. Or would you prefer anything else to add?

Kind regards,
Petr

> > set -e (or #!/bin/sh -e or set -o errexit) quits on any non-zero exit code,
> > fix hardens _tst_cleanup_timer() to be able to be used on scripts with it.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > I can use 'if ...; then ; fi' if you prefer:

> > 	if [ "$LTP_COLORIZE_OUTPUT" = "n" -o "$LTP_COLORIZE_OUTPUT" = "0" ]; then
> > 		return 0
> > 	fi

> > 	if [ "$LTP_COLORIZE_OUTPUT" = "y" ] || [ "$LTP_COLORIZE_OUTPUT" = "1" ]; then
> > 		return 1
> > 	fi

> > ...
> > 	if [ "$color" = 1 ]; then
> > 		tst_flag2color "$1"
> > 	fi
> > 	printf "$2"
> > 	if [ "$color" = 1 ]; then
> > 		printf '\033[0m'
> > 	fi


> > Kind regards,
> > Petr

> >  testcases/lib/tst_test.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)

> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index 356af0106..1d2bf06cc 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -518,7 +518,7 @@ _tst_cleanup_timer()
> >  {
> >  	if [ -n "$_tst_setup_timer_pid" ]; then
> >  		kill -TERM $_tst_setup_timer_pid 2>/dev/null
> > -		wait $_tst_setup_timer_pid 2>/dev/null
> > +		wait $_tst_setup_timer_pid 2>/dev/null || true
> >  	fi
> >  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
