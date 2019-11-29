Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7D10D855
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 17:17:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 587DB3C22B6
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 17:17:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D740E3C2093
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 17:17:35 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9C7941001968
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 17:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575044253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctwV2r0Yb4ACXcXJZbfpRWnctUxD5fZxIYTuQexo0Bs=;
 b=cSBh32S3QeL3o03HEy7Af+v0RXappEp550cTBqOGajrkS6jiDp7XE4G5Y23BtmHKjKG6qz
 OhDKSTM34sO1Wh2S9LC18b8+RuNAQNpf89ZKjL1q8awbI9cFM8pYNaalunYG3tOXHae+yU
 VcOt2hy0D+TdtQ5o/uyjGeCrtDTXyuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-Fg07JLzNMSGVkIGBjPuosg-1; Fri, 29 Nov 2019 11:17:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1725380183D;
 Fri, 29 Nov 2019 16:17:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5365D9C9;
 Fri, 29 Nov 2019 16:17:29 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06F874BB5C;
 Fri, 29 Nov 2019 16:17:29 +0000 (UTC)
Date: Fri, 29 Nov 2019 11:17:28 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <1057914729.14405454.1575044248773.JavaMail.zimbra@redhat.com>
In-Reply-To: <0e1a3d0e-a154-8469-6e04-a954740a4a61@suse.cz>
References: <20191128093610.6903-1-mdoucha@suse.cz>
 <20191128093610.6903-2-mdoucha@suse.cz>
 <26933665.14359191.1575028896043.JavaMail.zimbra@redhat.com>
 <0e1a3d0e-a154-8469-6e04-a954740a4a61@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.14]
Thread-Topic: Use real FS block size in fallocate05
Thread-Index: j0IfpTZLkdPRAgmJjxNGZbj3z4SCMQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Fg07JLzNMSGVkIGBjPuosg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Use real FS block size in fallocate05
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
> On 11/29/19 1:01 PM, Jan Stancek wrote:
> >> +			tst_res(TCONF | TTERRNO, "fallocate() not supported");
> > 
> > tst_brk would make more sense here. If we fail here we can end the test.
> 
> No. tst_brk() will terminate the whole test on the first usual test case
> (Ext2) and skip all the other file systems that do support fallocate().

It shouldn't. tst_brk() does call exit() for test process, but
.all_filesystems spawns new process for each fs.

If I add:
   tst_brk(TCONF, "STOP");
to run(), I get STOP for each fs:
  $ sudo ./fallocate05 2>&1 | grep STOP
  fallocate05.c:30: CONF: STOP
  fallocate05.c:30: CONF: STOP
  fallocate05.c:30: CONF: STOP
  fallocate05.c:30: CONF: STOP
  fallocate05.c:30: CONF: STOP
  fallocate05.c:30: CONF: STOP

> 
> > I don't understand why there is need to find minimum value that can
> > satisfy this check. It looks like we are testing tst_fill_fs() more
> > than fallocate().
> > 
> > In other words, what is wrong with current test? Is the problem that
> > FALLOCATE_SIZE (1M) is not aligned on all platforms? Or is the test
> > invalid with FALLOCATE_SIZE that big? Or both?
> 
> I don't like to blindly rely on the assumption that block size is always
> a power of 2 and smaller than some magic number. Getting the real block
> size is trivial. The only real question is how many free blocks do we
> allow on a "full" file system in our tests. 1MB is just 16 blocks on
> PPC64 so the magic number isn't particularly big anyway.

OK, let's assume 16 is enough. Can we use that value also for ENOSPC check?
  TEST(fallocate(fd, 0, bufsize, 2 * statbuf.st_blksize));



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
