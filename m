Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A35BA11E4CA
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 14:40:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BD2C3C2397
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Dec 2019 14:40:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 5E4AA3C2293
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 14:40:04 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0A8256014B4
 for <ltp@lists.linux.it>; Fri, 13 Dec 2019 14:40:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 68BAAAE5E;
 Fri, 13 Dec 2019 13:40:03 +0000 (UTC)
Date: Fri, 13 Dec 2019 14:40:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191213134002.GE20795@rei.lan>
References: <20191128093610.6903-1-mdoucha@suse.cz>
 <20191128093610.6903-2-mdoucha@suse.cz>
 <26933665.14359191.1575028896043.JavaMail.zimbra@redhat.com>
 <0e1a3d0e-a154-8469-6e04-a954740a4a61@suse.cz>
 <1057914729.14405454.1575044248773.JavaMail.zimbra@redhat.com>
 <0c8a52b4-0c71-4efa-f58a-66524055e32a@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c8a52b4-0c71-4efa-f58a-66524055e32a@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Use real FS block size in fallocate05
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I think it might be better to change the test scenario a bit:
> 1. fallocate(FALLOCATE_BLOCKS * blocksize)
> 2. tst_fill_fs()
> 3. write(FALLOCATE_BLOCKS * blocksize)
> 4. repeat fallocate(blocksize) until we get ENOSPC
> 5. write() into all blocks allocated in step 4
> 6. check that another write() will get ENOSPC
> 7. test fallocate(PUNCH_HOLE | KEEP_SIZE)
> 
> This should get us around the issue with tst_fill_fs() and still
> properly validate that fallocate() handles full FS gracefully.

Looping over the second fallocate until we got ENOSPC sounds reasonable
to me.

> The only remaining issue is whether it's correct for Btrfs to only
> release blocks when you deallocate the whole file. I still haven't heard
> back from our Btrfs dev.

So the punched hole does not free space on Btrfs even if we are FS block
aligned? I was under an impression that it should, but again Btrfs is
copy-on-write filesystem, so it may want to keep a copy of the discarded
blocks anyways.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
