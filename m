Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFA344F9D
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 20:08:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 586633C94ED
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 20:08:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9C4213C54DE
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 20:08:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 336DE140007F
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 20:08:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02BB5AE37;
 Mon, 22 Mar 2021 19:08:00 +0000 (UTC)
Date: Mon, 22 Mar 2021 20:07:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YFjrDTAePFgXZR6b@pevik>
References: <20210318131134.3562203-1-amir73il@gmail.com>
 <YFShR2Qd7Ubve1wi@pevik>
 <CAOQ4uxhLOqfarhXa-mnPnUtSXVUr1cpz79bm3TE6c5=4oo-Eeg@mail.gmail.com>
 <YFeo7vI58VMA6W7a@pevik>
 <CAOQ4uxjWTKncGxcOfT9XJ8REXZt9fdB7QsWRT74hUrB8mkNg-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjWTKncGxcOfT9XJ8REXZt9fdB7QsWRT74hUrB8mkNg-Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/8] fanotify tests for v5.13
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > > Whatever you think is best for your project users.
> > > If you want to document the commits that added the features, I suggest
> > > that you wait until those commits hit master (next cycle).
> > > These are the relevant commit subjects:

> > >    fanotify: configurable limits via sysfs
> > >    fanotify: support limited functionality for unprivileged users

> > Thanks a lot!
> > IMHO being in next tree should be ok (commits hashes should be kept).


> There is no such guarantee, certainly not so far from the v5.13 merge
> window, so I advise against including the commit ids at this point.
> The commit subject is descriptive enough IMO and you can add commit
> ids later on if you think it is necessary.

OK, make sense to wait with commit hashes. I'll merge it tomorrow as is (with
that formatting and fixing old kernel changes I posted earlier).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
