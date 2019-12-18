Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B61242F9
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 10:24:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65EA33C22C8
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Dec 2019 10:24:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BD91E3C2278
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 10:24:56 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2F8671001DAD
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 10:24:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576661094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s20sm28SuYpeeHCgwVlXvZG/W1QLHMhup6pQ3ErhfBc=;
 b=O246m34oz/URVLvHz1Jj3GobMxdFjnmqz22nRCC1rQGjry6o01vrx0R+Xjvi1maqLywVIf
 sDyPJiyh+5DPbFOcpS69DgkXEqgnExMxpOQ5xYQkGM98jCHmlvk9+GF9s3Vu+M/lHyzZJ0
 VDLi12Otz813aVhP+Rk2jtyfEPhA6Cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-mJ0e6vmrNwG7TUmCR-qatw-1; Wed, 18 Dec 2019 04:24:52 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8BA18552A0
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:24:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 945B126DC5
 for <ltp@lists.linux.it>; Wed, 18 Dec 2019 09:24:51 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C7BC827C1;
 Wed, 18 Dec 2019 09:24:51 +0000 (UTC)
Date: Wed, 18 Dec 2019 04:24:51 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191218082826.25083-1-liwang@redhat.com>
References: <20191218082826.25083-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: sync_file_range02: remove the toplimit of write back
Thread-Index: mVINwIb9qMTItAXgLiR1mR75A9SY8g==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mJ0e6vmrNwG7TUmCR-qatw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
> " The test's assumptions are fundamentally false; it thinks it can look
> at IO counters (tst_dev_bytes_written) for a disk before and after a
> system call, and attribute all of the IO seen to the system call that
> was made - this isn't necessarily correct. Other processes may generate
> IO in the background.

We create our own block device, so there shouldn't be other processes
writing to it.

> ext4 defers a lot of IO on a freshly made filesystem to the kernel -
> for example it will initialize the journal and inode tables after the
> mount

Journal was my guess as well.

> Let's remove the toplimit of write back, and think as long as we synced
> at least the expected amount, the test passes. The +10% limit seems
> arbitrary.

I think this is reasonable approach until we find better way
to measure what was synced.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
