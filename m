Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA472638B33
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Nov 2022 14:32:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99EFC3CC8C9
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Nov 2022 14:32:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBC7F3CC8B2
 for <ltp@lists.linux.it>; Fri, 25 Nov 2022 14:32:44 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 90FA01000EBE
 for <ltp@lists.linux.it>; Fri, 25 Nov 2022 14:32:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69B6C21AE4;
 Fri, 25 Nov 2022 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669383162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVQp4SsgIQ3FvybeaHo77q0JjBYSQz2KsN0V3PbERxs=;
 b=zDJtO9YrdQZmdLZlu5Ci5+vW82gWOs2YNlOWxpoiOVStEU5qqAHh0fJhnDlUf3XvjBTmog
 6pW/Hiiec9TJAKMchczX5kb3R7vRlnO7tW2UY2eK8XNVTKj6kujI/Mj9yudSdsgK9P3Gk/
 6UgoF3uvYX3FYaJykkiTTs8AYse6L9k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669383162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVQp4SsgIQ3FvybeaHo77q0JjBYSQz2KsN0V3PbERxs=;
 b=C28VM7gKg71y9Ki2dLBfRA8PaxxqlFI62KZNOgkP/OfvjNYjioo27Uino2rdffivTHpY+d
 +mo8gyWnsJW2lkAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C00D1361C;
 Fri, 25 Nov 2022 13:32:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7/MmEfrDgGOwTwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 25 Nov 2022 13:32:42 +0000
Message-ID: <d0b9e812-3f95-2dc3-2d72-5a73389d90a7@suse.cz>
Date: Fri, 25 Nov 2022 14:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, ltp@lists.linux.it
References: <20221125123129.102360-1-david@redhat.com>
 <20221125123129.102360-3-david@redhat.com>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20221125123129.102360-3-david@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] security/dirtyc0w_shmem: Drop useless
 needs_tmpdir tag
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
both patches look good.

Reviewed-by: Martin Doucha <mdoucha@suse.cz>

On 25. 11. 22 13:31, David Hildenbrand wrote:
> Compilation points out that:
>    testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c: useless tag:
>    needs_tmpdir
> 
> needs_tmpdir is implied by needs_checkpoints, so we can drop it.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c b/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
> index 1e3b194e7..14b8f8317 100644
> --- a/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
> +++ b/testcases/kernel/security/dirtyc0w_shmem/dirtyc0w_shmem.c
> @@ -109,7 +109,6 @@ static struct tst_test test = {
>   	.needs_checkpoints = 1,
>   	.forks_child = 1,
>   	.needs_root = 1,
> -	.needs_tmpdir = 1,
>   	.max_runtime = 120,
>   	.setup = setup,
>   	.cleanup = cleanup,

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
