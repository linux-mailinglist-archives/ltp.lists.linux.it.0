Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2E376775
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 17:02:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 676593C8D2A
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 17:02:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 952BA3C5630
 for <ltp@lists.linux.it>; Fri,  7 May 2021 17:02:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 289C260211C
 for <ltp@lists.linux.it>; Fri,  7 May 2021 17:02:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61EDCAE86
 for <ltp@lists.linux.it>; Fri,  7 May 2021 15:02:41 +0000 (UTC)
Date: Fri, 7 May 2021 17:02:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YJVWj39Fx/nVa31a@pevik>
References: <20210505153847.6106-1-mdoucha@suse.cz>
 <20210505153847.6106-2-mdoucha@suse.cz>
 <20210505164757.GC9615@quack2.suse.cz>
 <32425668-9713-c216-38b1-46b57fce2197@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32425668-9713-c216-38b1-46b57fce2197@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/inotify06: Raise inotify instance
 limit in /proc
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin, Jan,

> On 05. 05. 21 18:47, Jan Kara wrote:
> > On Wed 05-05-21 17:38:47, Martin Doucha wrote:
> >> inotify_init() sometimes fails with EMFILE because there are too many
> >> partially closed instances waiting for garbage collection. Bump the limit
> >> in /proc/sys/fs/inotify/max_user_instances for the duration of the test.

> >> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> >> ---

> >> I thought about only reading the procfile and calling yield() after every
> >> proc_limit/2 iterations to wait for garbage collection but I'm afraid that
> >> it might reduce the likelihood of triggering the bug. Since I currently have
> >> no system where I could reproduce the race, I've decided to play it safe and
> >> bump the /proc limit.

> > So waiting would be fine as well. One process simply creates & deletes
> > files in a loop until the other performs TEARDOWNS teardowns. It doesn't
> > really matter how fast teardowns happen for the race to trigger. But I have
> > no problem with this solution either.

> Let's go with the patch as is then. Like I said, when I don't have a
> system where the issue is reproducible, I prefer to play it safe.

Make sense, merged. Thank you both for fixing and review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
