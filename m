Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2671582642
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 14:20:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D78E3C61C0
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 14:20:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 959843C0282
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 14:20:40 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC0D92005E7
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 14:20:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF543347B2;
 Wed, 27 Jul 2022 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1658924438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QNiXbxY9MJDTPsXywg9UJlBctjzT+PuvTLlfMadmpw=;
 b=g1He73NcbQt1pWlT+POELSerVyX2CAbgrzWM/4URozvNeC9SXdx/l/9X9zSAUNQn56xT2Q
 09RvVolnkmTIKDoBADZFrkAOT8qptyITRpczx9HvvGeowj/8WsTRj5S0Q0y0p6wEuXp/fm
 VYlqSMaW7MF5+FubKJUiN+NRcLadESM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1658924438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+QNiXbxY9MJDTPsXywg9UJlBctjzT+PuvTLlfMadmpw=;
 b=Rucmj8BMvBC++MypErnfO9sP1bmwBc6z+iWZqztuD15oldXPRqjJ2h55jZF+4c1FUT+91k
 JrhOqDwODmmkwlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A3D113A8E;
 Wed, 27 Jul 2022 12:20:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PkoJF5Yt4WIaGwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Jul 2022 12:20:38 +0000
Date: Wed, 27 Jul 2022 14:20:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Message-ID: <YuEtlIt0JXSbKRm7@pevik>
References: <cover.1658872195.git.luke.nowakowskikrijger@canonical.com>
 <b3e568e56f0de2421c2c2fb82968f9fd73c3fcec.1658872195.git.luke.nowakowskikrijger@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3e568e56f0de2421c2c2fb82968f9fd73c3fcec.1658872195.git.luke.nowakowskikrijger@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 02/10] controllers: Expand cgroup_lib shell
 library
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

Hi Luke,

> v5->v6: Added $ret to capture return code and added return $ret
> 	after tst_brk calls.

>  testcases/kernel/controllers/cgroup_lib.sh | 137 ++++++++++++++++++---
...
> +# Mounts and configures the given controller
> +# USAGE: cgroup_require CONTROLLER
> +cgroup_require()
> +{
> +	local ctrl="$1"
> +	local ret
> +
> +	[ $# -eq 0 ] && tst_brk TBROK "cgroup_require: controller not defined"
> +
> +	[ ! -f /proc/cgroups ] && tst_brk TCONF "Kernel does not support control groups"
> +
> +	_cgroup_state=$(tst_cgctl require "$ctrl" $$)
> +	ret=$?
> +
> +	if [ $ret -eq 32 ]; then
> +		tst_brk TCONF "'tst_cgctl require' exited. Controller is probably not available?"
> +		return $ret
FYI I merged this part as is, but I'd personally avoid using return in TCONF:
1) return value is not anywhere used, thus plain return would be enough.
2) Keeping $? in $ret helps to avoid first TBROK ("'tst_cgctl require' exited") and
second TBROK will not be presented due $_cgroup_state being empty on error (you
print all errors to stderr.
My concern was just not to overwrite $?

Kind regards,
Petr

> +	fi
> +
> +	if [ $ret -ne 0 ]; then
> +		tst_brk TBROK "'tst_cgctl require' exited."
> +		return $ret
> +	fi
> +
> +	[ "$_cgroup_state" = "" ] && tst_brk TBROK "cgroup_require: No state was set after call to tst_cgctl require?"
> +
> +	return 0
>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
