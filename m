Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2DC15BE92
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 13:40:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104B73C2542
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Feb 2020 13:40:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0C9103C244E
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 13:40:50 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id C3A7C1A0179B
 for <ltp@lists.linux.it>; Thu, 13 Feb 2020 13:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581597647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYd0ClMMRQkc99ISMx278x5iTcbuwhti3KtXlNOo7IU=;
 b=al+on+8TzpLkJTnSCPI9uTRVuBiEEdjh/kzRuMDYgdiqmOAjHeL3QAugxkfqHWgsZr03kG
 Qjc9THThD3Xf3oCImOOoZ/ithycb/94yQ9tyIFCnacC4dK+VzE3sC9r7CqGmmTLOmhqi+p
 ghg/S2aeQGYDccN6wPMnJEQ9FeMXivE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-v5W9-7dUPvmoQORlwcrgCw-1; Thu, 13 Feb 2020 07:40:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42AAE8010C4;
 Thu, 13 Feb 2020 12:40:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BAB119C70;
 Thu, 13 Feb 2020 12:40:44 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F3601809563;
 Thu, 13 Feb 2020 12:40:44 +0000 (UTC)
Date: Thu, 13 Feb 2020 07:40:44 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1420373308.7517416.1581597644001.JavaMail.zimbra@redhat.com>
In-Reply-To: <1581590121-4626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1581590121-4626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1581590121-4626-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.25]
Thread-Topic: syscalls/kill11,abort01: lower MIN_RLIMIT_CORE size
Thread-Index: OSmwlMo3SSBJgAfNo6vejNjMuPcm9w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: v5W9-7dUPvmoQORlwcrgCw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/kill11,
 abort01: lower MIN_RLIMIT_CORE size
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
> From ulimit manpage, ulimit -c options used 512-bytes-block in posix mode
> and used 1024-bytes-block in common mode. Usually, this case used "ulimit
>  -c 1024" to test, but it will report TCONF in posix mode under unprivileged
>  user.
> Since these two cases only check correct signal, lower this size doesn't
> affect
> this result. This also can avoid github issue(640[1],83[2]).
> 
> [1]https://github.com/linux-test-project/ltp/issues/640
> [2]https://github.com/linux-test-project/ltp/issues/83
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

both look good to me, ack


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
