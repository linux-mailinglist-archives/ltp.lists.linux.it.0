Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB78F9FF2
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 02:13:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 668533C2558
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 02:13:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AF1393C2452
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 02:13:36 +0100 (CET)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 040E12010E7
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 02:13:33 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D2B5621B55;
 Tue, 12 Nov 2019 20:13:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 12 Nov 2019 20:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=themaw.net; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 /zCvsz2UmlaGRP+ibIQ/q5XTxRY0oupK+ptfh45XkeM=; b=WSfeS8akzcvt1+Sd
 lg+4NHlU2tgbNEgX+HsXn0zR2G+t3CwHvozbTcxZUfz8eWp2FOOhtBqYQXWFeQUa
 TkB0JS4iOgNKxOb/0tAa+Imix2NNQyYpIpzEU4gnRHyoDy+B+1d/g4bPZg+FBkUS
 W8qxT/S+BR84v+1ui6+Lbs4ZX4q7qQgYV9aYaVon4EQ2e7iGaSqnKX7ox4qUVNzB
 i20+egenxBlRbAIjtlg6zHa5lBsTfcav1rbLcI6k4fj4OJIRguMh+rS5HBw2nCav
 ondJzKwhInPsFtjm1s/r+FzHIFPZ57TIlrs7KxZuin4V7pd2jx/ScYFM/EMlLG2I
 tXwOSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/zCvsz2UmlaGRP+ibIQ/q5XTxRY0oupK+ptfh45Xk
 eM=; b=S4DmqHqEOLVCAP3J/NmyBQI4huVkyWLfHJ0RMTgZeB3wPiJ8JoYpZFY48
 Luzwk7b2vTDfxhnZwuTctUF4LHUmG7BxcZhEXJPJ2FbVt2NiRohXmWtqpxpiksm6
 nvoqfNmi0qBd+JJnihRIOXWfFyCjt1zxrcc0kCkXb9eW1cPdapW2ntr9Qv7oJ45+
 Lf83UZ2z0xJUTH/VC4YmuPWeykJl24XoijjXE2DyRjGZujb9CczIS41b6T0docjf
 F+ofsuaxAb0PNvE+fe1CSLaXlK3v4b48ZJIyUVk+K92KyjYDxXavKRTYSlAvDOTe
 yjNNUTzPXCe97OwgkorCb/CyHi0bA==
X-ME-Sender: <xms:uVjLXTMBN2lj-G8eXLLJ0GV54GaDl45YigOwnw4Ypb2oVuzX5ludHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeftddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepkfgrnhcu
 mfgvnhhtuceorhgrvhgvnhesthhhvghmrgifrdhnvghtqeenucffohhmrghinhepkhhmsh
 hgrdguvghvpdhgihhthhhusgdrtghomhenucfkphepuddukedrvddtkedrudekledrudek
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghvvghnsehthhgvmhgrfidrnhgvthenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:uVjLXYajw7_1GkK2nuw0PnYXYRV1llanT22Tgllb0TBWvk62787Jcw>
 <xmx:uVjLXSsy6H9LFyfoa-FamaTYsVYh8TH2Kmq25moliwNWOYy5xy3QMA>
 <xmx:uVjLXZ643NCHbqR9vXaW5RvDs5PzbkgDUnGW8rysiRFvOITxAtETeQ>
 <xmx:uljLXdyn3CF1Hbh_Yda7Vtr7gRh2RHC0LRBq0qaf0ZGBTJW7Z1yqvg>
Received: from mickey.themaw.net (unknown [118.208.189.18])
 by mail.messagingengine.com (Postfix) with ESMTPA id 04FBD306005E;
 Tue, 12 Nov 2019 20:13:25 -0500 (EST)
Message-ID: <5f758be455bb8f761d028ea078b3e2a618dfd4b1.camel@themaw.net>
From: Ian Kent <raven@themaw.net>
To: Christoph Hellwig <hch@lst.de>, Jan Stancek <jstancek@redhat.com>
Date: Wed, 13 Nov 2019 09:13:22 +0800
In-Reply-To: <20191112120818.GA8858@lst.de>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
 <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
 <20191112120818.GA8858@lst.de>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

Adding Al and David to the CC, hopefully that will draw their
attention to this a bit sooner.

On Tue, 2019-11-12 at 13:08 +0100, Christoph Hellwig wrote:
> On Tue, Nov 12, 2019 at 07:02:23AM -0500, Jan Stancek wrote:
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/fs_fill/fs_fill.c
> > 
> > Setup of that test is trying different file system types, and it
> > looks
> > at errno code of "mount -t $fs /dev/zero /mnt/$fs".
> > 
> > Test still PASSes. This report appears to be only about extra
> > message in dmesg,
> > which wasn't there before:
> > 
> > # mount -t xfs /dev/zero /mnt/xfs

Assuming that is what is being done ...

> > # dmesg -c
> > [  897.177168] /dev/zero: Can't open blockdev
> 
> That message comes from fs/super.c:get_tree_bdev(), a common library
> used by all block device based file systems using the new mount API.

I'll have a look at get_tree_bdev() but when I compared mount_bdev()
to get_tree_bdev() before using it they looked like they did pretty
much the same thing.

I don't know how /dev/zero is meant to be handled, I'll need to try
and work that out if Al or David don't see this soon enough.

> 
> It doesn't seem all that useful to me, but it is something we'll
> need to discuss with David and Al, not the XFS maintainers.

Ian


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
