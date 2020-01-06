Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 823281310A5
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 11:35:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 100433C24A0
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 11:35:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5C7F23C245E
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 11:35:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE5BA1000DAE
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 11:35:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F29C5AF84;
 Mon,  6 Jan 2020 10:35:09 +0000 (UTC)
Date: Mon, 6 Jan 2020 11:35:09 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200106103509.GB25027@rei.lan>
References: <20200102015236.7400-1-liwang@redhat.com>
 <20200102125759.GE32710@rei.lan>
 <CAEemH2fdY_pPjNCEFmcd_zsye4HAciPuhF+Fiyde9WmBci=+Lg@mail.gmail.com>
 <20200106100540.GA25027@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106100540.GA25027@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > > To avoid FS deferred IO metadata/cache interferes test result, so we
> > > > do sync simply before the tst_dev_bytes_written invocation.
> > >
> > > Can we do fsync() on the fd instead of full sync()? That should be
> > > slightly faster.
> > >
> > 
> > Probably you miss the previous discussed [1], we use sync() here because we
> > do want to make sure all FS metadata/cache being written back before the
> > testing since there is no obtainable file descriptor 'fd' for the ext4
> > deferred IO (e.g. initialize the journal and inode tables).
> 
> Ah, right, we measure I/O to the whole device, so we would have to sync
> the device in question. Then syncfs() on the fd we got should work
> right? And it should avoid syncing unrelated filesystems as well.

It wouldn't probably harm to create an inline function in the test
library just for a sake of documentation, something as:

static inline void tst_dev_sync(int fd)
{
	syncfs(fd);
}


Then we end up calling:

	tst_dev_sync(fd);
	tst_dev_bytes_written(device);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
