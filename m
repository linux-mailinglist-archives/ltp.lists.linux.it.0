Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B82FC712807
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:08:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B27993CD180
	for <lists+linux-ltp@lfdr.de>; Fri, 26 May 2023 16:08:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ADA33C995F
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:08:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38C7E6010F5
 for <ltp@lists.linux.it>; Fri, 26 May 2023 16:08:01 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20B8A1FD76;
 Fri, 26 May 2023 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685110081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjBpSx4JpVO9gqYeqF3TPc+4IaY/zPuNd5eyF9uHPaE=;
 b=MmCUjnTb/PfNyYOYvO0Vc7wiKK1ZWVUpp/gVNvyBL/SMX+eyQvERFl8ZD4MZPJc30MzzIF
 f1dBiPPj+O6lHEiuqblIk3iePPC29Yh3ynj8Ct4pr3GAI505bS8YErjJ4pCoUi0P0N2pOD
 AuQALA+OmSPxtSKe0GEzobcUwt+CXxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685110081;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjBpSx4JpVO9gqYeqF3TPc+4IaY/zPuNd5eyF9uHPaE=;
 b=xs54p9MELugW2dtcEbXKCzYmU5dy5eeAsOBJN9kauJtHDWNC8Nhru/QebcvrWwFMLrytPH
 O0w+cV7wa42R4UCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E5126134AB;
 Fri, 26 May 2023 14:08:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PS3uNUC9cGTNcwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 26 May 2023 14:08:00 +0000
Date: Fri, 26 May 2023 16:07:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230526140759.GA805411@pevik>
References: <20230526133435.7369-1-mdoucha@suse.cz>
 <20230526133435.7369-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526133435.7369-3-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/7] Add test for CVE 2021-3656
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
Cc: Nicolai Stange <nstange@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

...
> --- /dev/null
> +++ b/testcases/kernel/kvm/kvm_svm02.c
...
> +/* Load FS, GS, TR and LDTR state from vmsave_buf */
> +static int guest_vmload(void)
> +{
> +	asm (
> +		"vmload\n"
Unfortunately, it fails on Debian oldstable [1].

kvm_svm02.c:37:3: error: too few operands for instruction
                "vmload\n"
                ^
<inline asm>:1:2: note: instantiated into assembly here
        vmload
        ^
kvm_svm02.c:48:3: error: too few operands for instruction
                "vmsave\n"
                ^
<inline asm>:1:2: note: instantiated into assembly here
        vmsave
        ^
2 errors generated.
make[3]: *** [/__w/ltp/ltp/testcases/kernel/kvm/Makefile:63: kvm_svm02-payload.o] Error 1

I wonder if there is an easy fix or reasonable simple way how to detect
unsupported toolchain.

Kind regards,
Petr

[1] https://github.com/pevik/ltp/actions/runs/5091551272/jobs/9151721119

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
