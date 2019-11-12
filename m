Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05013F8F2E
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:02:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A24ED3C2529
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 13:02:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 992983C251F
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:02:30 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 70C4D1401817
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 13:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573560147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86d78sKJ++ShqokmkOTiST9dtUBC3J059GE8dycM4HY=;
 b=hyczwn3GGyXGIO1Wfa39K+jwKNuUCxWNrVIYziz/TQeP5xDiYS3FRam3M/GYJIv0x6JJqh
 svPJ0d3Vs/xv2MrwLFP+MpsqJ7DdqMeDs2zzXoG2SrcF65yvfirzHxjmAOi0HQPqRkQ3+K
 +0zfOotKw4iOpU6KhCuSTjqlXxS1KE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-AVPtyDyaNjWDwpaiGBLQTg-1; Tue, 12 Nov 2019 07:02:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BC8B7A50B;
 Tue, 12 Nov 2019 12:02:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB0A60171;
 Tue, 12 Nov 2019 12:02:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4306018089C8;
 Tue, 12 Nov 2019 12:02:23 +0000 (UTC)
Date: Tue, 12 Nov 2019 07:02:23 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Ian Kent <raven@themaw.net>
Message-ID: <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
In-Reply-To: <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.27]
Thread-Topic: 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
Thread-Index: lFLu9oVj8OlcWVE2QLH5SvyKY02GuQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: AVPtyDyaNjWDwpaiGBLQTg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, lkp@lists.01.org, Christoph Hellwig <hch@lst.de>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> > 
> > If you fix the issue, kindly add following tag
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > 
> > [  135.976643] LTP: starting fs_fill
> > [  135.993912] /dev/zero: Can't open blockdev
> 
> I've looked at the github source but I don't see how to find out what
> command was used when this error occurred so I don't know even how to
> start to work out what might have caused this.
> 
> Can you help me to find the test script source please.

https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs/fs_fill/fs_fill.c

Setup of that test is trying different file system types, and it looks
at errno code of "mount -t $fs /dev/zero /mnt/$fs".

Test still PASSes. This report appears to be only about extra message in dmesg,
which wasn't there before:

# mount -t xfs /dev/zero /mnt/xfs
# dmesg -c
[  897.177168] /dev/zero: Can't open blockdev

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
