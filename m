Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 755501D13EF
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 15:04:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A82F13C54FD
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 15:04:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C52453C180D
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:04:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5A1FC200B65
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:04:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DF10AE7F;
 Wed, 13 May 2020 13:04:13 +0000 (UTC)
Date: Wed, 13 May 2020 15:04:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200513130409.GA21234@dell5510>
References: <20200513123944.31411-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513123944.31411-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] pty04: Retry reads when short and wait longer
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

Hi Richard,

> Even though reads are blocking and packets are flipped into the netdevice
> buffer whole, it seems read may return before a full packet is read into user
> land. Retrying read should prevent timeouts and read failures on some
> machines.

> Also this increases the timeout to wait for the checkpoint to a large value
> because sometimes the kernel stalls, possibly while trying to (re)claim
> memory, and this causes the checkpoint wait to timeout and everything to be
> cleaned up. If the kernel is left in a stalled state, this can result in a
> stack trace which is more useful.

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reported-by: Jan Stancek <jstancek@redhat.com>
> Cc: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Great fix, thanks!

Tested on various kernels (5.7.0-rc4, 5.6, 5.3, 4.12, 4.4, 3.16, 3.10, 2.6.32)
on various distros and it got stack only on 2.6.32.

Going to wait little longer for a feedback and then merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
