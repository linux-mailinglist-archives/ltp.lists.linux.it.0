Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE281C4F0C
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 09:28:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 219583C267F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 09:28:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4AC373C2670
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:28:40 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7F492600952
 for <ltp@lists.linux.it>; Tue,  5 May 2020 09:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588663717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=sCylAbnKOz0Zmdfuxm7/2sMYlXGhWn0H9oq2U+BPfBI=;
 b=hA4P9S5La/pNbYvn1wjhRnLLTHpvzlz0kx/iOf7iV9onaeyxgyx0+JLSZ2TLo1LlgmwJbI
 JG0AcWlm4V/NfFyjYTX6/UKkCxSiF3aNE/mKEZh1x611IjtkbaoQE66iohQ5D2QE5A28z/
 VD9lhJe/U3ntaMNlxfBY/ScWUMCr9Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-LmAabB3TPXGgrJC-4U7Cbw-1; Tue, 05 May 2020 03:28:35 -0400
X-MC-Unique: LmAabB3TPXGgrJC-4U7Cbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970831800D4A;
 Tue,  5 May 2020 07:28:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0A470547;
 Tue,  5 May 2020 07:28:34 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BDDD1809541;
 Tue,  5 May 2020 07:28:34 +0000 (UTC)
Date: Tue, 5 May 2020 03:28:34 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: libc-alpha@sourceware.org
Message-ID: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
In-Reply-To: <100149681.11244932.1588661282331.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.23]
Thread-Topic: clone(CLONE_IO) failing after kernel commit commit ef2c41cf38a7
Thread-Index: MpwHdZijA03NS8cyLC4emBkkIlAbnQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: christian.brauner@ubuntu.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I'm seeing an issue with CLONE_IO and libc' clone() on ppc64le,
where flags parameter appears to be sign extended before it's passed
to kernel syscall.

This is an issue since kernel commit ef2c41cf38a7 ("clone3: allow
spawning processes into cgroups"), because there's now a check for
flag that userspace didn't intend to pass:

static int cgroup_css_set_fork(struct kernel_clone_args *kargs)
        __acquires(&cgroup_mutex) __acquires(&cgroup_threadgroup_rwsem)
        if (!(kargs->flags & CLONE_INTO_CGROUP)) {   // CLONE_INTO_CGROUP == 0x200000000ULL
                kargs->cset = cset;
                return 0;
        }

        f = fget_raw(kargs->cgroup);
        if (!f) {
                ret = -EBADF;
                goto err;
        }

Reproducer:

#define _GNU_SOURCE
#include <sched.h>
#include <stdio.h>
#include <sys/wait.h>

char stack[2*1024*1024];

static int do_child(void *arg)
{
        printf("hello");
        return 0;
}

int main(void)
{
        clone(do_child, stack+1024*1024, CLONE_IO|SIGCHLD, NULL, NULL, NULL, NULL);
        return 0;
}

reliably hits EBADF with glibc-2.31.9000-12.fc33.ppc64le and 5.7.0-0.rc2 kernel:
  clone(child_stack=0x1011ffe0, flags=CLONE_IO|0xffffffff00000000|SIGCHLD) = -1 EBADF (Bad file descriptor)

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
