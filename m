Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E933B40ED
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:53:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455A53C6F4F
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:53:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5F863C1DD3
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:52:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 39AB31A0100F
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:52:54 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 283F31FE63;
 Fri, 25 Jun 2021 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624614774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/T3V+Z2Re6oBPewm/p/MiAgQAOlNfHQC496DTho2dzw=;
 b=PFFQ1VNnzQjjOe3poZy2jn5YoKEEqCgbvaxLKC1CZQz0O3doZwrC7GQBUAcHzeCIKJ/veK
 S3ojQP5Ng6rE9RK9xQNIA5HRiPK2KMyKi7O9SFOI+lxoYl/LxHRVaW7emTQq8abXXf5E49
 hPiw/lhy4SAzgJhLFTPcb4KLUZI9t20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624614774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/T3V+Z2Re6oBPewm/p/MiAgQAOlNfHQC496DTho2dzw=;
 b=xxrngaGNhmP7wPtLOQ+nzB0t/IeIRBitwbQqz/9CQwXINggaCBjd7Ud+jPqq5ldPKt1bxV
 eMxMNJJ6f9DifsBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0A6F911A97;
 Fri, 25 Jun 2021 09:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624614774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/T3V+Z2Re6oBPewm/p/MiAgQAOlNfHQC496DTho2dzw=;
 b=PFFQ1VNnzQjjOe3poZy2jn5YoKEEqCgbvaxLKC1CZQz0O3doZwrC7GQBUAcHzeCIKJ/veK
 S3ojQP5Ng6rE9RK9xQNIA5HRiPK2KMyKi7O9SFOI+lxoYl/LxHRVaW7emTQq8abXXf5E49
 hPiw/lhy4SAzgJhLFTPcb4KLUZI9t20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624614774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/T3V+Z2Re6oBPewm/p/MiAgQAOlNfHQC496DTho2dzw=;
 b=xxrngaGNhmP7wPtLOQ+nzB0t/IeIRBitwbQqz/9CQwXINggaCBjd7Ud+jPqq5ldPKt1bxV
 eMxMNJJ6f9DifsBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YcbnAHan1WBiewAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 25 Jun 2021 09:52:54 +0000
Date: Fri, 25 Jun 2021 11:27:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YNWhdgAUp5e/hNwx@yuki>
References: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624081500.11715-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_test: setup TCID earlier in do_setup()
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

Hi!
> TCID can be NULL in tst_tmpdir() because it is set after do_setup():
> 
>     tst_run_tcases()
>         do_setup()
>             ...
>             tid = get_tid();
>             ...
>             tst_tmpdir()  /* using TCID here */
>         TCID = tid;

Good catch, I wonder how we missed this for so long...

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
