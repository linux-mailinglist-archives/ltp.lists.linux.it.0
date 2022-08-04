Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B2589EB5
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 17:33:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F0A843C93F2
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 17:33:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27C083C933F
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 17:33:27 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4ADF96019A5
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 17:33:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 684BC4E623;
 Thu,  4 Aug 2022 15:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659627205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgqAvDRGRKbyzelNP7eRPGBQHRHBDH17MuR91kEvAys=;
 b=Gmly/p+Ar0ShQC6kWulggnRp4Lh0zyDvgHJB6pmzKZritUspzTw4+XwwMq2GeY2Pr1jWyK
 myPWm2gzAbybog+IfNAjp392JvAjh8o3gvgkIn8hWYvlVNBar2QhAzdDzF1/TnLM/j/a4J
 YTn8WCN2g3p7Q9JxjAliQLXO3PIrFBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659627205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgqAvDRGRKbyzelNP7eRPGBQHRHBDH17MuR91kEvAys=;
 b=lUhwujJL5Kflfa6QIGEfioQ0yn4lN90EhuJ78JdOyBGGF+J8CQULYclm8tOUwGICwC4qxl
 6ysdL2BAt5pH5xCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4765813A94;
 Thu,  4 Aug 2022 15:33:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rZRxEMXm62IlFAAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 04 Aug 2022 15:33:25 +0000
Message-ID: <2fd92c3d-a67e-3cfc-aaf8-ca35176cf399@suse.cz>
Date: Thu, 4 Aug 2022 17:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20220803175752.19015-1-pvorel@suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20220803175752.19015-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] generate_lvm_runfile.sh: Fix bashism
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
Cc: linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
`trap ... EXIT` cannot be used to emulate `trap ... ERR`. The latter
behaves as if every command/pipeline in the script (except conditions)
were wrapped in ROD. So `trap ... ERR` will trigger exit on any failure,
while `trap ... EXIT` will let the script continue after all errors and
then check exit code of only the very last command. That's not what we
want here.

On 03. 08. 22 19:57, Petr Vorel wrote:
> ERR is not on dash (tested on 0.5.11).
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/misc/lvm/generate_lvm_runfile.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/misc/lvm/generate_lvm_runfile.sh b/testcases/misc/lvm/generate_lvm_runfile.sh
> index 72b286a69..5bf5d91d6 100755
> --- a/testcases/misc/lvm/generate_lvm_runfile.sh
> +++ b/testcases/misc/lvm/generate_lvm_runfile.sh
> @@ -13,7 +13,7 @@ LVM_TMPDIR="$LVM_DIR/ltp/growfiles"
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
