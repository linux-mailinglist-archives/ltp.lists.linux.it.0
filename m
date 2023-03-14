Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C66B8EED
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 10:43:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB9893CAF94
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Mar 2023 10:43:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA5B43CACF9
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 10:43:12 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B88986005D7
 for <ltp@lists.linux.it>; Tue, 14 Mar 2023 10:43:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 177C51F88C;
 Tue, 14 Mar 2023 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678786991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+Oh+fb7pheJ9OlyEBZowVVm/371fhCTE3efyypPJSU=;
 b=Rr/7MmB9a6kI9eOsrzBAa7niD81xhs/OcL6Cq16kvIvC8pGw2dveoPQkBKaM6O4VaCKIsp
 ex9Pl0NZjuEJquJocoUMwgbc5RF+SjO/Mwvuc/zXESwfw+fisMMHXVMgfGIRIFG3isS+s6
 RzT29vDbEGyRtM0vSJ/12f9R+2Xd340=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73A2813A26;
 Tue, 14 Mar 2023 09:43:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xmR+Eq5BEGSBcgAAMHmgww
 (envelope-from <wegao@suse.com>); Tue, 14 Mar 2023 09:43:10 +0000
Date: Tue, 14 Mar 2023 05:43:07 -0400
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230314094307.GA4326@localhost>
References: <20230311023343.25177-1-wegao@suse.com>
 <20230312004420.16457-1-wegao@suse.com> <ZA7qq15aeKS+ZeJR@yuki>
 <20230313122100.GA12608@localhost> <ZA8Y+O7QFfVB0/62@yuki>
 <20230313134624.GA9783@localhost> <ZA8t7hVYRmF+I9k0@yuki>
 <20230314053151.GA22202@localhost> <ZBAtCbeSVH0/l137@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBAtCbeSVH0/l137@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] madvise11.c:Check loadable module before rmmod
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 14, 2023 at 09:15:05AM +0100, Cyril Hrubis wrote:
> Hi!
> > This is caused by "_" and "-", current search function not do this tricky translate part.
> > Input parameter is hwpoison_inject but actually string in modules.xxx is hwpoison-inject
> > 
> > /lib/modules/5.14.21-150400.24.41-default/modules.dep | grep hwpo
> > kernel/mm/hwpoison-inject.ko.zst:
> > 
> > Other info just FYI:
> > //modprobe can accept both "-" and "_"
> > localhost:/home/ltp # modprobe hwpoison-inject
> > localhost:/home/ltp # modprobe hwpoison_inject
> > 
> > //get info from lsmod and /proc use "_"
> > localhost:/home/ltp # lsmod | grep hwpo
> > hwpoison_inject        16384  0
> > localhost:/home/ltp # cat /proc/modules | grep hwp
> > hwpoison_inject 16384 0 - Live 0xffffffffc09d6000
> 
> Sounds like a bug that shoudl be fixed, we probably need to create two
> search strings, one with dashes and one with underscores and try to
> strstr() both.
> 
I found some logic handle both "_" and "-" in LTP other function such as:

static int tst_search_driver(const char *driver, const char *file)
{

        if (strrchr(driver, '-') || strrchr(driver, '_')) {
                char *driver2 = strdup(driver);
                char *ix = driver2;
                char find = '-', replace = '_';

                if (strrchr(driver, '_')) {
                        find = '_';
                        replace = '-';
                }

                while ((ix = strchr(ix, find)))
                        *ix++ = replace;

                ret = tst_search_driver_(driver2, file);
                free(driver2);
        }


I have sent my latest fix with patch v5(include some small reconstruct/clean work on current exit function)
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
