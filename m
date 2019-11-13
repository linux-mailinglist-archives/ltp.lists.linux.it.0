Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4367FAA18
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:16:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7409A3C2261
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Nov 2019 07:16:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2FF8C3C2219
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:16:55 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C40C3601628
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 07:16:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573625813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIZp9yHBFDUruuXW0JJC83eKv9Q2/zaGLYS7xvC/kAM=;
 b=jUkHh1itCo4BL6/EbwjcAJCGt/lqqW5SfAfiyWwbtH0EV4g8tqUWQZ9KlaCKOYTBj9BbxK
 nBAgSlpVWpERaQUZiPI/C2yOHXx8ptodERZCA2IqbwfvuyWoCUiJo2JESwqnmc77YoJf76
 Lnc2WMSp7JVdqvhB0642IBa+BIbcg7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-BJZpVlNKOnKu364uHqvsJw-1; Wed, 13 Nov 2019 01:16:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A1718B5F71;
 Wed, 13 Nov 2019 06:16:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C164D751;
 Wed, 13 Nov 2019 06:16:46 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A90E34BB5C;
 Wed, 13 Nov 2019 06:16:45 +0000 (UTC)
Date: Wed, 13 Nov 2019 01:16:45 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Ian Kent <raven@themaw.net>, kernel test robot <rong.a.chen@intel.com>
Message-ID: <975334005.11814790.1573625805426.JavaMail.zimbra@redhat.com>
In-Reply-To: <e38bc7a8505571bbb750fc0198ec85c892ac7b3a.camel@themaw.net>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
 <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
 <20191112120818.GA8858@lst.de>
 <5f758be455bb8f761d028ea078b3e2a618dfd4b1.camel@themaw.net>
 <e38bc7a8505571bbb750fc0198ec85c892ac7b3a.camel@themaw.net>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.20]
Thread-Topic: 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
Thread-Index: AzWavxd/8PGGbt3Ud1LytMdxvpbGqQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: BJZpVlNKOnKu364uHqvsJw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 lkp@lists.01.org, AlViro <viro@ZenIV.linux.org.uk>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> > > > # mount -t xfs /dev/zero /mnt/xfs
> > 
> > Assuming that is what is being done ...
> 
> Arrrh, of course, a difference between get_tree_bdev() and
> mount_bdev() is that get_tree_bdev() prints this message when
> blkdev_get_by_path() fails whereas mount_bdev() doesn't.
> 
> Both however do return an error in this case so the behaviour
> is the same.
> 
> So I'm calling this not a problem with the subject patch.
> 
> What needs to be done to resolve this in ltp I don't know?

I think that's question for kernel test robot, which has this extra
check built on top. ltp itself doesn't treat this extra message as FAIL.

Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
