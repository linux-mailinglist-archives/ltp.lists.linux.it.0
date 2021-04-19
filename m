Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801D363D00
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 09:52:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD2B63C6D6D
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 09:52:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4746D3C6D51
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 09:52:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 70CC71A027BE
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 09:52:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CF9DAE06;
 Mon, 19 Apr 2021 07:52:20 +0000 (UTC)
Date: Mon, 19 Apr 2021 09:52:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YH02siPsNaI1mtIW@pevik>
References: <20210415090542.960158-1-lkml@jv-coder.de> <YHnLrGS1lXy5Awvk@pevik>
 <1672a8d4-e278-801b-a2f6-babdc473f42e@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1672a8d4-e278-801b-a2f6-babdc473f42e@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] pec: Fix multiple event test
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi,

> On 4/16/2021 7:38 PM, Petr Vorel wrote:
> > Hi Joerg,

> > ...
> > > +# Find a free file handle
> > > +free_fd()
> > > +{
> > > +	local fd
> > > +
> > > +	for fd in $(seq 200); do
> > > +		# Sapwn a new sh, because redirecting to a non existing file handle
> > > +		# will trigger a syntax error.
> > > +		/bin/sh -c ": 2>/dev/null >&$fd || : 2>/dev/null <&$fd" 2>/dev/null
> > Probably better to use sh -c "..."
> I used=A0 /bin/sh, because that is the same interpreter specified in the
> shebang. Just using sh could theoretically fail or spawn a different shel=
l.
> Maybe $SHELL would be better, but I don't know how widely this is
> supported...
I meant that 'sh' is on any linux system /bin/sh (or a symlink to
/usr/bin/sh, i.e. a default shell. No need to specify it with full path.
We happily use elsewhere just sh, not /bin/sh.


> > > +		if [ $? -eq 2 ]; then
> > > +			echo $fd
> > > +			return
> > > +		fi
> > > +	done
> > maybe I do something wrong, but this version fails for me
> > (and I'm still testing it only on bash):

> > cn_pec 1 TINFO: timeout per run is 0h 5m 0s
> > cn_pec 1 TINFO: Test process events connector
> > cn_pec 1 TINFO: Testing fork event (nevents=3D10)
> > cn_pec 1 TBROK: No free filehandle found

> > I guess there is something wrong free_fd().

> Damn shells... I just realized /bin/sh on my system was dash's sh emulati=
on
> and it does not emulate sh the same way bash does...
Yes, unfortunately it's required to test shell tests at least on bash and d=
ash.

I also try to test on busybox sh (ash implementation), which commonly used =
on
embedded (it mostly works if dash works). Some time ago I tested even on an=
droid
shell, but I give up (expecting anybody playing with LTP on android should
install busybox).

> The return value in bash is 1, not two... Can you please check the patch
> with [ $? -ne 0 ]? That should work for all shells.
Yes it works. I'll have a look at the rest of the patch today.

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
