Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F16758B883
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:26:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D47E3C1D25
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:26:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F3DA83C0752
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:26:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 58F0D100053D
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:26:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8543130FB8C3;
 Tue, 13 Aug 2019 12:26:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC977D4FA;
 Tue, 13 Aug 2019 12:26:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74BD5E202;
 Tue, 13 Aug 2019 12:26:10 +0000 (UTC)
Date: Tue, 13 Aug 2019 08:26:10 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <6520324.6276380.1565699170263.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190813121202.GB16005@rei.lan>
References: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
 <20190813121202.GB16005@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.13]
Thread-Topic: clock_getres01: drop case which is passing NULL res parameter
Thread-Index: ZdXPw6GXfns8FoKP4d+2xWBHgzdVSw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 13 Aug 2019 12:26:10 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] clock_getres01: drop case which is passing
 NULL res parameter
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi!
> > Since commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer
> > checks")
> > VDSO treats NULL parameter differently than in syscall.
> > 
> > Drop NULL parameter, subsequent patch will add test variants that test NULL
> > res parameter using syscall.
> > 
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  testcases/kernel/syscalls/clock_getres/clock_getres01.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > index 15f32310839a..df3e84271ad9 100644
> > --- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > +++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > @@ -28,7 +28,6 @@ static struct test_case {
> >  	{"MONOTONIC", CLOCK_MONOTONIC, &res, 0, 0},
> >  	{"PROCESS_CPUTIME_ID", CLOCK_PROCESS_CPUTIME_ID, &res, 0, 0},
> >  	{"THREAD_CPUTIME_ID", CLOCK_THREAD_CPUTIME_ID, &res, 0, 0},
> > -	{"REALTIME", CLOCK_REALTIME, NULL, 0, 0},
> 
> Shouldn't we keep the REALTIME clock here and pass the &res here
> instead?

Test already has that as 1st entry in tcase array:
   {"REALTIME", CLOCK_REALTIME, &res, 0, 0},

> Can we please print which variant we are about to test from the test
> setup() as well?

Sure, I'll add that.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
