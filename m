Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F22073F7
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 15:06:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 896533C2B9B
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 15:06:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DF1EC3C129F
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 15:06:20 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 681FB6008F8
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 15:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593003978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vQYz1vNDSCTNMLuS3B7ZSLzBOQJmqRij/Nc/v+mlsaE=;
 b=c5ztqOkhnLoyI3CkZIMwPHXbVC4fqY7CDuYKy8VQR23TSpcPqRKZ8E3FRrePNky9HRu3K/
 8EVi4Vl2HZReCG7u4HhpV0IRsaJJI2p4iU4+wLa7rZhazFWpnUTblf5mirlPXzL/qErNAC
 RFp25JSldSaze4VhYckDLS3flRYFPMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-veUG_TAhO6KMmFb5MVDJpw-1; Wed, 24 Jun 2020 09:06:14 -0400
X-MC-Unique: veUG_TAhO6KMmFb5MVDJpw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E0E5A0BD7;
 Wed, 24 Jun 2020 13:06:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CD15C240;
 Wed, 24 Jun 2020 13:06:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB8B1809542;
 Wed, 24 Jun 2020 13:06:12 +0000 (UTC)
Date: Wed, 24 Jun 2020 09:06:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1699837077.18529566.1593003972656.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200624113217.GC30917@yuki.lan>
References: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
 <1591853524-17011-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200624113217.GC30917@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: syscalls/ioctl_loop05: Use correct blockdev to get
 logical_block_size
Thread-Index: TEd0VzY32bNFS6TDl/n5+DdX+6UQqA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
> Looking at what that command does it's not that complex. It does
> statfs() to get minor and major number, then scans /proc/self/mountinfo
> for these, since these are on third column and then just prints whatever
> it's in the 10th column. This isn't more complex that what we have here
> and avoids needs to execute binaries and parse the output.

Thanks for mountinfo pointer. We went down the stat() route already,
but hit issues with some filesystems. I tried it now with mountinfo
approach and that does seem to fix btrfs case too, so I agree that
parsing /proc/self/mountinfo rather than df output is nicer.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
