Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38D663D49
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 10:52:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 434B13CB584
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Jan 2023 10:52:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F6FD3C85F1
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 10:51:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31A49600159
 for <ltp@lists.linux.it>; Tue, 10 Jan 2023 10:51:58 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D325567FC7;
 Tue, 10 Jan 2023 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673344317;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjhyU5TYAFjREDlJLiGOZFQuKOcR+HIBZhfkeI4rJMY=;
 b=uZLeNZ0SF94SAuH1Mr9qp2FhDyyBg/Ut+PFjjhjxmtFlGy1msBGwS+22iZXvyWlk7YrEJ5
 foN03KTYngV4Pw/gPEM80Zls0bzLGJjGoF8cHdjUxRXJzWgOwVGFexRbOXJ32DdLStQlQ6
 QNN+hMXP4A5eSeccO8zSxXtSTjet/FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673344317;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sjhyU5TYAFjREDlJLiGOZFQuKOcR+HIBZhfkeI4rJMY=;
 b=41AFl1DqnVlpfjtTnXApnEnteLwmJnxb2/0DJ1nsZw7MK4c1GSDh9OlvyawDEvhvmHSRf3
 TtSdi8qUeaRu+qDQ==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 98F4D2C141;
 Tue, 10 Jan 2023 09:51:57 +0000 (UTC)
References: <20221220144232.27950-1-andrea.cervesato@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Date: Tue, 10 Jan 2023 09:51:35 +0000
Organization: Linux Private Site
In-reply-to: <20221220144232.27950-1-andrea.cervesato@suse.com>
Message-ID: <87cz7miuo3.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Add runltp-ng to upstream
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Merged, thanks!

Andrea Cervesato via ltp <ltp@lists.linux.it> writes:

> runltp-ng is the next generation runner for Linux Testing Project and it
> will replace the current obsolete runltp script in the next future.
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
> Acked-by: Petr Vorel <pvorel@suse.cz>
> ---
> Use https protocol
>
>  .gitmodules     | 3 +++
>  tools/runltp-ng | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 160000 tools/runltp-ng
>
> diff --git a/.gitmodules b/.gitmodules
> index a3c34af4b..d1d558b9e 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -4,3 +4,6 @@
>  [submodule "tools/sparse/sparse-src"]
>  	path = tools/sparse/sparse-src
>  	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
> +[submodule "tools/runltp-ng"]
> +	path = tools/runltp-ng
> +	url = https://github.com/linux-test-project/runltp-ng.git
> diff --git a/tools/runltp-ng b/tools/runltp-ng
> new file mode 160000
> index 000000000..39792805b
> --- /dev/null
> +++ b/tools/runltp-ng
> @@ -0,0 +1 @@
> +Subproject commit 39792805b3c2c30bde665b01550994aeecff6071
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
