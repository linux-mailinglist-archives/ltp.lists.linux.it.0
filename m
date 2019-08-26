Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3709D1A4
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:29:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 203FD3C1CFD
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 16:29:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3705A3C0E60
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:29:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BC589140170E
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 16:29:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3FFEC1E2E6;
 Mon, 26 Aug 2019 14:29:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7F35D9CD;
 Mon, 26 Aug 2019 14:29:22 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23B1B24F2F;
 Mon, 26 Aug 2019 14:29:22 +0000 (UTC)
Date: Mon, 26 Aug 2019 10:29:21 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1492475067.8173800.1566829761941.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826111024.19053-1-chrubis@suse.cz>
References: <20190826111024.19053-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.205.130, 10.4.195.1]
Thread-Topic: Basic eBPF tests
Thread-Index: Dg49++dNVpVduZP+ZfMwqmHjCPfVkw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 26 Aug 2019 14:29:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/4] Basic eBPF tests
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
> I've ended up playing with the patchset and fixed a few loose ends on
> the map test and as I had the code at hand I decided to send v4 instead
> of pointing out the mistakes in a review.
> 
> There were numerous small changes for the map test:
> 
> * Make sure the key buffer is sized exactly for the content
> 
> * Initialized the array/hash element value in test setup
> 
> * Made the code flow a bit more obvious, it was hard to tell which
>   part was run for n == 0 and which for n == 1
> 
> Also it looks that for me the test that loads the eBPF program ends up
> with EPERM randomly at about 10th iteration both as unpriviledged and
> priviledged user, which is really strange.

There's one EPERM I can reproduce reliably with bpf_map test, which appears
to originate from "bpf_charge_memlock".

There's a deferred component to map freeing, and unchange appears to be part of it:
  bpf_map_release
    bpf_map_put
      INIT_WORK(&map->work, bpf_map_free_deferred);
        (deferred) bpf_uncharge_memlock

When I lower max locked memory, it's easy to hit:
# ulimit  -l 128; ./bpf_map01 -i 100
...
bpf_map01.c:52: CONF: bpf() requires CAP_SYS_ADMIN on this system: EPERM

Can you try bumping max locked memory to some high value and check
if that helps your case?

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
