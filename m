Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC553726E0
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 10:02:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 148F13C5873
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 10:02:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D8E453C22AB
 for <ltp@lists.linux.it>; Tue,  4 May 2021 10:02:53 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 19E07200BCC
 for <ltp@lists.linux.it>; Tue,  4 May 2021 10:02:52 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 34C719FBF6;
 Tue,  4 May 2021 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620115371; bh=MzPfjW65Hb4sqRkaErL2Dpj2bLXoAX5Rnx1uDwFUt/Q=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=mkN/v70QYJHPbCWNYzgZu4uy5x8sA/0R2Pk9ZHM1JwCMANmoYwBh+O4+CQ+aHp0ed
 f1NbzA1dkfpTK6WQkdRM6We++Vo74dRgY3galbmUKZCotlfboZAQJcfBeUExmGkHqf
 Ji574Prj9SKL2mblWR9rRNm5yz4VsIaFPl5zifKM=
To: Petr Vorel <pvorel@suse.cz>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
Date: Tue, 4 May 2021 10:04:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJDvIcgdl8ae58YB@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,
>> The kill code is not working as expected, because it only kills the shell
>> process spawned by "sleep $sec && _tst_kill_test &".
>> We are running single ltp tests using robot framework and robot waits un=
til
>> all processes of session have finished.
> Interesting. Do you mean $_tst_setup_timer_pid from _tst_setup_timer was =
left
> running if the test does not timeout? Because I was not able to find it.
Ups there was a bug in my command. Redirection of the output of the test =

to /dev/null does not trigger the long delay:
Please try with time sh -c './timeout02.sh | cat'
Sorry for that...

The line "sleep $sec && _tst_kill_test &" spawns two processes:
sleep and a shell process, that is (probably) forked from the running =

shell. The pid returned by $! is the pid of this shell.
When killing the timeout process, only this shell process, but not the =

sleep is killed. That is also were the slowdown comes from.

However, this might be shell implementation specific. At least for =

busybox sh and I think dash and bash the behavior is the same.

> Interesting slowdown. It looks to me it's exit $ret in final _tst_do_exit=
()
> takes so much time. I have no idea why, but it was here before 25ad54dba
> ("tst_test.sh: Run cleanup also after test timeout").
I think what actually is consuming the time is the sleep process, that =

has stdout still opened.
Redirecting the output of sleep to /dev/null, fixes the hanging, but =

there is still the orphaned sleep process lingering around.
Try "sleep $sec >/dev/null && _tst_kill_test &"

$ ps; time sh -c 'PATH=3D"$PWD:$PWD/../../../testcases/lib/:$PATH" =

./timeout02.sh | cat' ; ps
 =A0=A0=A0 PID TTY=A0=A0=A0=A0=A0=A0=A0=A0=A0 TIME CMD
 =A0=A0 2352 pts/5=A0=A0=A0 00:00:00 bash
 =A0 19981 pts/5=A0=A0=A0 00:00:00 ps
timeout02 1 TINFO: timeout per run is 0h 0m 2s
timeout02 1 TPASS: timeout 2 set (LTP_TIMEOUT_MUL=3D'1')

Summary:
passed=A0=A0 1
failed=A0=A0 0
broken=A0=A0 0
skipped=A0 0
warnings 0

real=A0=A0=A0 0m0,013s
user=A0=A0=A0 0m0,012s
sys=A0=A0=A0 0m0,005s
 =A0=A0=A0 PID TTY=A0=A0=A0=A0=A0=A0=A0=A0=A0 TIME CMD
 =A0=A0 2352 pts/5=A0=A0=A0 00:00:00 bash
 =A0 19998 pts/5=A0=A0=A0 00:00:00 sleep
 =A0 20001 pts/5=A0=A0=A0 00:00:00 ps

>> The only way to fix this really portable I can think of is moving the
>> timeout code (including the logic in _tst_kill_test) into c code. This w=
ay
>> there would only be one binary, that can be killed flawlessly.
> Maybe set -m would be enough. But sure, rewriting C is usually the best a=
pproach
> for shell problems, we use quite a lot of C helpers for shell already.
I will send the patch, if this introduces any new issues, we can still =

switch to a c based implementation.

J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
