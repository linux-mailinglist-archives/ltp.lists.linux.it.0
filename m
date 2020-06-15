Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2F51F998C
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 16:03:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6FDD53C6024
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 16:03:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BF15C3C0887
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 16:03:50 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id F29286235D7
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 16:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592229828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxvGAQAw035ra8R4hqvENivZC/Q6I9cGWmRWkVLwaLw=;
 b=NsV6LPqieweAqD5j9nrpkmxlfZWzOAmCxWkUiARAvyGK3hT7w15w7IkmwLSsiZ2e9dbTFH
 m9gejTMNQc1RYJ3gvzuGWA+THe0tZAhSZaAOH54diCtGOmUJJt0gij5PmU9a18wJbVhsjs
 FSiwLXevBZPCUKRSEr5+2c6IC7d7nq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-2T5I5DRNMmKTnabEBFEX3w-1; Mon, 15 Jun 2020 10:03:44 -0400
X-MC-Unique: 2T5I5DRNMmKTnabEBFEX3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF273109326A;
 Mon, 15 Jun 2020 14:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592F67B603;
 Mon, 15 Jun 2020 14:03:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B928833BD;
 Mon, 15 Jun 2020 14:03:01 +0000 (UTC)
Date: Mon, 15 Jun 2020 10:03:01 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1101600340.15989438.1592229781375.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200615091850.GA3373@yuki.lan>
References: <20200615085836.GR12456@shao2-debian>
 <20200615091850.GA3373@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.29]
Thread-Topic: 303cc571d1: ltp.setns01.fail
Thread-Index: cwh21FyAYYmtDPp3+d47RhirG3sYUg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 303cc571d1: ltp.setns01.fail
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
Cc: Jann Horn <jannh@google.com>, kernel test robot <rong.a.chen@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, lkp@lists.01.org,
 Aleksa Sarai <cyphar@cyphar.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Serge Hallyn <serge@hallyn.com>, ltp@lists.linux.it,
 Michael Kerrisk <mtk.manpages@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > setns01     6  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x20000)
> > setns01     7  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x40000000)
> > setns01     8  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x20000000)
> > setns01     9  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> > setns01     0  TINFO  :  setns(12, 0x4000000)
> > setns01    10  TFAIL  :  setns01.c:176: regular file fd exp_errno=22:
> > errno=EBADF(9): Bad file descriptor
> 
> The messages here are a bit cryptic, I will fix that later on, but what
> it means here is that the errno has changed from EINVAL to EBADF in a
> case we pass file descriptor to a regular file to setns().

I posted a series that accepts both errnos about week ago:
  https://lists.linux.it/pipermail/ltp/2020-June/017467.html


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
