Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9594100D2D
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 21:33:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ED033C1C91
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 21:33:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 261543C12F2
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:33:45 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EC0A2604852
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:33:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43195B372;
 Mon, 18 Nov 2019 20:33:44 +0000 (UTC)
Date: Mon, 18 Nov 2019 21:33:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20191118203342.GD2531@x230>
References: <20191116002003.13013-1-petr.vorel@gmail.com>
 <977310824.12699736.1573924977430.JavaMail.zimbra@redhat.com>
 <20191117100401.GB22986@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191117100401.GB22986@x230>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify: Fix for musl
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

Hi,

> > If it's needed for __kernel_fsid_t we'll need to come up with better names.
> +1. But hope this is not needed.

> > This basically reverts part of previous patch, which looks ok to me.
> Yep. I'll add this to commit message, to be obvious.

> > Acked-by: Jan Stancek <jstancek@redhat.com>

> Thanks for your review.
> I'll wait with merge till Monday (if Cyril has some comments).

Merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
