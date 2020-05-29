Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D97011E7A91
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 12:28:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EB483C3188
	for <lists+linux-ltp@lfdr.de>; Fri, 29 May 2020 12:28:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 6F3413C3171
 for <ltp@lists.linux.it>; Fri, 29 May 2020 12:28:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B35A1200DBD
 for <ltp@lists.linux.it>; Fri, 29 May 2020 12:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590748087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VyFp3p8TQTWt/Jm8LE955dPDjQIyBiuV/OnkgcfKIOI=;
 b=D7Dzri06HAWc5P0W9PUUuxjX6qte/pXzFiR7HascgGhJCVCLIA/FYsray+A/iUmZJ9WfIz
 uW9gZK/F2ezFpjfK0YpgbnKVMxqkjhHYGl0gZqwFKoYGU1M5WGXi5/NzkT5OyAEOro9zfE
 E2VuKTT6KJ+GiVVgaFa9FH9AyTw7ZJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-CgovPER3NUyoRmNtKDGEfQ-1; Fri, 29 May 2020 06:28:03 -0400
X-MC-Unique: CgovPER3NUyoRmNtKDGEfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 634A0474;
 Fri, 29 May 2020 10:28:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4226298C;
 Fri, 29 May 2020 10:28:02 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55E501809541;
 Fri, 29 May 2020 10:28:02 +0000 (UTC)
Date: Fri, 29 May 2020 06:28:02 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1187623618.14050931.1590748082097.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200528111504.12638-1-pvorel@suse.cz>
References: <20200528111504.12638-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: tst_taint.h Add taint for randstruct
Thread-Index: eJe+7KPsLTgi+uJMLWlswlWh4LTwng==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_taint.h Add taint for randstruct
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
> Added in kernel 4.17.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  include/tst_taint.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/tst_taint.h b/include/tst_taint.h
> index 0acc1140c..cfa84dded 100644
> --- a/include/tst_taint.h
> +++ b/include/tst_taint.h
> @@ -60,7 +60,8 @@
>  #define TST_TAINT_E     (1 << 13) /* unsigned module was loaded */
>  #define TST_TAINT_L     (1 << 14) /* A soft lock-up has previously occurred
>  */
>  #define TST_TAINT_K     (1 << 15) /* kernel has been live-patched */
> -#define TST_TAINT_X	(1 << 16) /* auxiliary taint, for distro's use */
> +#define TST_TAINT_X     (1 << 16) /* auxiliary taint, for distro's use */
> +#define TST_TAINT_T     (1 << 17) /* kernel was built with the struct
> randomization plugin */

ack, this is trivial enough to push directly


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
