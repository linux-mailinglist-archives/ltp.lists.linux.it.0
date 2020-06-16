Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 019091FBA79
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 18:12:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB9E53C2D02
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 18:12:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8331B3C0887
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 18:12:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E289F14016FF
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 18:11:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2A06EAB7D;
 Tue, 16 Jun 2020 16:11:56 +0000 (UTC)
Date: Tue, 16 Jun 2020 18:11:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200616161150.GA20634@dell5510>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
 <7616a6fa4f1502dde4417d33aa88836c8020419e.1592302358.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7616a6fa4f1502dde4417d33aa88836c8020419e.1592302358.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 5/6] include: Add declaration of struct
 msqid64_ds
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> +++ b/configure.ac
> @@ -153,6 +153,7 @@ AC_CHECK_TYPES([struct iovec],,,[#include <sys/uio.h>])
>  AC_CHECK_TYPES([struct ipc64_perm],,,[#include <sys/ipcbuf.h>])
>  AC_CHECK_TYPES([struct semid64_ds],,,[#include <sys/sem.h>])
>  AC_CHECK_TYPES([struct shmid64_ds],,,[#include <sys/shmbuf.h>])
> +AC_CHECK_TYPES([struct msqid64_ds],,,[#include <sys/msgbuf.h>])

NOTE (for next time): we try to keep items in configure.ac alphabetically sorted :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
