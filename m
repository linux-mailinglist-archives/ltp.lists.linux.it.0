Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C96F8F4E
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:09:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFF9C3C252A
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:09:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 23FAA3C251F
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:08:21 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8916560CD2B
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:08:20 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AA4E468BE1; Tue, 12 Nov 2019 13:08:18 +0100 (CET)
Date: Tue, 12 Nov 2019 13:08:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191112120818.GA8858@lst.de>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
 <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 12 Nov 2019 13:09:02 +0100
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
Cc: kernel test robot <rong.a.chen@intel.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 lkp@lists.01.org, Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it,
 Ian Kent <raven@themaw.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Nov 12, 2019 at 07:02:23AM -0500, Jan Stancek wrote:
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/fs_fill/fs_fill.c
> 
> Setup of that test is trying different file system types, and it looks
> at errno code of "mount -t $fs /dev/zero /mnt/$fs".
> 
> Test still PASSes. This report appears to be only about extra message in dmesg,
> which wasn't there before:
> 
> # mount -t xfs /dev/zero /mnt/xfs
> # dmesg -c
> [  897.177168] /dev/zero: Can't open blockdev

That message comes from fs/super.c:get_tree_bdev(), a common library
used by all block device based file systems using the new mount API.

It doesn't seem all that useful to me, but it is something we'll
need to discuss with David and Al, not the XFS maintainers.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
