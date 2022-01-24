Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B149864E
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 18:18:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFE133C8F8A
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 18:18:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F4B33C6F6F
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 18:18:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 79424100044C
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 18:18:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6183D1F380;
 Mon, 24 Jan 2022 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643044718;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hb8TecJYNCjMEBrGknvQsJHM82ncykmciR7r7/sNRiE=;
 b=BCL7ABFoy9VwDaqhDgXFQ5DBAKzFNQWioFlsl9LktdutJnvDHW8LZ2wmfCx/MBPSR4Do6c
 dGtlvVG58/lt+NSnWXwQXpnrr8MQVSzGyvAdXme0cZSQGuGeMBIDBQ7QIEamYEgilGCCdb
 6PPfoWl57+hKQNbcGI+zrH/D9JNW/4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643044718;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hb8TecJYNCjMEBrGknvQsJHM82ncykmciR7r7/sNRiE=;
 b=vzZLk2fCv+9HL/gTOz648ZhBeDSHZLAIdgaSwob2HLsp9PY2tuqWcXl3zDZkGT+RMkXD2C
 ax9ffyWdbBy80gAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A26213C41;
 Mon, 24 Jan 2022 17:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RZLzEG7f7mGaWwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 24 Jan 2022 17:18:38 +0000
Date: Mon, 24 Jan 2022 18:18:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Ye7fbKjqzR0Vf3J+@pevik>
References: <20211208082625.26324-1-pvorel@suse.cz>
 <Ye7CwmegfyHXgN2N@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye7CwmegfyHXgN2N@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] m4: Fix warnings
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

Hi Cyril,

thx for looking into this.

> Hi!
> > diff --git a/m4/ltp-eventfd.m4 b/m4/ltp-eventfd.m4
> > index 5d729a33d..580df00a3 100644
> > --- a/m4/ltp-eventfd.m4
> > +++ b/m4/ltp-eventfd.m4
> > @@ -12,12 +12,10 @@ AC_DEFUN([LTP_CHECK_SYSCALL_EVENTFD], [
> >  		AC_SUBST(AIO_LIBS, "-laio")

> >  		AC_MSG_CHECKING([io_set_eventfd is defined in aio library or aio header])
> > -		AC_TRY_LINK([#include <stdio.h>
> > +		AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <stdio.h>
> >                               #include <libaio.h>
> > -		            ],
> > -		            [io_set_eventfd(NULL, 0); return 0;],
> > +		            ]], [[io_set_eventfd(NULL, 0); return 0;]])],
> >  		            [AC_DEFINE(HAVE_IO_SET_EVENTFD, 1, [Define to 1 if you have `io_set_eventfd' function.])
> > -						AC_MSG_RESULT(yes)],
> > -		            [AC_MSG_RESULT(no)])
> > +						AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)])

> Shouldn't we convert this bit into AC_CHECK_FUNCS() (in a separte patch)?
Ah, thx for catching this.

> > +AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <unistd.h>
> > +		#include <linux/perf_event.h>]], [[
> >  			struct perf_event_attr pe;
> > -		],
> > -		AC_DEFINE(HAVE_PERF_EVENT_ATTR) AC_MSG_RESULT(yes), AC_MSG_RESULT(no))
> > +		]])],[AC_DEFINE(HAVE_PERF_EVENT_ATTR) AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)])

> And this one with AC_CHECK_TYPES()?
+1

> > -AC_TRY_LINK([#define _GNU_SOURCE
> > -             #include <math.h>],
> > -            [
> > +AC_LINK_IFELSE([AC_LANG_PROGRAM([[#define _GNU_SOURCE
> > +             #include <math.h>]], [[
> >               volatile float val;
> >               exp10(val);
> > -            ],
> > -             AC_DEFINE(HAVE_EXP10) AC_MSG_RESULT(yes), AC_MSG_RESULT(no))
> > +            ]])],[AC_DEFINE(HAVE_EXP10) AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)])
> >  LIBS="$backup_ldlibs"
> >  ])

> Similarily here AC_CHECK_FUNCS()?
+1

I'll recheck all of AC_LINK_IFELSE, AC_COMPILE_IFELSE before posting next
version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
