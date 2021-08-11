Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F53E91C5
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:44:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17E323C6FF1
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 14:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B3F193C5D9E
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:44:02 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFD6A1000A22
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 14:44:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3D40220171;
 Wed, 11 Aug 2021 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628685841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pr6DrBNGNwyyXyo9Y7fvAHMFqwOAMRsjI2WT81ljhIY=;
 b=ESDzCJe1GfHCsaw73v+UK4bUCAqZDizILYdv7b8R38CvIq1XaXQKtbHLqbqoc/Tp2r/SHu
 vyHaNJaO6rd84kgjrb5qpFyFD1SnR4wnn0qLWG9xoPFiDfU2LX2C3t3hy29/D5fUb94L6F
 8ftxO2t0dt78t2nLn98P8slHJ+fin8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628685841;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pr6DrBNGNwyyXyo9Y7fvAHMFqwOAMRsjI2WT81ljhIY=;
 b=EhAf1HomR0uwiboBFMg+G207mbUzqBA07b0ayU5dGZa1oDvbuzXMF7MFENG7D91vlVB/es
 K8hxKG9wRlpKhwAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2298613C27;
 Wed, 11 Aug 2021 12:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zauECBHGE2GaKQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 11 Aug 2021 12:44:01 +0000
Date: Wed, 11 Aug 2021 14:44:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YRPGHBuKHnvARkn+@yuki>
References: <20210809121238.1585673-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210809121238.1585673-1-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] shell: Add checkpoints api for new lib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index c6aa2c487..d4a1ab736 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -253,6 +253,27 @@ TST_RTNL_CHK()
>  	tst_brk TBROK "$@ failed: $output"
>  }
>  
> +TST_CHECKPOINT_WAIT()
> +{
> +	ROD tst_checkpoint wait 10000 "$1"
> +}
> +
> +TST_CHECKPOINT_WAKE()
> +{
> +	ROD tst_checkpoint wake 10000 "$1" 1
> +}
> +
> +TST_CHECKPOINT_WAKE2()
> +{
> +	ROD tst_checkpoint wake 10000 "$1" "$2"
> +}
> +
> +TST_CHECKPOINT_WAKE_AND_WAIT()
> +{
> +	TST_CHECKPOINT_WAKE "$1"
> +	TST_CHECKPOINT_WAIT "$1"
> +}
> +
>  tst_mount()
>  {
>  	local mnt_opt mnt_err
> @@ -558,6 +579,20 @@ tst_set_timeout()
>  	_tst_setup_timer
>  }
>  
> +_tst_init_checkpoints()
> +{
> +	local pagesize
> +
> +	LTP_IPC_PATH="/dev/shm/ltp_${TCID}_$$"
> +	pagesize=$(tst_getconf PAGESIZE)
> +	if [ $? -ne 0 ]; then
> +		tst_brk TBROK "tst_getconf PAGESIZE failed"
> +	fi
> +	ROD_SILENT dd if=/dev/zero of="$LTP_IPC_PATH" bs="$pagesize" count=1
> +	ROD_SILENT chmod 600 "$LTP_IPC_PATH"
> +	export LTP_IPC_PATH
> +}

Shouldn't we also delete the /dev/shm/ltp_${TCID}_$$ in the
_tst_do_exit() if LTP_IPC_PATH was set?

Other than that it looks fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
