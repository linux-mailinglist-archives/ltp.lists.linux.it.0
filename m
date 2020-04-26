Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5841B8DC4
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 10:05:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F3C1B3C2888
	for <lists+linux-ltp@lfdr.de>; Sun, 26 Apr 2020 10:05:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E114F3C226C
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 10:05:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3C2411401A34
 for <ltp@lists.linux.it>; Sun, 26 Apr 2020 10:05:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D0BCAC2C;
 Sun, 26 Apr 2020 08:05:28 +0000 (UTC)
Date: Sun, 26 Apr 2020 10:05:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200426080526.GA203542@x230>
References: <20200421180002.11351-1-pvorel@suse.cz>
 <dab04fc5-5d20-3dbc-c21f-535112ab222f@oracle.com>
 <20200423221245.GA1391884@x230> <20200424121116.GA25613@dell5510>
 <CAEemH2f1_6BFuTfrGZ2qpbLidFXxB2EQEO43TjucaMTPM9ghuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f1_6BFuTfrGZ2qpbLidFXxB2EQEO43TjucaMTPM9ghuw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] net/sendfile01.sh: Check with timeout
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

Hi Li,

> > > > old api, not sure why exactly it was removed in the new one...
> > > It was designed from scratch I guess.
> > > But this patch makes sense to me, I'll test it tomorrow.

> > Actually, I now consider a bit cleaner and safer solution to *not* use eval
> > and require test to specify function. E.g.:


> Why not use eval for that? It helps us to perform more commands directly
> without wrap into function.


> > +retry_fnc()
> > +{
> > +       tst_rhost_run -c 'ss -ltp' | grep -q "$port.*testsf"
> > +}
> > +
> >  do_setup()
> >  {

> > @@ -28,7 +33,7 @@ do_setup()
> >         tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
> >         server_started=1
> >         tst_res TINFO "wait for the server to start"
> > -       sleep 1
> > +       TST_RETRY_FUNC retry_fnc 0
> >  }

> > Instead of simple:

> >  do_setup()
> > @@ -28,7 +28,7 @@ do_setup()
> >         tst_rhost_run -s -b -c "$server $(tst_ipaddr rhost) $port"
> >         server_started=1
> >         tst_res TINFO "wait for the server to start"
> > -       sleep 1
> > +       TST_RETRY_FUNC "tst_rhost_run -c 'ss -ltp' | grep -q
> > '$port.*testsf'" 0
> >  }

> > But I don't have strong opinion on it.
> > Cyril, Li, any preference?


> If no more strict reasons I prefer to go the simpler way. And there is no
> need to wrap a retry_fun() I think.

I'm a bit careful and try to avoid eval in scripts for security reasons.
But ok, LTP code is a bit different from running shell scripts on the server,
security does not matters on SUT, so I'm not against it. I just wanted to hear
more opinions on that, thanks for your comment.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
