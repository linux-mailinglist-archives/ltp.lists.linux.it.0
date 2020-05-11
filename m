Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB201CD400
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 10:33:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1E9B3C560D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 10:33:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DF8EA3C24FD
 for <ltp@lists.linux.it>; Mon, 11 May 2020 10:33:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 22950682AF9
 for <ltp@lists.linux.it>; Mon, 11 May 2020 10:33:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C72BFAC5B;
 Mon, 11 May 2020 08:33:38 +0000 (UTC)
Date: Mon, 11 May 2020 10:33:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200511083334.GA23004@dell5510>
References: <cover.1588942426.git.agordeev@linux.ibm.com>
 <8f28b9797be3408c0c1086d0a2bc9c052b55bfe2.1588942426.git.agordeev@linux.ibm.com>
 <475724112.11805789.1588947614752.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <475724112.11805789.1588947614752.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib/cloner.c: Use __clone instead of clone
 for s390
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

> ----- Original Message -----
> > The kernel sys_clone and s390 glibc entry __clone assume
> > the flags parameter type as unsigned long. However, the
> > glibc clone wrapper used by ltp_clone helper defines flags
> > as signed int. That leads to gcc extending CLONE_IO flag of
> > 0x80000000 value to 0xffffffff80000000.

> Same problem exists on ppc64le. There's a patch proposed to fix this on
> kernel side:
>   https://lore.kernel.org/lkml/20200507103214.77218-1-christian.brauner@ubuntu.com/

> Earlier discussion is here:
>   https://sourceware.org/pipermail/libc-alpha/2020-May/113596.html

OK instead of merging whole patchset we should add git commit hash once this fix is
merged (although no reply since v2 post).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
