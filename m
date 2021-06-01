Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2983970F8
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:09:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 942843C5DF2
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:09:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C60DC3C55A3
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:09:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4B1D26001F5
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:09:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 93F84218AA;
 Tue,  1 Jun 2021 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622542150;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj5e2e/BC8Zcs6WqHmsxIifVJ52OMA5+Gi1DNUot+dg=;
 b=HHW6oQl1G1MtOy3lTDLvCosFiYSC7wG8Abd+eVEtyRdtQv1QMVVRnABcK32Yo8Um2KjnNm
 mJ+rXxiXpdHiEarRc5MSv7THK2EnLe8mS0oxC+WvnlrcQ4ziuJ5H4PpDqmD4MNmHpYjkHW
 OGJ5PhcXE3jJuKNRiMv8SSHJlSN1jBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622542150;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj5e2e/BC8Zcs6WqHmsxIifVJ52OMA5+Gi1DNUot+dg=;
 b=Z0D/F0bZwIPye4vcQ+luo+HuZ4rHkn1gd0J4kpm38Flw85Y3b3PSJE02KZU6zTeJMaVLSX
 zsHlvZujI5kHXMCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6DBDC118DD;
 Tue,  1 Jun 2021 10:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622542150;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj5e2e/BC8Zcs6WqHmsxIifVJ52OMA5+Gi1DNUot+dg=;
 b=HHW6oQl1G1MtOy3lTDLvCosFiYSC7wG8Abd+eVEtyRdtQv1QMVVRnABcK32Yo8Um2KjnNm
 mJ+rXxiXpdHiEarRc5MSv7THK2EnLe8mS0oxC+WvnlrcQ4ziuJ5H4PpDqmD4MNmHpYjkHW
 OGJ5PhcXE3jJuKNRiMv8SSHJlSN1jBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622542150;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oj5e2e/BC8Zcs6WqHmsxIifVJ52OMA5+Gi1DNUot+dg=;
 b=Z0D/F0bZwIPye4vcQ+luo+HuZ4rHkn1gd0J4kpm38Flw85Y3b3PSJE02KZU6zTeJMaVLSX
 zsHlvZujI5kHXMCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3na3GUYHtmDWAwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 10:09:10 +0000
Date: Tue, 1 Jun 2021 12:09:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YLYHRQYBwKz+JTlU@pevik>
References: <20210601094807.77790-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601094807.77790-1-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] network/lib6/getaddrinfo01: rewrite with the
 new API + use static hostnames
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

Hi Alexey,

> The test is now independent of various machine settings
> regarding the test host name as it adds predefined names
> and aliases to /etc/hosts file and restores it to its
> original state after completing the test.

> This should fix the following failures:
> * when gethostname() returns an alias name that doesn't
>   match canonical name;
> * No AAAA record for the returned name from gethostname().

> Addresses and names added to /etc/hosts are more or less
> unique, so that there are no conflicts with the existing
> configuration.

> Also most of the duplicate code is now gone.
...
> -	tst_resm(TPASS, "getaddrinfo IPv6 SOCK_STREAM/IPPROTO_UDP hints");
> +	if (access(host_file, W_OK))
I guess we don't have to bother with R_OK|W_OK (required R_OK for SAFE_CP()),
as no sane system would have disabled read permission on hosts file.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
