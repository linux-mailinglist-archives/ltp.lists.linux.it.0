Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E162AF467
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:06:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 531AC3C6032
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 16:06:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BF2AC3C2F2E
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:06:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 69DAA140076E
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 16:06:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB663AC82;
 Wed, 11 Nov 2020 15:06:36 +0000 (UTC)
Date: Wed, 11 Nov 2020 16:06:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201111150635.GA4291@pevik>
References: <20201110180533.28595-1-kory.maincent@bootlin.com>
 <20201111144005.GA3358@pevik>
 <5fab0669-9597-8e20-4f6b-3c21da0e125c@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fab0669-9597-8e20-4f6b-3c21da0e125c@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory, Alexey,

> >> The ping from busybox does not have -f parameter, use -i parameter instead.
> >> BusyBox does not accept pattern longer than 2 bytes.
> >> BusyBox support -i option since version 1.30

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> > Tested-by: Petr Vorel <pvorel@suse.cz>

> > LGTM.

> > I suggest to merge with few changes below.

> > * more precise message "ping from old busybox?"
> > * use just $(tst_ipaddr rhost) instead of $ipaddr
> > (some time ago we've started to use function calls for these simple evaluations)
> > * upper case for global variable (ugly, but easily recognizable

> Hi Petr,

> Feel free to add the style changes, ack. I've already applied the patch.

> Thanks Kory!

Let's leave it as it is, not that important.
Thanks a lot both.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
