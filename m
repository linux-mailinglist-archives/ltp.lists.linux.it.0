Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6498F7257
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:39:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DCB03C183D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:39:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A8EEE3C176C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:39:02 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 12DCC1A01458
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:39:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573468740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtJ5pv77U2r0G6ksqsSYckeZ6pvSP6wLt/Y5uCN51BI=;
 b=gX6VKX1YGSQBI/P7OkvrH8I9iedPzu5Owoj68/TimgZxIogBVL9lB2mlcILm37mLI6OhY+
 KBmGypspQcRqNqkEA1sxK+Ou2e7bfAKgBjIY/vq6QCMsHGvS57gKZYwMrT/rDLOp6gb99k
 Xc5zsiEjM+MsvqWYLt86/mwuxguMlvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-S1iNAS8jNHuFSYbreh69fQ-1; Mon, 11 Nov 2019 05:38:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4F5107ACC4;
 Mon, 11 Nov 2019 10:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C755D6A3;
 Mon, 11 Nov 2019 10:38:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C14C94BB5C;
 Mon, 11 Nov 2019 10:38:54 +0000 (UTC)
Date: Mon, 11 Nov 2019 05:38:54 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <1757087132.11450258.1573468734360.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191111083815.GA29540@infradead.org>
References: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
 <852514139.11036267.1573172443439.JavaMail.zimbra@redhat.com>
 <20191111012614.GC6235@magnolia>
 <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
 <20191111083815.GA29540@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.18]
Thread-Topic: diotest4.c:476: read to read-only space. returns 0: Success
Thread-Index: 910IB+66jrM2sMmDpKAiK7gJA7sQsg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: S1iNAS8jNHuFSYbreh69fQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP: diotest4.c:476: read to read-only space. returns 0:
 Success
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
Cc: Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4 <linux-ext4@vger.kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Is this a new test?

No, it's not new.

> If not why was this never reported?  Sounds like
> we should add this test case to xfstests.

I'm guessing not that many users still run 32bit kernels.
Naresh' setup is using ext4, so I assume he noticed only
after recent changes in linux-next wrt. directio and ext4.

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
