Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29444A3F55B
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2025 14:13:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5B8E3C90E0
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2025 14:13:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A58D93C19D9
 for <ltp@lists.linux.it>; Fri, 21 Feb 2025 14:13:29 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 849E5140DF97
 for <ltp@lists.linux.it>; Fri, 21 Feb 2025 14:13:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 233051FE24;
 Fri, 21 Feb 2025 13:13:27 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A2B013806;
 Fri, 21 Feb 2025 13:13:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5C2EAfd7uGdubgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Fri, 21 Feb 2025 13:13:27 +0000
Date: Fri, 21 Feb 2025 14:13:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Z7h8ABTkW3C2ysWZ@yuki.lan>
References: <20250221121344.2778278-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221121344.2778278-1-pvorel@suse.cz>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 233051FE24
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] lsmod01.sh: Whitelist zcrypt
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
Cc: Takashi Iwai <tiwai@suse.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> zcrypt (s390x specific module) has different refcnt:
> 
>     lsmod01 1 TINFO: lsmod output different from /proc/modules
>     118c118
>     < zcrypt 131072 9
>     ---
>     > zcrypt 131072 8
> 
> This is probably due libcrypto update to support hardware acceleration
> of some algorithm that kmod is using, which causes increasing refcnt.
> 
> Because it's would not be easy to get a generic mechanism to detect
> affected modules (ATM probably only zcrypt), whitelist parsing it.
> 
> Fixes: https://bugzilla.suse.com/show_bug.cgi?id=1237399

I read the bug, I guess that there isn't anything better than doing
this.

> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/commands/lsmod/lsmod01.sh | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
> index 8b7a0a7943..1fe399aa06 100755
> --- a/testcases/commands/lsmod/lsmod01.sh
> +++ b/testcases/commands/lsmod/lsmod01.sh
> @@ -14,6 +14,9 @@ TST_NEEDS_CMDS="lsmod"
>  
>  module_inserted=
>  
> +# zcrypt has higher refcnt

Maybe a bit better description:

# lsmod triggers zcrypt refcount increase if it links against libssl
# which uses hardware acceleration

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> +whitelist_modules='zcrypt'
> +
>  setup()
>  {
>  	if [ -z "$(cat /proc/modules)"  ]; then
> @@ -55,8 +58,8 @@ lsmod_matches_proc_modules()
>  	if [ "$lsmod_output" != "$modules_output" ]; then
>  		tst_res TINFO "lsmod output different from /proc/modules"
>  
> -		echo "$lsmod_output" > temp1
> -		echo "$modules_output" > temp2
> +		echo "$lsmod_output" | grep -v "^$whitelist_modules" > temp1
> +		echo "$modules_output" | grep -v "^$whitelist_modules" > temp2
>  		if tst_cmd_available diff; then
>  			diff temp1 temp2
>  		else

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
