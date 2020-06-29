Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568920CD13
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 09:56:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 037F53C2AE2
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 09:56:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 51DDD3C185E
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 09:56:38 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id C65C82001A6
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 09:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593417396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hJQIsrXxb9m97Ancy8ClxMwGi101HNYe7NrOaPUtQW4=;
 b=crlttEV7bL+LBmyG5fmfggG2s720nRxbYYBr44lVAKMECwbmzT+0bzR0jvs5qXfGIwb7xM
 CMZKlDVaORTZ8KDKAXq08b76HM7FfOxuuH0hCbR4n67OFH5iTYlRnoJYbZSc2kNvVNilNR
 rAQCL15uN2NUlP9Bk2g1C9b8sL1hy94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-Te-k1bCxNFSv6Oj6xGPhng-1; Mon, 29 Jun 2020 03:56:32 -0400
X-MC-Unique: Te-k1bCxNFSv6Oj6xGPhng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BA1580183C;
 Mon, 29 Jun 2020 07:56:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55F845C1BD;
 Mon, 29 Jun 2020 07:56:31 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20C5218095FF;
 Mon, 29 Jun 2020 07:56:31 +0000 (UTC)
Date: Mon, 29 Jun 2020 03:56:30 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1418968619.19068649.1593417390787.JavaMail.zimbra@redhat.com>
In-Reply-To: <1593330123-19631-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <20200624113217.GC30917@yuki.lan>
 <1593330123-19631-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.7]
Thread-Topic: tst_device: Add new api tst_find_backing_dev(path, dev)
Thread-Index: QfQoihFWsVFxnQtD8T2ncKCkfIko0Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] tst_device: Add new api
 tst_find_backing_dev(path, dev)
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
> +This function finds the block dev that this path belongs to, it compares
> path buf
> +with the fifth column of each row in "/proc/self/mountinfo" and list 10th
> column
> +as its block dev.

Why not match major/minor numbers?

You said "But stat function has problem when filsystem uses virtual block
(such as btrfs,fuse, then major numer is 0)." - Why is that a problem
for comparison against /proc/self/mountinfo?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
