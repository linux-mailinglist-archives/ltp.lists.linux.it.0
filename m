Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A45A5B57296
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Sep 2025 10:10:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 322F73CD9C1
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Sep 2025 10:10:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A3D23C7636
 for <ltp@lists.linux.it>; Mon, 15 Sep 2025 10:10:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DE6092001D5
 for <ltp@lists.linux.it>; Mon, 15 Sep 2025 10:10:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4AD3322274;
 Mon, 15 Sep 2025 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757923840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLaR5hpCkQB0JLaDrirBNLA3y9+oo8Li0ikMURch4Wk=;
 b=DhxtuIjKdzUVuObQ8CnLmSCjJjtDkbeLC0dQJwJOubVVqb+Jb9VA5gmQhZM1VGHb5SBzNU
 vxAJQKHcikn/6ZsMpgmndncs+2YlW7J4BhDh8/syFZlcv9d6lepoMOTvJd08UfV5ijmmIo
 rGtXmFZZNn60WuJrcRyucyF1+FLdo7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757923840;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLaR5hpCkQB0JLaDrirBNLA3y9+oo8Li0ikMURch4Wk=;
 b=W+K2gdsws45tNWecIv+J1rVs5Z2GeW6fvStYXbek4hhkmD7o/YnNqQF8KcsSeSP5M/Fryj
 j2yEFpYy0ytRQzCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DhxtuIjK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=W+K2gdsw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757923840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLaR5hpCkQB0JLaDrirBNLA3y9+oo8Li0ikMURch4Wk=;
 b=DhxtuIjKdzUVuObQ8CnLmSCjJjtDkbeLC0dQJwJOubVVqb+Jb9VA5gmQhZM1VGHb5SBzNU
 vxAJQKHcikn/6ZsMpgmndncs+2YlW7J4BhDh8/syFZlcv9d6lepoMOTvJd08UfV5ijmmIo
 rGtXmFZZNn60WuJrcRyucyF1+FLdo7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757923840;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLaR5hpCkQB0JLaDrirBNLA3y9+oo8Li0ikMURch4Wk=;
 b=W+K2gdsws45tNWecIv+J1rVs5Z2GeW6fvStYXbek4hhkmD7o/YnNqQF8KcsSeSP5M/Fryj
 j2yEFpYy0ytRQzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 347761368D;
 Mon, 15 Sep 2025 08:10:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id v6olDADKx2jpYQAAD6G6ig
 (envelope-from <akumar@suse.de>); Mon, 15 Sep 2025 08:10:40 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 15 Sep 2025 10:10:39 +0200
Message-ID: <12750853.O9o76ZdvQC@thinkpad>
In-Reply-To: <20250912073210.47637-2-pvorel@suse.cz>
References: <20250912073210.47637-1-pvorel@suse.cz>
 <20250912073210.47637-2-pvorel@suse.cz>
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; CTE_CASE(0.50)[];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.de:email,suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4AD3322274
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] ima_policy.sh: Optimize check for policy
 writable
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
Cc: selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
 Coiby Xu <coxu@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

On Friday, September 12, 2025 9:32:08 AM CEST Petr Vorel wrote:
> Previously policy was checked in setup and in all tests
> (redundant in test1). It should be enough to test in setup and after
> write in test1, but let's being careful and test before writing the
nit:
s/let's being/let's be
> policy in load_policy().
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Avinesh Kumar <akumar@suse.de>
for both the patches.

Regards,
Avinesh
> ---
>  .../kernel/security/integrity/ima/tests/ima_policy.sh      | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
> index af1fb0028c..1c4763d838 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2009 IBM Corporation
> -# Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2018-2025 Petr Vorel <pvorel@suse.cz>
>  # Author: Mimi Zohar <zohar@linux.ibm.com>
>  #
>  # Test replacing the default integrity measurement policy.
> @@ -11,8 +11,6 @@ TST_CNT=2
>  
>  setup()
>  {
> -	require_policy_writable
> -
>  	VALID_POLICY="$TST_DATAROOT/measure.policy"
>  	[ -f $VALID_POLICY ] || tst_brk TCONF "missing $VALID_POLICY"
>  
> @@ -24,6 +22,7 @@ load_policy()
>  {
>  	local ret
>  
> +	require_policy_writable
>  	exec 2>/dev/null 4>$IMA_POLICY
>  	[ $? -eq 0 ] || exit 1
>  
> @@ -43,7 +42,6 @@ test1()
>  
>  	local p1
>  
> -	require_policy_writable
>  	load_policy $INVALID_POLICY & p1=$!
>  	wait "$p1"
>  	if [ $? -ne 0 ]; then
> @@ -59,7 +57,6 @@ test2()
>  
>  	local p1 p2 rc1 rc2
>  
> -	require_policy_writable
>  	load_policy $VALID_POLICY & p1=$!
>  	load_policy $VALID_POLICY & p2=$!
>  	wait "$p1"; rc1=$?
> 





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
