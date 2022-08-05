Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AFD58ABB0
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 15:34:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56EFA3C949B
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Aug 2022 15:34:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AC613C1B13
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 15:34:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9CB831A007AE
 for <ltp@lists.linux.it>; Fri,  5 Aug 2022 15:34:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C890B20018;
 Fri,  5 Aug 2022 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659706474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6PX/Kdcvq88DTQdyfqGPTxqQw3Sa70At8LUwimTUyg=;
 b=jD87V4N01B5acvnTlQe0ph638XHIECdMhNF6aYNwJ9w/YzfPNxaZcpeIka5vBa+TBPIWqR
 Zb3G/n+muBZDtK5hC5iIiYmtm3X3X8GmgcYT6n688AyTtVHO6iUJWKLrqL6oRUPQ8DFbgJ
 CMPcV+ELX7Zb3ti1nTDpHE7oTnjmkB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659706474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6PX/Kdcvq88DTQdyfqGPTxqQw3Sa70At8LUwimTUyg=;
 b=v11KLUYb2HeMqu0ZQQGkLy5eFm5Hgk78nUqeDrtJFA7rECTEIKJ1FuId23uEmlWTGGRphu
 NGjJ/++yBnQGgrCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6E14133B5;
 Fri,  5 Aug 2022 13:34:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dDJhK2oc7WK/MwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Fri, 05 Aug 2022 13:34:34 +0000
Message-ID: <62e13855-a79a-3e8b-911c-c621e45f8b8d@suse.cz>
Date: Fri, 5 Aug 2022 15:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20220805070512.31805-1-pvorel@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220805070512.31805-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] generate_lvm_runfile.sh: Fix bashism
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
yes, running shell with -e would work. But there's a problem that
tst_test.sh currently fails to initialize in that shell mode. I've
tracked the problem down to incorrect use of tst_color_enabled() inside
tst_res() - the call needs to be wrapped in an `if ... then` to work
correctly under /bin/sh -e.

One more thing, the `exit 0` is unnecessary in the trap. This would work
just fine:
[ $? -eq 0 ] || tst_brk TBROK ...

And a comment explaining the need for `/bin/sh -e` would be useful.

On 05. 08. 22 9:05, Petr Vorel wrote:
> ERR is not on dash (tested on 0.5.11).
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Changes v1-v2:
> * add -e (i.e. set -e)
> 
>  testcases/misc/lvm/generate_lvm_runfile.sh | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/misc/lvm/generate_lvm_runfile.sh b/testcases/misc/lvm/generate_lvm_runfile.sh
> index 72b286a69..599d6c0e7 100755
> --- a/testcases/misc/lvm/generate_lvm_runfile.sh
> +++ b/testcases/misc/lvm/generate_lvm_runfile.sh
> @@ -1,6 +1,7 @@
> -#!/bin/sh
> +#!/bin/sh -e
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
> +# Copyright (c) Linux Test Project, 2022
>  #
>  # Generate LTP runfile for LVM tests (runtest/lvm.local)
>  
> @@ -13,7 +14,7 @@ LVM_TMPDIR="$LVM_DIR/ltp/growfiles"
>  
>  generate_runfile()
>  {
> -	trap 'tst_brk TBROK "Cannot create LVM runfile"' ERR
> +	trap '[ $? -eq 0 ] && exit 0 || tst_brk TBROK "Cannot create LVM runfile"' EXIT
>  	INFILE="$LTPROOT/testcases/data/lvm/runfile.tpl"
>  	OUTFILE="$LTPROOT/runtest/lvm.local"
>  	FS_LIST=`tst_supported_fs`


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
