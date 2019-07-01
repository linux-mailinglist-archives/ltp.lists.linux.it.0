Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D45B572
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:00:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 451933C1DB8
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:00:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3E7473C1D78
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:00:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 012C31000BCF
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:00:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FB4C30B46F1;
 Mon,  1 Jul 2019 07:00:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 748F538E07;
 Mon,  1 Jul 2019 07:00:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65F14206D1;
 Mon,  1 Jul 2019 07:00:07 +0000 (UTC)
Date: Mon, 1 Jul 2019 03:00:04 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <17466941.30834903.1561964404173.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190628093709.6625-1-po-hsu.lin@canonical.com>
References: <20190628093709.6625-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.30]
Thread-Topic: cve/meltdown.c: abort the test if kallsyms was not enabled
Thread-Index: EqwSlxbA90Di5Nxdc0GJJ1FRyAOFdA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 01 Jul 2019 07:00:07 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cve/meltdown.c: abort the test if kallsyms was
 not enabled
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
> The cve-2017-5754 meltdown test does not work with a kernel that does
> not have CONFIG_KALLSYMS enabled (e.g. Ubuntu KVM kernel).
> 
> Add and extra check for /proc/kallsyms to determine if we can run it.
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

Pushed.

Thanks,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
