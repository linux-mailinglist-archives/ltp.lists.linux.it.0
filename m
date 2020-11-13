Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE862B252C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 21:12:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B1603C5FD4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 21:12:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0AAA63C2EC2
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 21:12:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9C1D0600668
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 21:12:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE771ABD9;
 Fri, 13 Nov 2020 20:12:28 +0000 (UTC)
Date: Fri, 13 Nov 2020 21:12:27 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20201113201227.GA92818@pevik>
References: <20201113155123.5959-1-pvorel@suse.cz>
 <20201113155123.5959-3-pvorel@suse.cz>
 <CAOQ4uxixL6f2hApFUjgO2d1ZOstftQwn8-y4dN6Qcd6RE-oyWA@mail.gmail.com>
 <CAOQ4uxhWOaarVWE6r_EgvtqSV83WeVghp+crAMo5UpC4KxeP9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhWOaarVWE6r_EgvtqSV83WeVghp+crAMo5UpC4KxeP9Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/5] fanotify: Handle supported features checks
 in setup()
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > > +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> > > @@ -212,28 +212,23 @@ static int setup_mark(unsigned int n)
> > >         char *const files[] = {fname, FILE_EXEC_PATH};

> > >         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> > > +
> > > +       if (support_exec_events != 0 && tc->mask & FAN_OPEN_EXEC_PERM) {
> > > +               tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC_PERM not supported in kernel?");
> > > +               return -1;
> > > +       }
> > > +

> Please remove the comment above tcases[] definition:
> "Ensure to keep the first..."

> It is no longer needed after this change.
+1 (this one is easy).
FYI I've sent v3, but that does not address your comments
(just fixes failure).

I'll have look into your comments next week.

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
