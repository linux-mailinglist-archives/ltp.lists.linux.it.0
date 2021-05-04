Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5233725F9
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 08:52:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F9B73C580D
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 08:52:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A01203C57ED
 for <ltp@lists.linux.it>; Tue,  4 May 2021 08:52:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B601968FF54
 for <ltp@lists.linux.it>; Tue,  4 May 2021 08:52:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A42C2B2CE;
 Tue,  4 May 2021 06:52:19 +0000 (UTC)
Date: Tue, 4 May 2021 08:52:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YJDvIcgdl8ae58YB@pevik>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

Hi Joerg,

[ Cc: Cyril and Li ]

> I am looking into getting rid of our custom patches for ltp.
> One of these patches fixes the problem, that the timeout sleep process is
> orphaned, if the test does not timeout.

> The kill code is not working as expected, because it only kills the shell
> process spawned by "sleep $sec && _tst_kill_test &".
> We are running single ltp tests using robot framework and robot waits unt=
il
> all processes of session have finished.

Interesting. Do you mean $_tst_setup_timer_pid from _tst_setup_timer was le=
ft
running if the test does not timeout? Because I was not able to find it.

> This can also be seen by piping the output of a testrun into cat (eg. with
> timeout02.sh from newlib_test/shell):
> $ time sh -c './timeout02.sh >/dev/null | cat'
> timeout02 1 TINFO: timeout per run is 0h 0m 2s
> timeout02 1 TPASS: timeout 2 set (LTP_TIMEOUT_MUL=3D'1')

> [snip]

> real=A0=A0=A0 0m2,011s


> The test does nothing, and completes in < 100ms. This can be seen without
> piping through cat:

> time sh -c 'PATH=3D"$PWD:$PWD/../../../testcases/lib/:$PATH" ./timeout02.=
sh'
> timeout02 1 TINFO: timeout per run is 0h 0m 2s
> timeout02 1 TPASS: timeout 2 set (LTP_TIMEOUT_MUL=3D'1')

> [snip]

> real=A0=A0=A0 0m0,010s

Interesting slowdown. It looks to me it's exit $ret in final _tst_do_exit()
takes so much time. I have no idea why, but it was here before 25ad54dba
("tst_test.sh: Run cleanup also after test timeout").



> I am not sure what the best approach for fixing these sleep orphans is. O=
ut
> patch uses "set -m" around the start of the timer, this makes most of the
> shells create a new process group, but it failed (at least did not work) =
in
> zsh. The killing of the timeout process is then changed to kill the proce=
ss
> group (kill -- -$_tst_setup_timer_pid).
> This works fine at least for some shells.
Please do send the patch. "set -m" is supported by dash and busbox sh, IMHO=
 it's
safe to use it.

> The only way to fix this really portable I can think of is moving the
> timeout code (including the logic in _tst_kill_test) into c code. This way
> there would only be one binary, that can be killed flawlessly.
Maybe set -m would be enough. But sure, rewriting C is usually the best app=
roach
for shell problems, we use quite a lot of C helpers for shell already.

> Do you have any other idea or do you think this "bug" is not relevant eno=
ugh
> to be fixed?

Kind regards,
Petr

> Thanks,
> Joerg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
