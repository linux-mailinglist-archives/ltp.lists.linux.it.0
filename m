Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E2C2D1378
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:22:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 440AE3C628B
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:22:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 58B413C2D09
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:22:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 60E8E2009DB
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:22:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D08DAF03;
 Mon,  7 Dec 2020 14:22:41 +0000 (UTC)
Date: Mon, 7 Dec 2020 15:22:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X846sHuckxS/lLEV@pevik>
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
 <X84VqaD4+FqAix5h@pevik>
 <CAOQ4uxiCtAJVyVau3un2AnMNmn1Yub18sG10YopLRySmLAcpnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxiCtAJVyVau3un2AnMNmn1Yub18sG10YopLRySmLAcpnw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
> > > In preparation of testing events with filename info, teach the
> > > how to read variable length events and parse the name info.

> > This commit broke umount() on old kernels. (LTP lib doing multiple attempts is
> > useless here). Not sure what exactly is being used, it's not by staing in
> > mounted directory. Any idea how to fix it?


> --- a/testcases/kernel/syscalls/fanotify/fanotify09.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
> @@ -265,6 +265,7 @@ static void test_fanotify(unsigned int n)
>         for (i = 1; i < NUM_GROUPS; i++) {
>                 ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
>                 if (ret > 0) {
> +                       event = (struct fanotify_event_metadata *)event_buf;
>                         event_res(TFAIL, i, event, "");
>                         if (event->fd != FAN_NOFD)
>                                 SAFE_CLOSE(event->fd);

> The fix exists in the following patch, therefore I did not notice the
> mid series regression.
While this is valid to be added in this commit and I'll add it, it does not fix
our solution. I might not be clear: since this commit it's broken.
Thus any other tip?

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
