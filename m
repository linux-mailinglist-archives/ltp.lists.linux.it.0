Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5A64274C
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Dec 2022 12:13:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 588CB3CC219
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Dec 2022 12:13:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D6CFE3CC44E
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 19:52:59 +0100 (CET)
Received: from mail.enpas.org (zhong.enpas.org [IPv6:2a03:4000:2:537::1])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7E6CE644E88
 for <ltp@lists.linux.it>; Thu,  1 Dec 2022 19:52:56 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail.enpas.org (Postfix) with ESMTPSA id A3484100AD8;
 Thu,  1 Dec 2022 18:52:49 +0000 (UTC)
Date: Fri, 2 Dec 2022 03:52:42 +0900
From: Max Staudt <max@enpas.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <20221202035242.155d54f4.max@enpas.org>
In-Reply-To: <20221201073426.17328-1-jirislaby@kernel.org>
References: <20221201073426.17328-1-jirislaby@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 05 Dec 2022 12:13:38 +0100
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
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Petr Vorel <petr.vorel@suse.com>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 ltp@lists.linux.it, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, dario.binacchi@amarulasolutions.com,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

(CC: ltp@lists.linux.it because Petr did so.)

Hi Jiry,

Thanks for finding this!


Your patch looks correct to me, so please have a

  Reviewed-by: Max Staudt <max@enpas.org>

for both this patch to slcan, as well as an 1:1 patch to can327.



Some history:

This is actually my code from can327, which was backported to slcan as
part of Dario's larger modernisation effort.

The rationale for moving it was to flush the UART TX buffer in case of
ndo_close(), in order to bring the device into a more predictable state
between ndo_close() and ndo_open(). I guess that's actually
counterproductive - whatever is in the TX buffer at that time should
likely be fully sent. For example, can327 sends one last byte to abort
any running chatty monitoring mode from the adapter. So your patch also
fixes this as well ;)

Of course, this resulted in calling flush_worker() in both ndo_stop()
and ldisc_close(), so I wanted to avoid code duplication, and relied on
ndo_stop(). Oops.



Thanks,

Max

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
