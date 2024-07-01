Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A991DEC7
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2024 14:11:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 509013D3FE5
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2024 14:11:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 690AC3D3F7E
 for <ltp@lists.linux.it>; Mon,  1 Jul 2024 14:11:14 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E19951A0093E
 for <ltp@lists.linux.it>; Mon,  1 Jul 2024 14:11:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5FC8721AC6;
 Mon,  1 Jul 2024 12:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1719835872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAtXr74j4W/0/SwGNNl3sLMsn0+Co+1AjBZTFdpltxw=;
 b=WltPoexnCQns8pXD/qh87vgyhdDR3a292GFYFealQHPX416p/SUtXnkUEbqWErPVWr2wai
 rUBFE34INB9cgYM1hn/jtVmk5KZJWUFaRbcixNDNB88Bh0RRzc+J4+LWVGqcN0OXN6qwID
 qYsyptN4pvO0vLp3BqLTvuG5xGLYbkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1719835872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAtXr74j4W/0/SwGNNl3sLMsn0+Co+1AjBZTFdpltxw=;
 b=YjaOq6qlwl18xGYTCuld8xATVMdt+7b6hU/wCXIyzxWzE833w64AH/RTnEuAzX65HOlBiv
 DQgkDY7R+NbuMRBQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=WltPoexn;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=YjaOq6ql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1719835872; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAtXr74j4W/0/SwGNNl3sLMsn0+Co+1AjBZTFdpltxw=;
 b=WltPoexnCQns8pXD/qh87vgyhdDR3a292GFYFealQHPX416p/SUtXnkUEbqWErPVWr2wai
 rUBFE34INB9cgYM1hn/jtVmk5KZJWUFaRbcixNDNB88Bh0RRzc+J4+LWVGqcN0OXN6qwID
 qYsyptN4pvO0vLp3BqLTvuG5xGLYbkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1719835872;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAtXr74j4W/0/SwGNNl3sLMsn0+Co+1AjBZTFdpltxw=;
 b=YjaOq6qlwl18xGYTCuld8xATVMdt+7b6hU/wCXIyzxWzE833w64AH/RTnEuAzX65HOlBiv
 DQgkDY7R+NbuMRBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BE7213800;
 Mon,  1 Jul 2024 12:11:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DR8yEeCcgmZBRQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 01 Jul 2024 12:11:12 +0000
Date: Mon, 1 Jul 2024 14:10:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <ZoKc03XnRNQJY4bs@yuki>
References: <CAEemH2cDCEW_akeKDECceW_5+B1z+Vw0gpRiC-upePn3tPauLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cDCEW_akeKDECceW_5+B1z+Vw0gpRiC-upePn3tPauLQ@mail.gmail.com>
X-Spamd-Result: default: False [-4.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[abcd:email,suse.cz:email,suse.cz:dkim];
 TO_DN_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5FC8721AC6
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] perf_event_open03.c:95: TFAIL: Likely kernel memory leak
 detected
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Our automatic jobs keep throwing thus false positives on the daily test.
> After checking perf_event_open03.c, it uses the diff of MemAvailable as the
> final condition for memory leaks.
> 
>     perf_event_open03.c:95: TFAIL: Likely kernel memory leak detected
> 
> I think relying solely on the MemAvailable metric to detect a memory leak
> can be imprecise, because available memory can be influenced by various
> factors unrelated to the specific code being tested.
> 
> And "/sys/kernel/debug/kmemleak" maybe a good tool for diagnosing memory
> leak,
> but it is usually disabled on the stock kernel by default, so far I have no
> better idea
> how to improve that, any suggestions?
> 
> 
>     diff = SAFE_READ_MEMINFO("MemAvailable:");
> 
>     /* leak about 100MB of RAM */
>     for (i = 0; i < iterations; i++) {
>         ioctl(fd, PERF_EVENT_IOC_SET_FILTER, "filter,0/0@abcd");
>         check_progress(i);
>     }
> 
>     diff -= SAFE_READ_MEMINFO("MemAvailable:");
> 
>     if (diff > 50 * 1024)
>         tst_res(TFAIL, "Likely kernel memory leak detected");
>     ...

Hmm, maybe we can sample the MemAvailable a few times, e.g. every 20MB
leaked and fail the test if we found that most samples have increased
the value.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
