Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5943EB69C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:15:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA0113C6576
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:15:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD9773C5A3A
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:15:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7B7DC10009DD
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:15:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA1BB1FFCC;
 Fri, 13 Aug 2021 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628864140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7D708sUJjIhpnFSYUDCfkMp54IVCz4JbR+FwjczP+o=;
 b=ajagwb8MAs+oSMa38g272DqlZbxy0L8zX9vg5Ze1KeKcQ8bSXr0K9AkCC906F2gbAnLTfC
 TI0yXALCACG/7M3qkERc9nKeJk6QaMGT00sRF2Q5QWy2l92/48P+u57B++78NYuC48Xa4b
 DY3zQzaWyWe4P7qSBWDqYbVA9gEp0ug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628864140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7D708sUJjIhpnFSYUDCfkMp54IVCz4JbR+FwjczP+o=;
 b=wVj38ABe2Uwcyr0n05YvFYz3FK+JfVMLE2UawsgJPTx2viPNXvvftT3nevWuGT/Y8NjaUN
 cjq3l9WLZOgauICA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9AD2413806;
 Fri, 13 Aug 2021 14:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id VhEUIox+FmG9CgAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Fri, 13 Aug 2021 14:15:40 +0000
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210806154557.19551-1-mdoucha@suse.cz> <YRZ4TmJWcL8zJgg6@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz>
Date: Fri, 13 Aug 2021 16:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRZ4TmJWcL8zJgg6@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/creat08: Convert to new API
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

On 13. 08. 21 15:49, Cyril Hrubis wrote:
> Hi!
> Btw, it looks that this is one of the test failing on tubmbleweed, it
> looks like the "bin" group is no longer present on the system.
> 
> Can't we just pick two non-zero numbers for the groupids instead of
> trying to resolve whatever groups are supposed to be on the system?
> 
> We may as well add an library API to request one or two group ids to the
> test library so that they are hardcoded only in a single place.
> 
> See:
> https://progress.opensuse.org/issues/96644
> https://openqa.opensuse.org/tests/1872454

The test passes on regular Tumbleweed, the ticket you've linked is about
JeOS. Yes, this needs to be fixed but I'd leave it to a separate
patchset. The rewrite isn't breaking anything that isn't already broken.
But you can drop the CVE test patch and I'll resubmit it with the new
patchset.

Latest Tumbleweed tests:
https://openqa.opensuse.org/tests/1873051#step/open10/8
https://openqa.opensuse.org/tests/1873529#step/open10/8

We can't pick just any group numbers. The test user (nobody) must be a
member of the first group but not the other. Using nobody/nogroup is
probably safe so for the second group we can just scan all existing
groups and pick for example max(gid)+1.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
