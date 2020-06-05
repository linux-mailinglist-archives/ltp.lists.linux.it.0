Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66A1EF30E
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 10:28:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF6D23C2F87
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 10:28:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DD9403C207E
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 10:28:05 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B780C616E3A
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 10:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591345683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYpkxStnfZ66XOBjO2aZKWdxDJeGvoZauHZhn66WLNE=;
 b=c8v0ke1rUbqeTnwGeU3h2YcbG4vVBFZNHv8CXZ8bnPplA2n2K152e1qBhy7WyyoytPsYrK
 ZPF0+E2+yeY2WsoaLpB8nX6lTgfkUrZhq0OoBq+LIV7Bo5dL3+Vl4zmX7QHV0bwHqTZUEZ
 zGwH/US09fEt1WfyTkk9srCWGxorKME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-to5q0RB2N2iPxRnn0gQmMg-1; Fri, 05 Jun 2020 04:27:59 -0400
X-MC-Unique: to5q0RB2N2iPxRnn0gQmMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00B3801503;
 Fri,  5 Jun 2020 08:27:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8DA7B605;
 Fri,  5 Jun 2020 08:27:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CA0318095FF;
 Fri,  5 Jun 2020 08:27:57 +0000 (UTC)
Date: Fri, 5 Jun 2020 04:27:56 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <203212099.14886500.1591345676708.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYuGwcE3zyMFQPpfA0CyW=4WOg9V=kCfKhS7b8930jQofA@mail.gmail.com>
References: <CA+G9fYuGwcE3zyMFQPpfA0CyW=4WOg9V=kCfKhS7b8930jQofA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.24]
Thread-Topic: syscalls: regression on mainline - ioctl_loop01 mknod07 setns01
Thread-Index: h8xjKV6yHmjuKbXhHe5kzYYXrqSt/g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP: syscalls: regression on mainline - ioctl_loop01
 mknod07 setns01
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
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, lkft-triage@lists.linaro.org,
 Viresh Kumar <viresh.kumar@linaro.org>, maco@android.com,
 Christoph Hellwig <hch@lst.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Following three test cases reported as regression on Linux mainline kernel
> on x86_64, arm64, arm and i386
> 
>   ltp-syscalls-tests:
>     * ioctl_loop01
>     * mknod07

Test updated:
  https://github.com/linux-test-project/ltp/commit/13fcfa2d6bdd1fb71c4528b47170e8e8fb3a8a32

>     * setns01

commit 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
changed errno that is returned for regular file from EINVAL to EBADF.
This appears to fit more current man page, so I think we need to fix
test to accept both. (I'm looking into that)


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
