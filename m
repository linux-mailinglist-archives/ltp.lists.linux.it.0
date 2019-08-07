Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5F84A86
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 13:19:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DA163C1D2D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 13:19:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 23FE53C1860
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 13:19:53 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B5D6C1A0119D
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 13:19:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D87B669066
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 11:19:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8DA19C5B
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 11:19:49 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C45BF1800202;
 Wed,  7 Aug 2019 11:19:49 +0000 (UTC)
Date: Wed, 7 Aug 2019 07:19:49 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <965258526.5083471.1565176789563.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2e+qQuEXht_JPQdx+LrG7V3FWRZG6rPO8LGOcNVorC71Q@mail.gmail.com>
References: <76fa74b68aa0794f58e01d5794fffa3a02df0203.1565089789.git.jstancek@redhat.com>
 <CAEemH2e+qQuEXht_JPQdx+LrG7V3FWRZG6rPO8LGOcNVorC71Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.9]
Thread-Topic: clock_getres01: pass non-NULL res as parameter
Thread-Index: KBHUw+q/O3jnyO5stQV4OoNWoAuilg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 07 Aug 2019 11:19:49 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] clock_getres01: pass non-NULL res as parameter
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
> Hi Jan,
> 
> On Tue, Aug 6, 2019 at 7:11 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > Since commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer
> > checks")
> > VDSO treats NULL parameter differently than in syscall.
> >
> > Pass valid pointer. Subsequent patch will add test variants that test NULL
> > res parameter using syscall.
> >
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > ---
> >  testcases/kernel/syscalls/clock_getres/clock_getres01.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > index 15f32310839a..6b556965530e 100644
> > --- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > +++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> > @@ -28,7 +28,7 @@ static struct test_case {
> >         {"MONOTONIC", CLOCK_MONOTONIC, &res, 0, 0},
> >         {"PROCESS_CPUTIME_ID", CLOCK_PROCESS_CPUTIME_ID, &res, 0, 0},
> >         {"THREAD_CPUTIME_ID", CLOCK_THREAD_CPUTIME_ID, &res, 0, 0},
> > -       {"REALTIME", CLOCK_REALTIME, NULL, 0, 0},
> > +       {"REALTIME", CLOCK_REALTIME, &res, 0, 0},
> 
> If we change NULL to &res, it will be a duplicate of the first case.
> So my suggest here is to remove it directly, since patch2/2 has
> already added variants to test NULL via syscall.

Not sure how I didn't see that, but I agree that it can be dropped.

> 
> Otherwise, the patchset looks good.
> 
> >         {"CLOCK_MONOTONIC_RAW", CLOCK_MONOTONIC_RAW, &res, 0, 0,},
> >         {"CLOCK_REALTIME_COARSE", CLOCK_REALTIME_COARSE, &res, 0, 0,},
> >         {"CLOCK_MONOTONIC_COARSE", CLOCK_MONOTONIC_COARSE, &res, 0, 0,},
> > --
> > 1.8.3.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> 
> 
> --
> Regards,
> Li Wang
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
