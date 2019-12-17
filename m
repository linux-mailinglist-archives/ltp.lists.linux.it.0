Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AC1123828
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 22:02:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B0993C1D76
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 22:02:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F3DAD3C03B1
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 22:02:47 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7F55C10006B5
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 22:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576616565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Txfzg0av9VW7shIPZUErpNresOiAGLwaD/k/zZ7NW8=;
 b=hFbxs1wGVt9bOD6tE7Qbus1kJZtUEqrxbggF3YcklVwuhTlMJlXejrdd+hNhGhMnhPCBbw
 7Iv6bdirsMMy+yqnTEiGQOEQP8MPhDwoZTmcMBDmC43cDfBHnhYs5mN+J122hiP22MX5hB
 CwWUwblH/qzO1hivVdD3jjGVcdW8jdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-UUGkcLSqMnOmYLaGl4knrQ-1; Tue, 17 Dec 2019 16:02:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2C78017DF;
 Tue, 17 Dec 2019 21:02:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D20E15D9E1;
 Tue, 17 Dec 2019 21:02:38 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64E8518089C8;
 Tue, 17 Dec 2019 21:02:38 +0000 (UTC)
Date: Tue, 17 Dec 2019 16:02:38 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1253407522.17207718.1576616558113.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191217131703.16935-1-mdoucha@suse.cz>
References: <20191213134002.GE20795@rei.lan>
 <20191217131703.16935-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.25]
Thread-Topic: Use real FS block size in fallocate05
Thread-Index: 53WVNtpAv05+eF+66XmgzNbK/mM7Jw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UUGkcLSqMnOmYLaGl4knrQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Use real FS block size in fallocate05
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
> fallocate() behavior depends on whether the file range is aligned to full
> blocks. Make sure that the test always uses aligned file range so that
> the test is consistent across platforms.
> 
> Also use the TEST() macro to prevent errno pollution and increase test device
> size to avoid weird edge cases that don't happen in the real world.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> Using fixed-size buffer in fallocate05 caused some failures in the past
> due to allocation requests being misaligned with actual file system blocks.
> Btrfs in particular will treat misaligned allocation as regular write()
> and apply copy-on-write to partially allocated blocks even on the first real
> write().
> 
> While that behavior is somewhat surprising, it does make sense. Fix the error
> by using multiples of real block size in fallocate() and write().
> 
> I'll also write another fallocate() test later for checking FS behavior
> on intentionally misaligned allocation. But this fix can be committed before
> that.
> 
> Changes since v1:
> - XFS keeps some free blocks even when write() failed with ENOSPC. Repeat
>   fallocate() until it gets ENOSPC, too.
> - Deallocate only part of the file. Btrfs will fail this check because it has
>   a bug.
> - Add description of test scenario in the header comment.
> - Increase test device size to 1GB to avoid unrealistic Btrfs edge cases.
> 

Looks good to me.

Is there an upstream thread link for that btrfs bug?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
