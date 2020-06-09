Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 642021F37B6
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:16:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E57E3C2E52
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:16:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id F22283C1379
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:16:52 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 680CC201171
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591697810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFj96oN5rJhiXWaXyfR1wBXxIrS5+jKhzxJ0urzQKjs=;
 b=FXMSMaUiZHGW7nyLbU0DStbvsEIik7g0WKxlzyKg+czK82Mkl7tp2om8N0qbN6cjuF+y3q
 NtgSJcO5h8+KHpmKFViFQdsBZpWlqqGF7h/y/8hX7ij3m1dVHBLYj+fMzMZQTiPm/tkvgB
 wlW2yGldCbsqKQ0VjnQkhBh8sMwzEng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-qO0zK4INOQycHs093Q0Ngw-1; Tue, 09 Jun 2020 06:16:43 -0400
X-MC-Unique: qO0zK4INOQycHs093Q0Ngw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27FA41005510;
 Tue,  9 Jun 2020 10:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20FD9385;
 Tue,  9 Jun 2020 10:16:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19E979702C;
 Tue,  9 Jun 2020 10:16:42 +0000 (UTC)
Date: Tue, 9 Jun 2020 06:16:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1837993622.15296660.1591697802060.JavaMail.zimbra@redhat.com>
In-Reply-To: <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
 <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: syscalls/ioctl_loop05: Get the logic_block_size dynamically
Thread-Index: DMOlPoTEcxMveTnA5iCwibpD0F+rwA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
> Hi Jan
> 
> >
> > ----- Original Message -----
> >> In loop driver code, the sb_bsize was calculated as below
> >> sb_bsize = bdev_logical_block_size(inode->i_sb->s_bdev),
> >>
> >> it is the super block's block size that the backing file's inode belongs
> >> to,
> >> not by using the st_blksize member of stat struct(it uses
> >> inode->i_blkbits).
> > I'm not sure I follow the above, are you saying the difference is bdev
> > blksize
> > vs. filesystem blksize?
> 
> I said the loop driver used  dev_logical_block_size(inode->i_sb->s_bdev) but
> not using
> st_blksize.

I know, but I'm trying to understand what the difference is between those two.

> > Would BLKSSZGET work? It returns bdev_logical_block_size().
> 
> But it needs a blockdev, in user space, we can specify bdev, but how can we
> figure out this inode->i_sb->s_bdev block dev.

Isn't that the block device "test.img" is on?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
