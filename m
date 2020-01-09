Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A11355E7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:37:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8734A3C24D4
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:37:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F1C6F3C23EA
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:37:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7AA8E1400DBA
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:37:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A37F8BF9D;
 Thu,  9 Jan 2020 09:37:49 +0000 (UTC)
Date: Thu, 9 Jan 2020 09:21:02 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109082102.GA15119@dell5510>
References: <20200109071510.11223-1-liwang@redhat.com>
 <20200109074537.GA12486@dell5510>
 <CAEemH2dEfE5A8Dipu671TgzU0MxHF9hTRVeTNgMsi-igPbrDMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dEfE5A8Dipu671TgzU0MxHF9hTRVeTNgMsi-igPbrDMA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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

Hi Li,

> > > Cc: Petr Vorel <pvorel@suse.cz>
> > BTW I wonder if my sieve filter is bad, because I didn't get this mail or
> > git
> > send-email didn't sent it.


> I guess that might because of your email filter configuration, the
> Cc'ed name will be kicked out if he/she has subscribed to the mailing list,
> especially for my Gmail-client always do that.

> This is git-send-email log FYI:
> ----------------------------
> $ git send-email 0001-tst_device-use-raw-syscall-in-the-tst_device.h.patch
> --to ltp@lists.linux.it
> 0001-tst_device-use-raw-syscall-in-the-tst_device.h.patch
> (body) Adding cc: Petr Vorel <pvorel@suse.cz> from line 'Cc: Petr Vorel <
> pvorel@suse.cz>'
> (body) Adding cc: Cyril Hrubis <chrubis@suse.cz> from line 'Cc: Cyril
> Hrubis <chrubis@suse.cz>'
> OK. Log says:
> Server: smtp.corp.redhat.com
> MAIL FROM:<liwang@redhat.com>
> RCPT TO:<ltp@lists.linux.it>
> RCPT TO:<pvorel@suse.cz>
> RCPT TO:<chrubis@suse.cz>
> From: Li Wang <liwang@redhat.com>
> To: ltp@lists.linux.it
> Cc: Petr Vorel <pvorel@suse.cz>,
> Cyril Hrubis <chrubis@suse.cz>
> Subject: [PATCH] tst_device: use raw syscall in the tst_device.h
> Date: Thu,  9 Jan 2020 15:15:10 +0800
> Message-Id: <20200109071510.11223-1-liwang@redhat.com>
> X-Mailer: git-send-email 2.20.1
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit

> Result: 250

Thank you for info. Sorry, my fault (I had filter to List-Id: and *also* to To:
(normally I use just List-Id:, which is what I want).

> > +#define _GNU_SOURCE
> > >  #define _XOPEN_SOURCE 600
> > If we define _GNU_SOURCE we probably don't need _XOPEN_SOURCE 600, do we?


> Ah, right. I will remove it in patch merging.
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
