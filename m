Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C516563ED58
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 11:13:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D8643CC4AE
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Dec 2022 11:13:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 202B53CC470
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 11:13:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 73FE21001865
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 11:13:38 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9BC11FD68;
 Thu,  1 Dec 2022 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669889617;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HK6pnCi1qP8FFtMs45m05rOGYvqXTvxdOjuW/EuRruE=;
 b=NxrdHspKyAj8UHpz/Lx5228Q9gSwTfKblU+hpaFVDzHXNTPxcbg/My1NUxNzXcJNdnMtH4
 wmIGrKXGoN5ug8EHCbKfCBfIWZZqe38Q7nW5QCC9n4/P0YXap7XxjkiogrXTLaWr7erOcs
 m8HIj7DZTw2Zse2xGBZH9p7Cm7pHOt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669889617;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HK6pnCi1qP8FFtMs45m05rOGYvqXTvxdOjuW/EuRruE=;
 b=Tv+TFKMVJqS7anEln+zoivlMe9cY38Lal8ihZOtRCNaNknRxo7pu6kzp5EP2BZbvoEBdJS
 Pcj/xKFM2pttjhBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 5EB751320E;
 Thu,  1 Dec 2022 10:13:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vJPFFVF+iGOHJQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 01 Dec 2022 10:13:37 +0000
Date: Thu, 1 Dec 2022 11:13:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <Y4h+T54ghKFPmkqO@pevik>
References: <20221201073426.17328-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201073426.17328-1-jirislaby@kernel.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] can: slcan: fix freed work crash
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
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Petr Vorel <petr.vorel@suse.com>,
 Max Staudt <max@enpas.org>, Eric Dumazet <edumazet@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, ltp@lists.linux.it,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 dario.binacchi@amarulasolutions.com, "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

Cc LTP mailing list.
Jiri, thanks a lot for quick fix!

Kind regards,
Petr

> The LTP test pty03 is causing a crash in slcan:
>   BUG: kernel NULL pointer dereference, address: 0000000000000008
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   PGD 0 P4D 0
>   Oops: 0000 [#1] PREEMPT SMP NOPTI
>   CPU: 0 PID: 348 Comm: kworker/0:3 Not tainted 6.0.8-1-default #1 openSUSE Tumbleweed 9d20364b934f5aab0a9bdf84e8f45cfdfae39dab
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.15.0-0-g2dd4b9b-rebuilt.opensuse.org 04/01/2014
>   Workqueue:  0x0 (events)
>   RIP: 0010:process_one_work (/home/rich/kernel/linux/kernel/workqueue.c:706 /home/rich/kernel/linux/kernel/workqueue.c:2185)
>   Code: 49 89 ff 41 56 41 55 41 54 55 53 48 89 f3 48 83 ec 10 48 8b 06 48 8b 6f 48 49 89 c4 45 30 e4 a8 04 b8 00 00 00 00 4c 0f 44 e0 <49> 8b 44 24 08 44 8b a8 00 01 00 00 41 83 e5 20 f6 45 10 04 75 0e
>   RSP: 0018:ffffaf7b40f47e98 EFLAGS: 00010046
>   RAX: 0000000000000000 RBX: ffff9d644e1b8b48 RCX: ffff9d649e439968
>   RDX: 00000000ffff8455 RSI: ffff9d644e1b8b48 RDI: ffff9d64764aa6c0
>   RBP: ffff9d649e4335c0 R08: 0000000000000c00 R09: ffff9d64764aa734
>   R10: 0000000000000007 R11: 0000000000000001 R12: 0000000000000000
>   R13: ffff9d649e4335e8 R14: ffff9d64490da780 R15: ffff9d64764aa6c0
>   FS:  0000000000000000(0000) GS:ffff9d649e400000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 0000000000000008 CR3: 0000000036424000 CR4: 00000000000006f0
>   Call Trace:
>    <TASK>
>   worker_thread (/home/rich/kernel/linux/kernel/workqueue.c:2436)
>   kthread (/home/rich/kernel/linux/kernel/kthread.c:376)
>   ret_from_fork (/home/rich/kernel/linux/arch/x86/entry/entry_64.S:312)

> Apparently, the slcan's tx_work is freed while being scheduled. While
> slcan_netdev_close() (netdev side) calls flush_work(&sl->tx_work),
> slcan_close() (tty side) does not. So when the netdev is never set UP,
> but the tty is stuffed with bytes and forced to wakeup write, the work
> is scheduled, but never flushed.

> So add an additional flush_work() to slcan_close() to be sure the work
> is flushed under all circumstances.

> The Fixes commit below moved flush_work() from slcan_close() to
> slcan_netdev_close(). What was the rationale behind it? Maybe we can
> drop the one in slcan_netdev_close()?

> I see the same pattern in can327. So it perhaps needs the very same fix.

> Fixes: cfcb4465e992 ("can: slcan: remove legacy infrastructure")
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1205597
> Reported-by: Richard Palethorpe <richard.palethorpe@suse.com>
> Tested-by: Petr Vorel <petr.vorel@suse.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: stable@vger.kernel.org
> Cc: Max Staudt <max@enpas.org>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> ---
>  drivers/net/can/slcan/slcan-core.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

> diff --git a/drivers/net/can/slcan/slcan-core.c b/drivers/net/can/slcan/slcan-core.c
> index fbb34139daa1..f4db77007c13 100644
> --- a/drivers/net/can/slcan/slcan-core.c
> +++ b/drivers/net/can/slcan/slcan-core.c
> @@ -864,12 +864,14 @@ static void slcan_close(struct tty_struct *tty)
>  {
>  	struct slcan *sl = (struct slcan *)tty->disc_data;

> -	/* unregister_netdev() calls .ndo_stop() so we don't have to.
> -	 * Our .ndo_stop() also flushes the TTY write wakeup handler,
> -	 * so we can safely set sl->tty = NULL after this.
> -	 */
>  	unregister_candev(sl->dev);

> +	/*
> +	 * The netdev needn't be UP (so .ndo_stop() is not called). Hence make
> +	 * sure this is not running before freeing it up.
> +	 */
> +	flush_work(&sl->tx_work);
> +
>  	/* Mark channel as dead */
>  	spin_lock_bh(&sl->lock);
>  	tty->disc_data = NULL;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
