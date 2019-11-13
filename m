Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D41FAA06
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:04:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C75CC3C235A
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:04:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E5EF33C2212
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:04:40 +0100 (CET)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EB6CD100204A
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:04:37 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DB74121CBA;
 Wed, 13 Nov 2019 01:04:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 13 Nov 2019 01:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 9r9EiXvYeN2EElgNuXBLIhpNeYkB8erZDxNPQNTTby0=; b=TNrmQ+4WZezgTWgt
 vZ5zVaJEndpuvsr5evLuoQCFwSYIlBo6K3w3RlX4IjjI5/9RDsqnVVkKsaNsrL2V
 c/Q1jqUx3fz46MHc7W+7Fh/jE9aqAeixPSSG7kBk0/xwEjGGSbn1tC47rjX+Yi4v
 jR6Xd8sxUFzWotHHiUnPOWbiBL4KRoxJ+TBjQISxWxH7Cd+9FwxQxuCPxuvqjJl5
 hhC+8NHbzk+c0CePJYww6rd5bU4UeamN2BsBBAuY6ZMMHWmSkAAMGrjjipFftNsX
 mph1vDUZ2c/uO8e6klD9TkXN/p64TrweqBIAiZreilA/7N6X351KCuqeCF0qOyR0
 U2liBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9r9EiXvYeN2EElgNuXBLIhpNeYkB8erZDxNPQNTTb
 y0=; b=oSz+h7Mk0RvhRZ71acwH4MujEVtDn1LYgmcFQUKVh4/RadvtZt8/vdyim
 eAnUewSwvisOOSImZi0AuJz6zEp8f2Fv6DL+36j0qtATh76MRgEWbdNGv9IIqYPr
 RP7/2UEYCGqH9yhvrb5jssNKxO3YnsrvWWL30qqic1h4TPJok/iegJgrC0zBAY03
 v7+inKm54OaMnBE5cSvX1XI724mAUy52bU8wxHJGBYfWc3JjJvNyjiHa9XetibzH
 zUdTtZkdVfkViBQvipTQaxzIQXxnPTR5CSaac5Hcjpgr/NLqlSG0XERV8+ABDrmi
 aae3n7+6QEaiiRTFWgVbDWLAULNJw==
X-ME-Sender: <xms:8pzLXQEWUHn-OIQ7YjA7jgBxuB-dYsjiXYpbhpo39xyxuF6xUQHjqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeftddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
 mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucffohhmrghinhepkhhmsh
 hgrdguvghvpdhgihhthhhusgdrtghomhenucfkphepuddukedrvddtkedrudekledrudek
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:8pzLXVVCgqLEJIHwCq7rhWN7bjsID9Sg0H3FUFnmZ21x64HXTwYoVg>
 <xmx:8pzLXcXsLZi_WjuAOSFgwgmxxNtj2j00hRv8fIbx-u2GV4YMNmSiVA>
 <xmx:8pzLXTKullwiLTjxrrqahIjED2MHJbzSsZTfwBmCflynhqj_AyVCag>
 <xmx:85zLXYXSu3GoWXxnLrtiSDhARFSSWsgwh4jLPukCmzJAGt4pl4-DYA>
Received: from mickey.themaw.net (unknown [118.208.189.18])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42395306005E;
 Wed, 13 Nov 2019 01:04:30 -0500 (EST)
Message-ID: <e38bc7a8505571bbb750fc0198ec85c892ac7b3a.camel@themaw.net>
From: Ian Kent <raven@themaw.net>
To: Christoph Hellwig <hch@lst.de>, Jan Stancek <jstancek@redhat.com>
Date: Wed, 13 Nov 2019 14:04:27 +0800
In-Reply-To: <5f758be455bb8f761d028ea078b3e2a618dfd4b1.camel@themaw.net>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
 <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
 <20191112120818.GA8858@lst.de>
 <5f758be455bb8f761d028ea078b3e2a618dfd4b1.camel@themaw.net>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
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
Cc: DavidHowells <dhowells@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, lkp@lists.01.org, AlViro <viro@ZenIV.linux.org.uk>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2019-11-13 at 09:13 +0800, Ian Kent wrote:
> Adding Al and David to the CC, hopefully that will draw their
> attention to this a bit sooner.
> 
> On Tue, 2019-11-12 at 13:08 +0100, Christoph Hellwig wrote:
> > On Tue, Nov 12, 2019 at 07:02:23AM -0500, Jan Stancek wrote:
> > > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/fs_fill/fs_fill.c
> > > 
> > > Setup of that test is trying different file system types, and it
> > > looks
> > > at errno code of "mount -t $fs /dev/zero /mnt/$fs".
> > > 
> > > Test still PASSes. This report appears to be only about extra
> > > message in dmesg,
> > > which wasn't there before:
> > > 
> > > # mount -t xfs /dev/zero /mnt/xfs
> 
> Assuming that is what is being done ...

Arrrh, of course, a difference between get_tree_bdev() and
mount_bdev() is that get_tree_bdev() prints this message when
blkdev_get_by_path() fails whereas mount_bdev() doesn't.

Both however do return an error in this case so the behaviour
is the same.

So I'm calling this not a problem with the subject patch.

What needs to be done to resolve this in ltp I don't know?

Ian


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
