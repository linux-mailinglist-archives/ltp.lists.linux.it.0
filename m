Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 522803F1D6D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 18:03:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D19923C5551
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 18:03:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 358A93C248D
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 18:03:22 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AA87F1A0042A
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 18:03:21 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0AD081FDBF;
 Thu, 19 Aug 2021 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629389001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=50BvLkelxcBIU7/QozEV4a/JCvjTlJqOBdWEslOwLe0=;
 b=qcml/A7UJtHmIPsGfU5GrvEiQqM/TwgDv1PJzDC+W4uFSf8v3vWbaddA1j1sEixfhJWuXe
 fqy7pe1eo7EL78L5kXpOuE+FdpBU3Cmf9+7bG0uGXpDG1nNer1wkK/b2kjt28N1SmukEqh
 wSdOGMqWUwM5f8HTE2ZbR+EqOXKgfk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629389001;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=50BvLkelxcBIU7/QozEV4a/JCvjTlJqOBdWEslOwLe0=;
 b=x/rev0t0PFFnc0gWeKdHZpD99+lbxFgxWrtlpaYsqeouB+JJsdfvTuG48Ztm97sCau09Al
 oWVeBj0Jm+ie5mDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DA27113A9D;
 Thu, 19 Aug 2021 16:03:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vqbXMsiAHmHgIwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 19 Aug 2021 16:03:20 +0000
Date: Thu, 19 Aug 2021 18:03:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YR6Ax7TXsa5tipei@pevik>
References: <20210819152154.16185-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819152154.16185-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.sh: fix ROD_SILENT command return
 status check
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

Hi Alexey,

> "local tst_out=$(some_command)" always returns status 0, i.e.
> not the return status of the command in the assignment, but the
> status for 'local' builtin command, which creates a new local
> variable inside the function.

> As a result, the library calls and tests that invoke ROD_SILENT
> don't actually check the return status of commands passed to it.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Very good catch, thanks!

Tested-by: Petr Vorel <pvorel@suse.cz>
Working the same in: bash, dash, busybox sh, mksh (android).

> The old API library function is also fixed.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
