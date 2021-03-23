Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B03457DA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 07:36:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B06E63C2986
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 07:36:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 18C313C287E
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 07:36:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A96F91000A2F
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 07:36:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A81C6AB8A;
 Tue, 23 Mar 2021 06:36:43 +0000 (UTC)
Date: Tue, 23 Mar 2021 07:36:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YFmMeXXgY0QEyttI@pevik>
References: <20210318131134.3562203-1-amir73il@gmail.com>
 <YFShR2Qd7Ubve1wi@pevik>
 <CAOQ4uxhLOqfarhXa-mnPnUtSXVUr1cpz79bm3TE6c5=4oo-Eeg@mail.gmail.com>
 <YFeo7vI58VMA6W7a@pevik>
 <CAOQ4uxjWTKncGxcOfT9XJ8REXZt9fdB7QsWRT74hUrB8mkNg-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjWTKncGxcOfT9XJ8REXZt9fdB7QsWRT74hUrB8mkNg-Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Merged + updated doc formatting for our doc generation.
Thanks for your work!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
