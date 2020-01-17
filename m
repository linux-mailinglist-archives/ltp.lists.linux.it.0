Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FB14132E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 22:34:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9636E3C224E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 22:34:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C27C73C132B
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 22:34:04 +0100 (CET)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A517E1000C7C
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 22:33:56 +0100 (CET)
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00HLXq7b017717
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 16:33:53 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 696124207DF; Fri, 17 Jan 2020 16:33:52 -0500 (EST)
Date: Fri, 17 Jan 2020 16:33:52 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200117213352.GA481935@mit.edu>
References: <CA+G9fYuBdcZvE6VPm9i2=F0mK5u3j6Z+RHbFBQ1zh9qbN_4kaw@mail.gmail.com>
 <1555311261.2497849.1579281887353.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555311261.2497849.1579281887353.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP: statx06: FAIL: Birth time < before time
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
Cc: adilger@dilger.ca, Arnd Bergmann <arnd@arndb.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-ext4@vger.kernel.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jan 17, 2020 at 12:24:47PM -0500, Jan Stancek wrote:
> > LTP syscalls statx06 test case getting failed from linux next 20200115
> > tag onwards on all x86_64, i386, arm and arm64 devices
> > 
> > Test output:
> > statx06.c:152: FAIL: Birth time < before time
> 
> [CC Theo & linux-ext4]
> 
> It's returning '0' in stx_btime for STATX_ALL or STATX_BTIME.
> 
> Looking at changes, I suspect:
>   commit 927353987d503b24e1813245563cde0c6167af6e
>   Author: Theodore Ts'o <tytso@mit.edu>
>   Date:   Thu Nov 28 22:26:51 2019 -0500
>     ext4: avoid fetching btime in ext4_getattr() unless requested
> 
> and that perhaps it should be instead...
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index c8355f022e6e..6d76eb6d2e7f 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5398,7 +5398,7 @@ int ext4_getattr(const struct path *path, struct kstat *stat,
>         struct ext4_inode_info *ei = EXT4_I(inode);
>         unsigned int flags;
> 
> -       if ((query_flags & STATX_BTIME) &&
> +       if ((request_mask & STATX_BTIME) &&
>             EXT4_FITS_IN_INODE(raw_inode, ei, i_crtime)) {
>                 stat->result_mask |= STATX_BTIME;
>                 stat->btime.tv_sec = ei->i_crtime.tv_sec;

Yep, nice catch!  Unfortunately we don't have a test like this in
xfstests, or I would have caught this sooner.

I've fixed this in the dev branch, so it will hopefully be fixed in
the future linux-next tgs.

							- Ted

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
