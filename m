Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D7AB356
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Sep 2019 09:41:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E1443C183A
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Sep 2019 09:41:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C36FA3C14F6
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 09:41:00 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 146C520EB51
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 09:40:59 +0200 (CEST)
Received: from aoxwin10L19052002 (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D00019F67E
 for <ltp@lists.linux.it>; Fri,  6 Sep 2019 07:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1567755658; bh=dQXiHP8pdFxmRAnuycBwrHR1NkMnF98qG0czKC89ods=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=S87eAneDjzVJE5+wd3tI9Y2fci4NHLj+cfdESu/Zmp1++TLF9a2N8xaFXOswYcZPz
 /H/7UK4UPYpgajZUDYr135BBqzChREz43AWMtMpM1mwo0wy9zdIXAqePRXjRtfEetE
 KyfgiarN/8/HKpBEeTZEqvD9J4+q2OUfzE87WfaI=
From: "Jorg Vehlow" <lkml@jv-coder.de>
To: <ltp@lists.linux.it>
Date: Fri, 6 Sep 2019 09:40:58 +0200
Message-ID: <015a01d56486$6c905050$45b0f0f0$@jv-coder.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AdVj5/TiwuA/yWJdTpeLdXI54KxsLg==
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] sched_football: Validity of testcase
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I was looking thoroughly at the realtime testcase sched_football, =

because it sometimes fails and like to know your opinion on the test case.

A short introduction to how the test works:
It creates nThreads threads called offense and n threads called defense
(all fifo scheduled). The offense threads run at a lower priority than
the defense threads and the main thread has the highest priority. After =

all threads are created (validated using an atomic counter). The test =

verifies, that the offense threads are never executed by incrementing =

a counter in the offense threads, that is zeroed in the main thread. =

During the test the main threads sleeps to regularly. =


While the test is totally fine on a single core system, you can =

immediately see, that it will fail on a system with nCores > nThreads, =

because there will be a core were only an offense thread an no defense =

thread is scheduled. In its default setup nThreads =3D nCores. This should =

theoretically work, because there is a defense thread for every score with =

a higher priority than the offense threads and they should be scheduled
onto  every core. This is indeed what happens. The problem seems to be =

the  initialization phase. When the threads are created, they are not =

evenly scheduled. After pthread_create was called, the threads are scheduled

too cores where nothing is running. If there is no idle core anymore, they
are
scheduled to any core (the first?, the one with the shortest wait queue?).
At
some point after all threads are created, they are rescheduled to every
core.
It looks like the test fails, when there is initially a core with only an
offense thread scheduled onto it. In perf sched traces I saw, that a defense
thread was migrated to this core, but still the offense thread was executed
for
a short time, until the offense thread runs. From this point onwards only
defense threads are running.

I tested adding a sleep to the main function, after all threads are created,
to give the system some time for rescheduling. A sleep of around 50ms works
quite well and supports my theory about the migration time being the
problem.

Now I am not sure if the test case is even valid or if the scheduler is not
working as it is supposed to. Looking at the commits of sched_football it =

looks like it was running stable at least at some point, at least it es =

reported to have run 15k iterations in e6432e45.
What do you think about the test case? Is it even valid?
Should the cpu affinity be set fixed?

A note about my testing methodology:
After I realized, that the execution often failed due to the offense thread
running after referee set the_ball to 0, I replaced the loop with just
usleep(10000), for faster iteration.
I tested on ubuntu 19.04 with linux 5.0.0-27 running in vmware and =

a custom yocto distribution running linux 4.19.59 (with and without rt
patches)

J=F6rg


-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
