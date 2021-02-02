Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3B30BBE1
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 11:15:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFC1E3C746E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 11:15:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B43053C2EE3
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 11:15:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 39FF31400DB9
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 11:15:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C1C6AD29;
 Tue,  2 Feb 2021 10:15:32 +0000 (UTC)
Date: Tue, 2 Feb 2021 11:15:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YBkmQl1lFmxbdpcb@pevik>
References: <20210202074753.31516-1-pvorel@suse.cz>
 <47060cdf-58a3-2568-3508-31436b9c6e12@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47060cdf-58a3-2568-3508-31436b9c6e12@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Run cleanup also on timeout
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi J=F6rg,

> Hi,

> On 2/2/2021 8:47 AM, Petr Vorel wrote:
> > Also timeout requires to run a test cleanup (e.g. zram01.sh).
> > Thus send first SIGINT, but keep also SIGKILL for safety reasons
> > (after 5 sec to give cleanup function some time.
> +1
> > diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> > index 69f007d89..35ad6d2d7 100644
> > --- a/testcases/lib/tst_test.sh
> > +++ b/testcases/lib/tst_test.sh
> > @@ -21,7 +21,7 @@ export TST_LIB_LOADED=3D1
> >   . tst_security.sh
> >   # default trap function
> > -trap "tst_brk TBROK 'test interrupted'" INT
> > +trap "tst_brk TBROK 'test interrupted or timeout'" INT
> should be "timed out" for consistency
You probably mean consistency with TST_RETRY_FN_EXP_BACKOFF()
I tried to be consistent with previous message:
zram01 1 TBROK: test killed, timeout! If you are running on slow machine, t=
ry exporting LTP_TIMEOUT_MUL > 1
That one should be changed as well.
I slightly prefer "timeout", but I'm not a native speaker.

> >   _tst_do_exit()
> >   {
> > @@ -459,7 +459,7 @@ _tst_setup_timer()
> >   	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
> > -	sleep $sec && tst_res TBROK "test killed, timeout! If you are running=
 on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && kill -9 -$pid &
> > +	sleep $sec && tst_res TBROK "test killed, timeout! If you are running=
 on slow machine, try exporting LTP_TIMEOUT_MUL > 1" && { kill -2 -$pid; sl=
eep 5; kill -9 -$pid; } &
> Can we move the timeout handling to a separate function? This is getting a
> tiny bit unreadable...
> Can this work?:
> _tst_handle_timeout()
> {
> =A0=A0=A0 tst_res TBROK ...
> =A0=A0=A0 kill ....
> }
> ...
> sleep $sec && _tst_handle_timeout &
+1.

Thanks!

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
