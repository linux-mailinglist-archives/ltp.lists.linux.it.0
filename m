Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B72B0DEF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 20:25:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBA363C6596
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 20:25:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D95263C2ED7
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 20:25:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 66758200B8C
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 20:25:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C35BAB95;
 Thu, 12 Nov 2020 19:25:42 +0000 (UTC)
Date: Thu, 12 Nov 2020 20:25:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201112192540.GB14767@pevik>
References: <20201112165005.4022502-1-hch@lst.de>
 <20201112165005.4022502-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112165005.4022502-3-hch@lst.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] loop: Fix occasional uevent drop
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Martijn Coenen <maco@android.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Christoph,

> From: Petr Vorel <pvorel@suse.cz>
Thanks for rebasing my code. Using loop.c specific code in the file instead of
the function is indeed much better.

I also like your cleanup for 5.11 (remove the update_bdev parameter from
set_capacity_revalidate_and_notify).

> Commit 716ad0986cbd ("loop: Switch to set_capacity_revalidate_and_notify")
> causes an occasional drop of loop device uevent, which are no longer
> triggered in loop_set_size() but in a different part of code.

> Bug is reproducible with LTP test uevent01 [1]:

> i=0; while true; do
>     i=$((i+1)); echo "== $i =="
>     lsmod |grep -q loop && rmmod -f loop
>     ./uevent01 || break
> done

> Put back triggering through code called in loop_set_size().

> Fix required to add yet another parameter to
> set_capacity_revalidate_and_notify().
This ^ is no longer true and should be removed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
