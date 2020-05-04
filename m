Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A60F1C4838
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 22:27:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91A7F3C585F
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 22:27:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 64A383C2660
 for <ltp@lists.linux.it>; Mon,  4 May 2020 22:27:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 23DB410000F6
 for <ltp@lists.linux.it>; Mon,  4 May 2020 22:27:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 25A5FABD0;
 Mon,  4 May 2020 20:27:30 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id ABDE11E12B0; Mon,  4 May 2020 22:27:27 +0200 (CEST)
Date: Mon, 4 May 2020 22:27:27 +0200
From: Jan Kara <jack@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200504202727.GC17863@quack2.suse.cz>
References: <20200502162744.9589-1-amir73il@gmail.com>
 <20200502162744.9589-3-amir73il@gmail.com>
 <20200504080715.GA1741@quack2.suse.cz>
 <CAOQ4uxgJQ2MGdnib9gvc=PcoWxveUpyqDZ1YybT-Hxrhba9ApQ@mail.gmail.com>
 <20200504141516.GC1741@quack2.suse.cz>
 <20200504184936.GA92715@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504184936.GA92715@x230>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon 04-05-20 20:49:36, Petr Vorel wrote:
> Hi Jan,
> 
> ...
> > > > > The new test case is a regression test for commit f367a62a7cad:
> 
> > > > >     fanotify: merge duplicate events on parent and child
> 
> > > > The test looks OK but do we want a test for this? I mean: A test like this
> > > > seems to imply we promise to merge identical events. Although that is a
> > > > good general guideline, I consider it rather an optimization that may or
> > > > may not happen but userspace should not rely on it. Thoughts?
> 
> > > The thing is, those are not really two identical events.
> > > This is in fact the same event (fsnotify_change() hook was called once).
> > > The fact that listener process may have an inode watch, parent directory
> > > watch and a filesystem watch should not affect the number of read events.
> 
> > Yeah, I agree that in this case we should be merging the event if sanely
> > possible (which is why I've merged that patch).
> 
> > > Now it's true that internally, fsnotify_dentry() emits two event flavors to
> > > parent and to victim. For inotify it even made some sense, because listener
> > > would read two different event flavors with two different formats.
> > > With fanotify (either reporting fd or fid) receiving two events makes very
> > > little sense.
> 
> > > I agree that the fix (merging those events) is best effort and we cannot
> > > commit to merging the events, but this isolated regression test does
> > > check the best effort fix reliably and this is the reason I think it
> > > should stay.
> 
> > OK, I'm not too concerned about this test. But still the functionality is
> > more in the area of "nice to have" than "must have" so in future we may
> > break this if the implementation would get too hairy. But I guess we can
> > remove the test in that case.
> Yes, nothing is set in stone.
> 
> > > Upcoming FAN_REPORT_NAME is about to change the picture a bit
> > > towards the inotify behavior - victim watch gets event without name,
> > > parent watch gets event with name, filesystem watch gets both event
> > > flavors... that is, if you will agree to this behavior, but we shall continue
> > > this discussion on the fanotiify_name patches....
> 
> > Yes.
> Can I add your ack tag to the whole patchset?
> Or do you still consider whether any of them should be merged?

Feel free to add my Ack-by tag:

Acked-by: Jan Kara <jack@suse.cz>

I didn't check all the details but overall the patches look good to me.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
