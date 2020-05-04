Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A201C464C
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 20:49:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A68E3C5840
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 20:49:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AEBE03C268F
 for <ltp@lists.linux.it>; Mon,  4 May 2020 20:49:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7C01960082E
 for <ltp@lists.linux.it>; Mon,  4 May 2020 20:49:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C3B3AC26;
 Mon,  4 May 2020 18:49:40 +0000 (UTC)
Date: Mon, 4 May 2020 20:49:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200504184936.GA92715@x230>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-3-amir73il@gmail.com>
 <20200504080715.GA1741@quack2.suse.cz>
 <CAOQ4uxgJQ2MGdnib9gvc=PcoWxveUpyqDZ1YybT-Hxrhba9ApQ@mail.gmail.com>
 <20200504141516.GC1741@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504141516.GC1741@quack2.suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/fanotify15: Add a test case for
 inode marks
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

...
> > > > The new test case is a regression test for commit f367a62a7cad:

> > > >     fanotify: merge duplicate events on parent and child

> > > The test looks OK but do we want a test for this? I mean: A test like this
> > > seems to imply we promise to merge identical events. Although that is a
> > > good general guideline, I consider it rather an optimization that may or
> > > may not happen but userspace should not rely on it. Thoughts?

> > The thing is, those are not really two identical events.
> > This is in fact the same event (fsnotify_change() hook was called once).
> > The fact that listener process may have an inode watch, parent directory
> > watch and a filesystem watch should not affect the number of read events.

> Yeah, I agree that in this case we should be merging the event if sanely
> possible (which is why I've merged that patch).

> > Now it's true that internally, fsnotify_dentry() emits two event flavors to
> > parent and to victim. For inotify it even made some sense, because listener
> > would read two different event flavors with two different formats.
> > With fanotify (either reporting fd or fid) receiving two events makes very
> > little sense.

> > I agree that the fix (merging those events) is best effort and we cannot
> > commit to merging the events, but this isolated regression test does
> > check the best effort fix reliably and this is the reason I think it
> > should stay.

> OK, I'm not too concerned about this test. But still the functionality is
> more in the area of "nice to have" than "must have" so in future we may
> break this if the implementation would get too hairy. But I guess we can
> remove the test in that case.
Yes, nothing is set in stone.

> > Upcoming FAN_REPORT_NAME is about to change the picture a bit
> > towards the inotify behavior - victim watch gets event without name,
> > parent watch gets event with name, filesystem watch gets both event
> > flavors... that is, if you will agree to this behavior, but we shall continue
> > this discussion on the fanotiify_name patches....

> Yes.
Can I add your ack tag to the whole patchset?
Or do you still consider whether any of them should be merged?

Kind regards,
Petr

> 								Honza

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
