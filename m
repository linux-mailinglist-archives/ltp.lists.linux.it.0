Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C17053FF0A9
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:00:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92D153C9921
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 18:00:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B90B3C2CC4
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:00:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2F6C31400F56
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 18:00:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6035C1FFC2;
 Thu,  2 Sep 2021 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630598441;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bgm46FahFRlngPs8zos8GTfwMY8PAg3p0edvBE+KcPA=;
 b=Zr1htcUS+2geVn/7Rmp1BTVcKqisgJMglTWEobE+P2D7eQipah2fnCyvR+vhN4BOAMWRD1
 EDQZG3lVm4VMCd7GyZizs6h5WRFx9DcP54yTXY8OZP+l/JyxB+hF+sVGSbAQTiuAJZv16X
 jEZTXpuiNB8IdUBAD4y9hb1/rv7RAvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630598441;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bgm46FahFRlngPs8zos8GTfwMY8PAg3p0edvBE+KcPA=;
 b=5zTEzncEWo1nOzoVOj8b++JefvTfCqHcuaU/AhyZvG62HyRHDOodWwxADNYdNACrXUJiFg
 1X5NX/SH6ONN3RCg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0187C1372E;
 Thu,  2 Sep 2021 16:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id DEXhMCj1MGG5QAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 16:00:40 +0000
Date: Thu, 2 Sep 2021 18:00:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YTD1Jl8USLijLL/O@pevik>
References: <20210901151655.95760-1-krzysztof.kozlowski@canonical.com>
 <20210901151655.95760-3-krzysztof.kozlowski@canonical.com>
 <YTCI3O7Et+VvYJfc@pevik>
 <21179557-f1d9-4129-533e-eac6bfe8684b@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21179557-f1d9-4129-533e-eac6bfe8684b@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/3] controllers/cpuacct: fix rmdir failures on
 early test abort
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

> On 02/09/2021 10:18, Petr Vorel wrote:
> > Hi Krzysztof,

> > ...
> >> -	if [ -d "$testpath/subgroup_1" ]; then
> >> -		rmdir $testpath/subgroup_*
> >> +	if [ "$testpath" ]; then
> >> +		if [ -d "$testpath/subgroup_1" ]; then
> >> +			rmdir $testpath/subgroup_*
> >> +		fi
> >> +		rmdir $testpath
> >>  	fi

> >> -	rmdir $testpath
> >> -

> > LGTM, but how about use `rm -rf' instead?

> > e.g.

> > if [ "$testpath" ]; then
> > 	rm -rf $testpath
> > fi

> > That could simplify checks. Or is it needed to use `rmdir' to make sure there is
> > no content in the directory? I suppose check like this is needed in cleanup,
> > thus no problem to use `rm -rf'.

> It isn't the point of this patch. I don't add here rmdir - all this code
> was here before. The only thing added here is to check whether the
> "testpath" variable is set or not.
Agree.

> I think using rm -rf should work, but anyway it's a separate commit :)
Agree, I just thought in simple thing like this it could be squashed (you add
code which then will be deleted), but sure, you're right.

I'll handle the cleanup with rm (unless you send follow up patch yourself).

Kind regards,
Petr


> Best regards,
> Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
