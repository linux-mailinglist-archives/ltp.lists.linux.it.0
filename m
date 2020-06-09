Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E60921F3705
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:24:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50CAC3C2E6A
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 11:24:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E9E093C0EB6
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:24:28 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3CD0E2010B0
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 11:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591694666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdajVkLsVaqIVTpJ2Jf0fZcFo0avuwTKPSOrowfGf5A=;
 b=XhJrmOba98qR5wT82gWq6GV5o8EPgdA9/vvM94B2HHkYFxJ8KMmWSnclhEXfEZvoaJIc1N
 YB+DtIsGj00q8QuQhQYFrqtl//eVTJAg+LniuOdztJIBbkaKRp7nieG5yUAcLpEvde5Jzo
 1kF9L8CBLiy0OyJy3I1yF8Jy9EJ6J9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-wbPngqygM4m715qOUp_roQ-1; Tue, 09 Jun 2020 05:24:15 -0400
X-MC-Unique: wbPngqygM4m715qOUp_roQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 585A318A8221;
 Tue,  9 Jun 2020 09:24:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51DCC60C47;
 Tue,  9 Jun 2020 09:24:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AE439702C;
 Tue,  9 Jun 2020 09:24:13 +0000 (UTC)
Date: Tue, 9 Jun 2020 05:24:13 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
In-Reply-To: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: syscalls/ioctl_loop05: Get the logic_block_size dynamically
Thread-Index: 31mTKqWYGkgvKKsnl6DFabSPq/n2HA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Get the logic_block_size
 dynamically
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



----- Original Message -----
> In loop driver code, the sb_bsize was calculated as below
> sb_bsize = bdev_logical_block_size(inode->i_sb->s_bdev),
> 
> it is the super block's block size that the backing file's inode belongs to,
> not by using the st_blksize member of stat struct(it uses inode->i_blkbits).

I'm not sure I follow the above, are you saying the difference is bdev blksize
vs. filesystem blksize? Is the test failing in some scenarios or is this
fix based on code inspection?

> 
> IMO, we don't have the direct ioctl to get this size, just try it from 512 to
> page_size.

Would BLKSSZGET work? It returns bdev_logical_block_size().


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
