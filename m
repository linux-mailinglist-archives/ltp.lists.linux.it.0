Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B7217F36
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 07:46:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3E9A3C544D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 07:46:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2B66A3C223B
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 07:46:33 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 64BB6600AB9
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 07:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594187191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRm3cTaRTaAmJasE/LSU71kslAqygQQcnswIHsNaKGc=;
 b=cGrjJuOrjK3ImZBkV7Y6d12/nbKD8NFRaj+GOc7z2mgtArKVgxlBXsfVQVn2AqWZcDpHr0
 fxAGW8BW+4Ja/4fSoDde39+hjOxbJmF7mYDaIJ4LR9yQmff8et0HBOASTYXtgZOLnwTxjE
 xcxYilWE4OKKMJjK3Rtw47EV0VLp9H8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-KR3dStRUMy2mZ7mgAda2cQ-1; Wed, 08 Jul 2020 01:46:29 -0400
X-MC-Unique: KR3dStRUMy2mZ7mgAda2cQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EE6918FF66A;
 Wed,  8 Jul 2020 05:46:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E1D1A914;
 Wed,  8 Jul 2020 05:46:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D44F833DC;
 Wed,  8 Jul 2020 05:46:27 +0000 (UTC)
Date: Wed, 8 Jul 2020 01:46:27 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <172872545.1186681.1594187187385.JavaMail.zimbra@redhat.com>
In-Reply-To: <1690c3ad-a7d4-fa18-db19-343e3e345f8c@cn.fujitsu.com>
References: <1594016612-7975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <150668383.1091545.1594129246387.JavaMail.zimbra@redhat.com>
 <1690c3ad-a7d4-fa18-db19-343e3e345f8c@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.17]
Thread-Topic: syscalls/ioctl09: Add test for BLKRRPART ioctl
Thread-Index: TAb6VGiuFJA3M+/IVYNuaVxlvbNANQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl09: Add test for BLKRRPART ioctl
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
> > 20MB feels a bit small, even though tests I ran passed on old and new
> > kernels.
> > LTP default is 256, to cover various filesystems, but here we don't even
> > write anything..
> In actually, ioctl_loop01 test case also uses 10M size and we only cover
> ext4 fileystem in here. I don't have objection about changing this size
> to 256M. Just reconfirm. If so, we should also modify ioctl_loop01 code.

OK, thanks for pointing that out. I wanted to go to 32 or 64, but if 10
worked in ioctl_loop01 until now, then 20 should be fine here.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
