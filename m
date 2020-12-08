Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAE2D245B
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 08:31:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FE343C2BDD
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Dec 2020 08:31:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 79C1A3C2350
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 08:31:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1EF196008EC
 for <ltp@lists.linux.it>; Tue,  8 Dec 2020 08:30:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C08AAB63;
 Tue,  8 Dec 2020 07:30:59 +0000 (UTC)
Date: Tue, 8 Dec 2020 08:30:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X88rsF3xHgtqzP3t@pevik>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
 <X84VqaD4+FqAix5h@pevik>
 <CAOQ4uxiCtAJVyVau3un2AnMNmn1Yub18sG10YopLRySmLAcpnw@mail.gmail.com>
 <X846sHuckxS/lLEV@pevik>
 <CAOQ4uxhWB6Gq2SinwbKJ=PmkO=EWtcvLoF71GDPit8V=B+17EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhWB6Gq2SinwbKJ=PmkO=EWtcvLoF71GDPit8V=B+17EQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/fanotify09: Read variable length
 events
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

...
> > > The fix exists in the following patch, therefore I did not notice the
> > > mid series regression.
> > While this is valid to be added in this commit and I'll add it, it does not fix
> > our solution. I might not be clear: since this commit it's broken.
> > Thus any other tip?

> So both a mid series regression and full series regression.
> Lovely :)

> Following patch needs this fix:

> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -280,6 +280,7 @@ static void test_fanotify(unsigned int n)

>                         event = (struct fanotify_event_metadata *)event_buf;
>                         verify_event(i, event, expect, "");
> +                       event = FAN_EVENT_NEXT(event, ret);

>                         for (; FAN_EVENT_OK(event, ret);
> FAN_EVENT_NEXT(event, ret)) {
>                                 if (event->fd != FAN_NOFD)

> Pushed full fix series (including un-posted inotify test) to:
> https://github.com/amir73il/ltp/commits/fsnotify-fixes

Thanks! I was wrong, next commit was broken due missing this,
as you had correctly fixed in your LTP fork.

Anyway, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
