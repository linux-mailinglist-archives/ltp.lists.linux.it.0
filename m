Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE42757674
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jul 2023 10:23:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8460F3C99AE
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jul 2023 10:23:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DDB643C9753
 for <ltp@lists.linux.it>; Tue, 18 Jul 2023 10:23:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 483B8600A67
 for <ltp@lists.linux.it>; Tue, 18 Jul 2023 10:23:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E06221958;
 Tue, 18 Jul 2023 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1689668595;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMqvHz8OGWRyN0K8qmdv1+vw5tEmCojhNJoFEhtmOyg=;
 b=OGlfnLjP1iuKbfC1aIluhJ4OwGczslf9BXmA4/xPhDAv//fYA03+ydHikNgghZxStN5ZRj
 luMLW6S3zeWnjOnl0VsdQR1+PnP+HBTJho57kVncelshONNZcJ0WHOgPhO81TcZF+8vv2R
 aWPe0hxNxV3cTH2ADXHTRYbDgK/imos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1689668595;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMqvHz8OGWRyN0K8qmdv1+vw5tEmCojhNJoFEhtmOyg=;
 b=P666CgWuPfIgU4J9tHvJRDbB+B8hH8ORHye3b9/8bGEBKlpzXYl5ZUIexT1/wbc2+NoLQ5
 u3PZUUDv61YgR9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4335513494;
 Tue, 18 Jul 2023 08:23:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wT8PD/NLtmQAQQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 18 Jul 2023 08:23:15 +0000
Date: Tue, 18 Jul 2023 10:23:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <20230718082313.GA1140910@pevik>
References: <20230717153339.11904-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717153339.11904-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pipe06: Rewrite the test using new LTP
 API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Avinesh,

>  testcases/kernel/syscalls/pipe/pipe06.c | 133 ++++++------------------
...
> +static void setup(void)
>  {
> +	int max_fds;

> -		/* reset tst_count in case we are looping */
> -		tst_count = 0;
> +	max_fds = getdtablesize();
> +	tst_res(TINFO, "getdtablesize() = %d", max_fds);
> +	opened_fds = SAFE_MALLOC(max_fds * sizeof(int));
You don't free opened_fds in cleanup, that would be a memory leak.
...

> +static void cleanup(void)
>  {
> +	for (int i = 0; i < num_opened_fds; i++)
> +		SAFE_CLOSE(opened_fds[i]);
>  }
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run
> +};

I suggest to fix it with patch below.
With that:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

+++ testcases/kernel/syscalls/pipe/pipe06.c
@@ -12,6 +12,7 @@
  * limit on the number of open file descriptors has been reached.
  */
 
+#include <stdlib.h>
 #include "tst_test.h"
 
 static int fds[2];
@@ -43,6 +44,9 @@ static void cleanup(void)
 {
 	for (int i = 0; i < num_opened_fds; i++)
 		SAFE_CLOSE(opened_fds[i]);
+
+	if (opened_fds)
+		free(opened_fds);
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
