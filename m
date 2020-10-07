Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B1F285DF3
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:14:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 954373C4AEB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 13:14:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7DCBA3C256C
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:14:45 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id ECD191400060
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 13:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602069283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fau/zTN83bMY5VjH/VZJytUEBBQcb23cQqp/EXNoJ6M=;
 b=K1/QCDET82+bLznZ3YI+48gN+h/6BGxAq7e1mzBVKbGrTqV3hCDCNuhKClpyPoNU4YiRHs
 3QGQ350S4jYK+fqh7aDxzyV3O88d2IGQxzLxYt7wXuXvbEAp40Y9VRN9cu8MMEIdkgLtuE
 zeSblGocZyFzBotMtr1dDYQ5smd3VcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-DnkgxBYcOVqodkmnnM_rFA-1; Wed, 07 Oct 2020 07:14:39 -0400
X-MC-Unique: DnkgxBYcOVqodkmnnM_rFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A55441015EC4;
 Wed,  7 Oct 2020 11:14:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 524F35D9DD;
 Wed,  7 Oct 2020 11:14:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59CB8181A869;
 Wed,  7 Oct 2020 11:14:35 +0000 (UTC)
Date: Wed, 7 Oct 2020 07:14:35 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1478290725.17134142.1602069275205.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201002202416.28972-1-petr.vorel@gmail.com>
References: <20201002202416.28972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.10]
Thread-Topic: cacheflush01: Rewrite into new API
Thread-Index: tKyuN72r4BqhTqMg7nWcjHRm2QuUYg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cacheflush01: Rewrite into new API
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
Cc: Ofer Levi <oferle@nvidia.com>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Vincent Chen <deanbo422@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> This syscall is currently (v5.9) supported on these architectures:
> arc, csky, mips, m68k, nds32, sh
> 
> constants are missing for m68k, not sure if the testcase is valid for it.
> Untested.
> 
> Test for __LTP__NR_INVALID_SYSCALL saves adding autotools check for
> <asm/cachectl.h>.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> FYI: I was going to ask for removal of this test, but all these archs are
> still supported. This test compiles on all archs now, but I haven't run
> it (I don't have access to none of these archs, not sure if LTP is even
> tested on these archs).

I haven't tested it too, but rewrite looks good.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
