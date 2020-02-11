Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16695158CF2
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:52:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FF053C2544
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 11:52:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 42E8A3C2358
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:52:20 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 07E31201361
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 11:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581418329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2w7t/5peu/JOe7DzIFeB7C347Py/sZoQdcNXAUSBuk=;
 b=Ao2e8lbp2q19ba5xanAVniCcXrMLaDarMZeY8WY0VHdgsGZ82MWiG6HcIIFNvf0Vn2Ce0k
 PNW+4xRJaGs6q9WLmtoA7si03CVYCUWIMJ87dPG0dmpBat3hIZNNMp+RR8LRg/7zvTue2p
 InLiwy7ZAYNfbwX1n1cbrs245DcbCRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-uboKCLkjOam2J_3Qws49pg-1; Tue, 11 Feb 2020 05:52:07 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF03800D5E
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 10:52:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16A960BF1
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 10:52:06 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51EF51809565;
 Tue, 11 Feb 2020 10:52:06 +0000 (UTC)
Date: Tue, 11 Feb 2020 05:52:06 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
 <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.3]
Thread-Topic: syscalls/setrlimit06: lower RLIMIT_CPU parameters
Thread-Index: Am4WIhvA5TZh6qSlKTJqyoza7tzhoQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uboKCLkjOam2J_3Qws49pg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > Lower the parameters so that test completes faster where possible.
> >
> > This also increases alarm timer slightly, which in combination with
> > lower RLIMIT_CPU aims to avoid false positives in environments with
> > high steal time, where it can take multiple of wall clock seconds
> > to spend single second on a cpu.
> >
> 
> This patch could reduce the test failure possibility, but I'm afraid it
> can't fix the problem radically, because with `stress -c 20' to overload an
> s390x system(2cpus) in the background then setrlimit06(patched) still
> easily gets failed:
>     setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both limit
> 
> Another way I can think of is to raise the priority before its running, not
> sure if that will disturb the original test but from my test, it always
> gets a pass even with too much overload.

Is this in addition to my patch? Because on its own I don't see how this
will help when load is coming from different guests.

> 
> --- a/testcases/kernel/syscalls/setrlimit/setrlimit06.c
> +++ b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
> @@ -25,6 +25,7 @@
>  #include <sys/wait.h>
>  #include <stdlib.h>
>  #include <sys/mman.h>
> +#include <sys/resource.h>
> 
>  #include "tst_test.h"
> 
> @@ -37,6 +38,8 @@ static void sighandler(int sig)
> 
>  static void setup(void)
>  {
> +       setpriority(PRIO_PROCESS, 0, -20);
> +
>         SAFE_SIGNAL(SIGXCPU, sighandler);
> 
>         end = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE,
> @@ -110,6 +113,7 @@ static void verify_setrlimit(void)
>  }
> 
>  static struct tst_test test = {
> +       .needs_root = 1,
>         .test_all = verify_setrlimit,
>         .setup = setup,
>         .cleanup = cleanup,
> 
> --
> Regards,
> Li Wang
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
