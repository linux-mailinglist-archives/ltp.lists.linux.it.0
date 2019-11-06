Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA500F1DB3
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:41:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 819453C23CE
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 19:41:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 264433C23BB
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:41:52 +0100 (CET)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D797E6023EE
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 19:41:51 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id c22so4712852wmd.1
 for <ltp@lists.linux.it>; Wed, 06 Nov 2019 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KokSND+lqE7K5y+9vVqSENMKi7dNWf+4uDlfbHxPOQw=;
 b=N/+4t5rcR4xqrYAVSd2pC5a/6W8eTTqDpIozQPKCXc+4LDMv0afrG8zebwlzQ0DzmV
 XyRdYcmR9fBneYEVBYqP0uVXcICihk86Kku0lOnLsLyBuoA//uVtVBt8ZszWfPRcca4P
 UXhqVICh+F3KXZNvwc3h+bd6lH1cKRVIJQr6DT26L+W2LfT2lcHs+IGikRKmiFV7M2JW
 eOmN00zdFpRMAVmf7iHw3eQZsLNpvSJUKwpM6Ak/u9ZDLHMpDs2UkcEqwya05Ja4HIar
 xD4X1uPh3GCxj86HP01kggfF7O7BBaWzIjAFzxMs2n9Su6r2jZWUlpOGj1eR0AwR/0Iv
 Njuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KokSND+lqE7K5y+9vVqSENMKi7dNWf+4uDlfbHxPOQw=;
 b=CsgAH0krhzTe5SfGOLUFFY8HBfJuLhl+K1p2/iEwNqp74TnrX/IPOB1gv1oKFaZGPm
 18hWDbAG/9B6tBYG4nL6Kr2uRhQlmMu4siq1gXJEMwCiZR9I2l70JPGheKD5JApwk2jg
 1t4cvAZgdxWJ3GuDfJn+SXr5dw2N6RDdrbxsTDwTYFx+YdH8UDP3vqmISHrej5m39Crs
 Xv/cFva8ZV+lCHgM/11F4ssN9+dAA9FSh9y7ouPNXJuwlVfaoVmosPk+95QWPJUgUesX
 Mal/gvsSAjzYMelM3uh4WKEOe2NAR4qDLSDb7oQPTsh6KOy7dLubHT8vjynp+UBPjhKt
 cLLA==
X-Gm-Message-State: APjAAAXnFjauPca9/TuyflPNOpjZwA5P/1FJl205CQSy/O4s7mLC4FQa
 WL7GxzaGgAEK0F3o8CQ68fQ=
X-Google-Smtp-Source: APXvYqwhmUGogOucSz0GTFgN4hK4KtNGpHpXYSrVaLSFvfBibdMrktSQ/h2BtSMLbLlPC5FCjArppw==
X-Received: by 2002:a1c:48c2:: with SMTP id v185mr3510049wma.61.1573065711454; 
 Wed, 06 Nov 2019 10:41:51 -0800 (PST)
Received: from x230 ([178.21.189.11])
 by smtp.gmail.com with ESMTPSA id b17sm3782443wrr.37.2019.11.06.10.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:41:50 -0800 (PST)
Date: Wed, 6 Nov 2019 19:41:48 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191106184148.GA25671@x230>
References: <20191105005341.19033-1-petr.vorel@gmail.com>
 <20191105005341.19033-2-petr.vorel@gmail.com>
 <20191105125819.GB8511@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105125819.GB8511@rei.lan>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] fanotify: Move __kernel_fsid_t definition to
 correct place
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Hi!
> > Fixes: b8aebc835 ("fanotify: Fix missing __kernel_fsid_t definition")

> Looks good, one minor comment below.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> >  testcases/kernel/syscalls/fanotify/fanotify.h | 20 ++++++++++---------
> >  1 file changed, 11 insertions(+), 9 deletions(-)

> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> > index 435f100d8..563a4eb5b 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> > @@ -116,6 +116,15 @@ struct fanotify_mark_type {
> >  	const char * name;
> >  };

> > +#ifdef HAVE_NAME_TO_HANDLE_AT
> > +#ifndef __kernel_fsid_t
> > +typedef struct {
> > +	int	val[2];
> > +} lapi_fsid_t;
> > +#define __kernel_fsid_t lapi_fsid_t
> > +#endif
> > +#endif /* HAVE_NAME_TO_HANDLE_AT */

> Can we please indent the inner ifdef/endif/define statements?

> It's done by spaces after the hash, so it should look like:

> #ifndef FOO
> # define bar
> # ifdef BAR
> code comes here
> and here
> # endif
> #endif
Sure, sorry for not remembering it.
I'll probably push this one once we agree on second patch.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
