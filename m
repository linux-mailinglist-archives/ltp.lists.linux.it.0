Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F3372782
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 10:47:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAA483C5862
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 10:47:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76CA33C57EB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 10:47:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EC6BF200C19
 for <ltp@lists.linux.it>; Tue,  4 May 2021 10:47:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37014B240;
 Tue,  4 May 2021 08:47:18 +0000 (UTC)
Date: Tue, 4 May 2021 10:47:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YJEKFLmcKvnHvlIV@pevik>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik>
 <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Petr,
> > > The kill code is not working as expected, because it only kills the s=
hell
> > > process spawned by "sleep $sec && _tst_kill_test &".
> > > We are running single ltp tests using robot framework and robot waits=
 until
> > > all processes of session have finished.
> > Interesting. Do you mean $_tst_setup_timer_pid from _tst_setup_timer wa=
s left
> > running if the test does not timeout? Because I was not able to find it.
> Ups there was a bug in my command. Redirection of the output of the test =
to
> /dev/null does not trigger the long delay:
> Please try with time sh -c './timeout02.sh | cat'
> Sorry for that...

> The line "sleep $sec && _tst_kill_test &" spawns two processes:
> sleep and a shell process, that is (probably) forked from the running she=
ll.
> The pid returned by $! is the pid of this shell.
> When killing the timeout process, only this shell process, but not the sl=
eep
> is killed. That is also were the slowdown comes from.

> However, this might be shell implementation specific. At least for busybox
> sh and I think dash and bash the behavior is the same.

> > Interesting slowdown. It looks to me it's exit $ret in final _tst_do_ex=
it()
> > takes so much time. I have no idea why, but it was here before 25ad54dba
> > ("tst_test.sh: Run cleanup also after test timeout").
> I think what actually is consuming the time is the sleep process, that has
> stdout still opened.
> Redirecting the output of sleep to /dev/null, fixes the hanging, but there
> is still the orphaned sleep process lingering around.
> Try "sleep $sec >/dev/null && _tst_kill_test &"
Indeed, redirection helps. Interesting.

> $ ps; time sh -c 'PATH=3D"$PWD:$PWD/../../../testcases/lib/:$PATH"
> ./timeout02.sh | cat' ; ps
> =A0=A0=A0 PID TTY=A0=A0=A0=A0=A0=A0=A0=A0=A0 TIME CMD
> =A0=A0 2352 pts/5=A0=A0=A0 00:00:00 bash
> =A0 19981 pts/5=A0=A0=A0 00:00:00 ps
> timeout02 1 TINFO: timeout per run is 0h 0m 2s
> timeout02 1 TPASS: timeout 2 set (LTP_TIMEOUT_MUL=3D'1')

> Summary:
> passed=A0=A0 1
> failed=A0=A0 0
> broken=A0=A0 0
> skipped=A0 0
> warnings 0

> real=A0=A0=A0 0m0,013s
> user=A0=A0=A0 0m0,012s
> sys=A0=A0=A0 0m0,005s
> =A0=A0=A0 PID TTY=A0=A0=A0=A0=A0=A0=A0=A0=A0 TIME CMD
> =A0=A0 2352 pts/5=A0=A0=A0 00:00:00 bash
> =A0 19998 pts/5=A0=A0=A0 00:00:00 sleep
> =A0 20001 pts/5=A0=A0=A0 00:00:00 ps
Yep, you're right :(. Thanks a lot for your analysis!

> > > The only way to fix this really portable I can think of is moving the
> > > timeout code (including the logic in _tst_kill_test) into c code. Thi=
s way
> > > there would only be one binary, that can be killed flawlessly.
> > Maybe set -m would be enough. But sure, rewriting C is usually the best=
 approach
> > for shell problems, we use quite a lot of C helpers for shell already.
> I will send the patch, if this introduces any new issues, we can still
> switch to a c based implementation.
Thank you!

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
