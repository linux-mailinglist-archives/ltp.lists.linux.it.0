Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F195D4E69DA
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 21:31:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5055F3C70D9
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Mar 2022 21:31:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2D593C0358
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 21:31:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3DF061A0068C
 for <ltp@lists.linux.it>; Thu, 24 Mar 2022 21:31:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58A711F745;
 Thu, 24 Mar 2022 20:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648153908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls6dCcTOcUlGxq1yNiz9K3cuVwMTpXAwnTAjmWauH5w=;
 b=v+3rW0ib7BuhEr35j/RB6Td6zrK/KchfNE37EtVKEcfevjF1XhLIPVJfMDSixBa4ejbx8f
 6GgfQ0SCXERfZkN8bamsOEcHTtVlq57H+hkgrcXLjqTeK8VlUgiV/q5PaEi9QK3iwWPIc2
 jZ1ftI+TV+7PUXD0Eot/Z6xyB1qKddo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648153908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls6dCcTOcUlGxq1yNiz9K3cuVwMTpXAwnTAjmWauH5w=;
 b=WCR0/OV2JrkRNClNcTtqyeMtvKoeIOxpeSJbMwNiDaG9zoB/WLMrlFKxQwpDd1UsyilPLZ
 ZkDXAe5JNe5w1bDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E744213498;
 Thu, 24 Mar 2022 20:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DteuNTPVPGKoGQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 24 Mar 2022 20:31:47 +0000
Date: Thu, 24 Mar 2022 21:31:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <YjzVMbJi87drjKr1@pevik>
References: <20220315122351.8556-1-andrea.cervesato@suse.de>
 <20220315122351.8556-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315122351.8556-2-andrea.cervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/8] Rewrite userns01.c using new LTP API
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

Hi Andrea,

>  testcases/kernel/containers/userns/common.h   |  58 +++++++++
...
> +static inline int check_newuser(void)
check_newuser() always return 0, it's return value is not used in any test.
Maybe pid was planned to be used in original implementation, but for now I'd
change return type to void.

> +{
> +	int pid, status;
> +
> +	if (tst_kvercmp(3, 8, 0) < 0)
> +		tst_brk(TCONF, "CLONE_NEWUSER not supported");
> +
> +	pid = ltp_clone_quick(CLONE_NEWUSER | SIGCHLD, dummy_child, NULL);
> +	if (pid == -1)
> +		tst_brk(TCONF | TTERRNO, "CLONE_NEWUSER not supported");
> +
> +	SAFE_WAIT(&status);
> +
> +	return 0;
> +}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
