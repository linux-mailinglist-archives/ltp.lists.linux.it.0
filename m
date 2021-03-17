Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF433ED71
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:53:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54D1E3C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:53:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3BE243C2CFC
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:53:01 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 88C5F600D6C
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:53:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615974779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I/B232Ws7bCRjThXAbv1dTQ6IQWfs8FEXQo8Yuu/9Ks=;
 b=eSTl/BFdG2h8EMbNc5/EbuRH3Dv01Wep3fBYYzG3oolJZYKxUcB1dFF+cmPTYIAFu7hghe
 6MqBhvOPiuc4TMpHGj/xushiIVt+2iUVRatj8DuAFLGxntLHUQg59xFci1MPPCScjdKB/t
 JmqoKQctsbk+hM0O4WCO1aqrGrQAvAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Nq9O5KgvNyiqCOqFczDgIw-1; Wed, 17 Mar 2021 05:52:56 -0400
X-MC-Unique: Nq9O5KgvNyiqCOqFczDgIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4E2881621;
 Wed, 17 Mar 2021 09:52:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABBBF5D74F;
 Wed, 17 Mar 2021 09:52:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72A864BB7B;
 Wed, 17 Mar 2021 09:52:54 +0000 (UTC)
Date: Wed, 17 Mar 2021 05:52:54 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1233742536.40765616.1615974774212.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210317083347.9791-1-pvorel@suse.cz>
References: <20210317083347.9791-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.15, 10.4.195.20]
Thread-Topic: Add Maintainer Patch Review Checklist
Thread-Index: hLN/IcwTrTqgX0EeU+4dGZ/vvjDHeA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Add Maintainer Patch Review Checklist
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
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  doc/maintainer-patch-review-checklist.txt | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 doc/maintainer-patch-review-checklist.txt
> 
> diff --git a/doc/maintainer-patch-review-checklist.txt
> b/doc/maintainer-patch-review-checklist.txt
> new file mode 100644
> index 000000000..cfe3918c1
> --- /dev/null
> +++ b/doc/maintainer-patch-review-checklist.txt
> @@ -0,0 +1,32 @@
> +# Maintainer Patch Review Checklist
> +
> +Patchset should be tested locally and ideally also in maintainer's fork in
> +https://travis-ci.org/[Travis CI].
> +
> +Commit messages should have
> +
> +* author's `Signed-off-by` tag
> +* committer's `Reviewed-by` or `Signed-off-by` tag
> +* check also mailing lists for other reviewers / testers

Maybe "Fixes #" if it fixes github issue, so it's automatically closed?

> +
> +## New tests
> +New test should have
> +
> +* record in runtest file
> +* test run with more iteration (`-i 100`)
> +
> +### C tests
> +* use new
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C
> API]
> +* record in `.gitignore`
> +* check coding style with `checkpatch.pl`
> +(more in
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C
> coding style])
> +* docparse documentation
> +
> +### Shell tests
> +* use new
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#23-writing-a-testcase-in-shell[shell
> API]
> +* check coding style with `checkbashism.pl`
> +(more in
> https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#132-shell-coding-style[Shell
> coding style])
> +
> +## LTP library
> +For patchset touching library please check also
> +https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines[LTP
> Library API Writing Guidelines].

One more things that comes to mind:

After patch is accepted or rejected, set correct state and archive
in LTP patchwork instance: http://patchwork.ozlabs.org/project/ltp/list/


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
