Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A502FB356
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 08:42:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 636F53C308B
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 08:42:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 6C2513C0548
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 08:42:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6CC7B1400C5A
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 08:42:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E8EDABD6;
 Tue, 19 Jan 2021 07:42:01 +0000 (UTC)
Date: Tue, 19 Jan 2021 08:41:59 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YAaNR0PzZt5A1Fjm@pevik>
References: <20210118161308.30771-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210118161308.30771-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Fix kernel module detection on BusyBox
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
Cc: Steve Muckle <smuckle@google.com>, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> diff --git a/lib/tst_kernel.c b/lib/tst_kernel.c
...
> -int tst_check_driver(const char *name)
> +#ifndef __ANDROID__
> +# define MODULES_DIR "/lib/modules"
> +#else
> +# define MODULES_DIR "/system/lib/modules"
> +#endif

OK, MODULES_DIR is not needed now as I kept Android skipped (unless somebody
contributes code or share algorithm for Android).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
