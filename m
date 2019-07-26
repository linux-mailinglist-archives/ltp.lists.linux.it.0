Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B09FE75BC9
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 02:00:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D16D3C1D0C
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 02:00:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 822E33C1C81
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 02:00:41 +0200 (CEST)
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9CA0C60083D
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 02:00:42 +0200 (CEST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hqney-0004fd-VN; Fri, 26 Jul 2019 00:00:33 +0000
Date: Fri, 26 Jul 2019 01:00:32 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190726000032.GK1131@ZenIV.linux.org.uk>
References: <20190725110944.GA22106@shao2-debian>
 <20190725132617.GA23135@rei.lan>
 <CAHk-=wg+yRjY_AUrjbgrN59OeGAWMF_q=-Dqf2cYtVzoY01j7Q@mail.gmail.com>
 <20190725180428.GH1131@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725180428.GH1131@ZenIV.linux.org.uk>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
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
Cc: ltp@lists.linux.it, LKP <lkp@01.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel test robot <rong.a.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 25, 2019 at 07:04:28PM +0100, Al Viro wrote:
> On Thu, Jul 25, 2019 at 09:32:13AM -0700, Linus Torvalds wrote:
> > On Thu, Jul 25, 2019 at 6:26 AM Cyril Hrubis <chrubis@suse.cz> wrote:
> > >
> > > This looks like mkfs.vfat got EBUSY after the loop device was
> > > succesfully umounted.
> > 
> > Hmm. Smells like the RCU-delaying got triggered again.
> > 
> > We have that "synchronize_rcu_expedited()" in namespace_unlock(),
> > which is so that everything should be done by the time we return to
> > user space.
> > 
> > Al, maybe that RCU synchronization should be after the mntput()s?
> 
> There are several interesting issues in there, but synchronize_rcu()
> should be between zeroing ->mnt_ns and dropping the final refs.
> I'm digging through that crap right now; at least one bug is dealt
> with by #fixes, but there's more, unfortunately.

No, it's not synchronize_rcu().  It's a bug dealt with in vfs.git #fixes,
triggering the struct mount leak in mount_subtree(), which is used
by btrfs.  Immediately prior to vfat in their list...

(oh, and AFAICS "more" in the above had been a mismerge in -next, so
it might really be all there is to it)

Folks, see if vfs.git #fixes solves that one.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
