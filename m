Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 923F01F6644
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:09:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8B983C2DFF
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:09:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 23D0B3C2DF0
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:09:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1D3C71A011C1
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591873763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EFaPQ9QD6/TmexYV7lnSVi3/ShlO7oMrpRw9PYdBDQ=;
 b=WZyghunvBMyS7DlcX7dAH4CdqHxIvaSw0a5wfpuOh971s8B+OI9uJmLD9mrjQjbAzCi0Q8
 dZkIyU29J3dz1xLRpHA2iNwg1g0xgDrZYfYJXrtAzxvBjXaVptqkp2+7ieofearREM7CGN
 0ujNBNG6dCjfMHloyg3R8vZhmB+GPLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-ZrJc0ZjSO3-U26Qxma6wjA-1; Thu, 11 Jun 2020 07:09:21 -0400
X-MC-Unique: ZrJc0ZjSO3-U26Qxma6wjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C39835B40;
 Thu, 11 Jun 2020 11:09:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 718197F4FB;
 Thu, 11 Jun 2020 11:09:20 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42B2FB34B6;
 Thu, 11 Jun 2020 11:09:20 +0000 (UTC)
Date: Thu, 11 Jun 2020 07:09:20 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1004907592.15616646.1591873760020.JavaMail.zimbra@redhat.com>
In-Reply-To: <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
 <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.29]
Thread-Topic: syscalls/ioctl_loop05: Use correct blockdev to get
 logical_block_size
Thread-Index: yLTc3DphamFnHLOXcwLTMRbaoLXrnQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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
> Using inode block size is also wrong because it is for filesystem io(such as
> we format
> filesystem can specify block size for data or log or metadata), it is not
> suitable
> for logical block size.

If this copes correctly with btrfs too, I don't have objections.
I retested on failing s390 setup and v3 works there OK.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
