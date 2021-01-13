Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 210402F4072
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:54:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52F023C5451
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 01:54:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 10C653C5451
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:54:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9A42F1A00814
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 01:54:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E08A7AB9F
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:54:36 +0000 (UTC)
Date: Wed, 13 Jan 2021 01:54:35 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/5Ey68D0T8oYInJ@pevik>
References: <20210112132911.4031-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112132911.4031-1-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: epoll_pwait01: Work around a race
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

Hi Cyril,

> There was a race that would manifest on slower machines.

> The call to epoll_pwait() could time out before the child has chance to
> run, and that would cause the signal to be sent to the parent when it
> was already sleeping in wait().

> Ideally the whole test should be rewritten into new library and fixed
> properly, however as we are just before a release this is an attempt for
> a minimal fix.

> The logic in the test is changed so that:

> - epoll_wait() sleeps indefinitely
> - the child:
>   - waits for the parent to get asleep
>   - sends the signal
>   - sleeps
>   - writes to the pipe

> This causes the child to actually run, while the parent is blocked in
> the epoll_wait(), which greatly increases the changes of the signal
> arriving at the right time.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
LGTM.

> Fixes: #765

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
