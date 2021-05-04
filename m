Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A2372CBA
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:07:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F89A3C5868
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:07:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 565833C57D7
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:07:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 531A4200D4C
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:07:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A75DDAFCC;
 Tue,  4 May 2021 15:07:17 +0000 (UTC)
Date: Tue, 4 May 2021 17:07:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YJFjJGTpxUNAMroo@pevik>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik>
 <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
 <YJEKFLmcKvnHvlIV@pevik>
 <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Shell API timeout sleep orphan processes
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

Hi Joerg,

> Hi Petr,

> > > > > The only way to fix this really portable I can think of is moving the
> > > > > timeout code (including the logic in _tst_kill_test) into c code. This way
> > > > > there would only be one binary, that can be killed flawlessly.
> > > > Maybe set -m would be enough. But sure, rewriting C is usually the best approach
> > > > for shell problems, we use quite a lot of C helpers for shell already.
> > > I will send the patch, if this introduces any new issues, we can still
> > > switch to a c based implementation.
> > Thank you!

> I guess I will not submit the fix with set -m...
> My colleague working testing on a new target just ran into a problem with
> out fix using set -m.
> For busybox sh, it only works, if a tty is allocated, otherwise it refuses
> to enable job monitor mode and the whole construct fails...
OK, C will be needed (unless anybody has an idea how to safely implement it in
shell).

> Since using the monitor mode only exploits the side effect, that it creates
> a process group and we already found a first issue, I think the only
> solution is switching to a c-based solution for the timeout stuff.
> Personally I like that it is written in shell script, but I see no other
> option to do it in pure shell. There is no builtin way, to create a process
> group and just redirecting the output of sleep to null does not seem to be a
> very good solution to me, because there would still be a lot of orphans
> around.

There will be git freeze in very soon, so I guess the fix won't make it to the
release (unless you have time to work on it next week).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
