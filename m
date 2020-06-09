Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 728AC1F38EC
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 13:02:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 270933C2E4A
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 13:02:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F01783C0877
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 13:02:08 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 34086601A19
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 13:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDLi6qFi4IGdyUXVoXZu3/U9WgawgVKm2z0CKQsszfE=;
 b=Gpxl2ujTpexCPDzUTxsOLVnkcK2A9eXuciuP7iYLnvlj20DjspkMZ/b3GM4Zg1QGjtLnjZ
 bfeFQO2CWnGWeF/8I/bxwn/D7Ohr2ZN9gp/nLLGxdft5z/zNucVEMuaQ2FgnBPvzbBOp3R
 HF/kjGJjR4UOA0Y7/34vfM+1w5b894E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-S-rrIwQsOlWGvzcLUpR3uA-1; Tue, 09 Jun 2020 07:01:58 -0400
X-MC-Unique: S-rrIwQsOlWGvzcLUpR3uA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF021937FDE;
 Tue,  9 Jun 2020 11:01:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D71585C1BD;
 Tue,  9 Jun 2020 11:01:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC5201809542;
 Tue,  9 Jun 2020 11:01:57 +0000 (UTC)
Date: Tue, 9 Jun 2020 07:01:57 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
In-Reply-To: <96ba542d-4ec7-bc5d-41d9-f533952f94cd@cn.fujitsu.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
 <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
 <1837993622.15296660.1591697802060.JavaMail.zimbra@redhat.com>
 <96ba542d-4ec7-bc5d-41d9-f533952f94cd@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.18]
Thread-Topic: syscalls/ioctl_loop05: Get the logic_block_size dynamically
Thread-Index: AltDVDlF2oRm9li7bvQX4VEOs3rvrA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> >>> Would BLKSSZGET work? It returns bdev_logical_block_size().
> >>
> >> But it needs a blockdev, in user space, we can specify bdev, but how can
> >> we
> >> figure out this inode->i_sb->s_bdev block dev.
> > 
> > Isn't that the block device "test.img" is on?
> Do you mean the test.img belong to some block dev, such as /dev/sda1 or
> our mounted block_dev? If so, I think it is.

The former. Say if test.img is in /tmp, then I'd assume "s_bdev" is
/dev/mapper/rhel-root (/dev/dm-0)

$ df -T /tmp/test.img
Filesystem            Type 1K-blocks     Used Available Use% Mounted on
/dev/mapper/rhel-root xfs   66789516 33211340  33578176  50% /


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
