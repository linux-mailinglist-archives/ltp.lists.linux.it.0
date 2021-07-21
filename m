Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C13D14B9
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 18:59:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ED603C8195
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Jul 2021 18:59:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 57AE73C6160
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 18:59:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 53EDB600BBC
 for <ltp@lists.linux.it>; Wed, 21 Jul 2021 18:59:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 803361FECD;
 Wed, 21 Jul 2021 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626886787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4wpSCSXNwCf74eHEnTwKVL6ml3IKo4KwU4SWsWM4Two=;
 b=fU26As4MazSAwdRiEMbWUgxBHE4rSTmO4UqfXjdRyhVSly1CsBhuUTdSEseik2ziiCi2KC
 qL+LWJYeh4ZCQDFTrkfe+hrXN+BOXgSeNRa7UPfgx8x/0rnFBiQ5zVaE3sCk84jKj2HWnD
 yEq3FZIHOj7H/VxnPXGk8qDmYAwby40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626886787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4wpSCSXNwCf74eHEnTwKVL6ml3IKo4KwU4SWsWM4Two=;
 b=bK6nP9iFeeAR+j9KaNrb6yKTKj8FeLCBRUfkl2AUG+CK7AXhlXRLkx6/oSEqd/06VDmFHP
 8b1YuxoqYyagmYCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65F1013522;
 Wed, 21 Jul 2021 16:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PPFlGINS+GD/IwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 21 Jul 2021 16:59:47 +0000
Date: Wed, 21 Jul 2021 18:34:20 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: xueshi hu <hubachelar@gmail.com>
Message-ID: <YPhMjMs+mL0OYyQx@yuki>
References: <20210323133137.2280947-1-hubachelar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323133137.2280947-1-hubachelar@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] change mmap flags from PROT_EXEC to PROT_READ
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
> In some architecture(e.g., mips), PROT_EXEC doesn't guarantee PROT_READ,
> which will cause segment fault. In others architectures, PROT_READ is
> more accurate.

First of all sorry for the late response.

> Signed-off-by: xueshi hu <hubachelar@gmail.com>
> ---
>  testcases/kernel/syscalls/mmap/mmap03.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/mmap/mmap03.c b/testcases/kernel/syscalls/mmap/mmap03.c
> index b957a3218..2fcf1ef17 100644
> --- a/testcases/kernel/syscalls/mmap/mmap03.c
> +++ b/testcases/kernel/syscalls/mmap/mmap03.c
> @@ -85,7 +85,7 @@ int main(int ac, char **av)
>  		 * with execute access.
>  		 */
>  		errno = 0;
> -		addr = mmap(0, page_sz, PROT_EXEC,
> +		addr = mmap(0, page_sz, PROT_READ,
>  			    MAP_FILE | MAP_SHARED, fildes, 0);

This is not correct fix. The test actually expects that on certain
architectures PROT_EXEC does not imply PROT_READ but that check is
missing mips, so this should probably be fixed with:

diff --git a/testcases/kernel/syscalls/mmap/mmap03.c b/testcases/kernel/syscalls/mmap/mmap03.c
index b957a3218..9d94d2653 100644
--- a/testcases/kernel/syscalls/mmap/mmap03.c
+++ b/testcases/kernel/syscalls/mmap/mmap03.c
@@ -124,7 +124,7 @@ int main(int ac, char **av)
                                         "correct");
                        }
                }
-#if defined(__ia64__) || defined(__hppa__)
+#if defined(__ia64__) || defined(__hppa__) || defined(__mips__)
                if (pass) {
                        tst_resm(TPASS, "Got SIGSEGV as expected");
                } else {

Does this change fixes the test for you?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
