Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 867164453CE
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 14:25:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12CFB3C7362
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Nov 2021 14:25:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49DE23C72BC
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 14:25:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 40D8D14000E8
 for <ltp@lists.linux.it>; Thu,  4 Nov 2021 14:25:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78C83218B8;
 Thu,  4 Nov 2021 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636032331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D1LhB0LPEB/DKjYiSJ5w845bQnyJ1F5EOBDOewCsDxs=;
 b=CC/QeMSRC4LWS73/Tfq1PGVl8DS6lazTZACEFsH+lCc5mnFV6NvbqIwLp4kZQQncEiU6U5
 TSkysAwol5lZYXfntKELmt8Fp++p5w/VBIzwMJu85ba6vGyDnmDYlDcghXQWXs2IbGjefP
 RiktjBvR2h0rTd3HNfB1j3qX61q9snA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636032331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D1LhB0LPEB/DKjYiSJ5w845bQnyJ1F5EOBDOewCsDxs=;
 b=6Ow7QBC92oFbpJApneKSu5WjQYyaLGKMhQ5EX3IExxEGpHTfT5Thdp7ATB7VSMDZMVtUqS
 FgdBc6XuG6HeysDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6667B13C68;
 Thu,  4 Nov 2021 13:25:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dieMF0vfg2FcKwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 04 Nov 2021 13:25:31 +0000
Date: Thu, 4 Nov 2021 14:26:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Message-ID: <YYPff0zN0ydo5Z9h@yuki>
References: <20211103100235.22007-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103100235.22007-1-bogdan.lezhepekov@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] netns_netlink: Ensure tuntap is enabled in
 kernel
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
>  testcases/kernel/containers/netns/netns_netlink.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/kernel/containers/netns/netns_netlink.c b/testcases/kernel/containers/netns/netns_netlink.c
> index ddd8ce910..f9ae255f5 100644
> --- a/testcases/kernel/containers/netns/netns_netlink.c
> +++ b/testcases/kernel/containers/netns/netns_netlink.c
> @@ -120,6 +120,7 @@ static struct tst_test test = {
>  	.forks_child = 1,
>  	.needs_kconfigs = (const char *[]) {
>  		"CONFIG_NET_NS=y",
> +		"CONFIG_TUN=y",

Shouldn't that be just "CONFIG_TUN" as that would match both
"CONFIG_TUN=y" and "CONFIG_TUN=m"?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
