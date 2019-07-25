Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C274E7C
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 14:48:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A13D3C1C95
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 14:48:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 093C23C0054
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 14:48:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 54D191000C53
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 14:48:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F41EFAF2A;
 Thu, 25 Jul 2019 12:48:45 +0000 (UTC)
Date: Thu, 25 Jul 2019 14:48:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190725124844.GB11617@rei.lan>
References: <20190722194439.161904-1-smuckle@google.com>
 <20190723110306.GB22630@rei.lan>
 <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
 <20190724115735.GC17426@rei.lan>
 <75ded79c-da38-b648-fcfd-a423cc5f0e89@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75ded79c-da38-b648-fcfd-a423cc5f0e89@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> That would work for ext4, but should this be loosened further to give
> >> some headroom in case some FS preallocates more? Or is it preferable to
> >> keep the test as strict as possible and loosen it when/if failures happen?
> > 
> > That is hard to decide. I would go for the lowest limit that works for
> > everybody.
> > 
> > Also for me ext4 allocates only one block for the file no matter what I
> > do, something has to be tuned differently in your setup.
> > 
> > Isn't it just a difference in the block size and inode size?
> 
> On my platform stx_blocks = 16 (8kb) and stx_blksize = 4096, so two fs 
> blocks are being allocated.
> 
> Interestingly, if I create a 256 byte file on this Android platform in 
> /data, it 4kb:
> 
> vsoc_x86:/data # dd if=/dev/zero of=test_file bs=1 count=256
> 256+0 records in
> 256+0 records out
> 256 bytes (256 B) copied, 0.000926 s, 270 K/s
> vsoc_x86:/data # ls -ls test_file
> 4 -rw-rw-rw- 1 root root 256 2019-07-24 19:28 test_file
> 
> However if I go into the directory specified in TMPDIR, it takes 8kb:
> 
> vsoc_x86:/data/local/tmp # dd if=/dev/zero of=test_file bs=1 count=256
> 256+0 records in
> 256+0 records out
> 256 bytes (256 B) copied, 0.000927 s, 270 K/s
> vsoc_x86:/data/local/tmp # ls -ls
> total 8
> 8 -rw-rw-rw- 1 root root 256 2019-07-24 19:30 test_file
> 
> It is also 8kb if I create it in /data/local, but not if I create a 
> directory at /data/testdir and create the file there.

That is a bit strange, unfortunately I do not have a single Android
device around, otherwise I would try to reproduce it.

> Perhaps the x-attributes are spilling out of the inode in some cases and 
> into a data block? I don't know enough about filesystems to say.

That may be, you can try to list these with getfattr.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
