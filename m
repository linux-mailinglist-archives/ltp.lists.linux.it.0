Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C403785FBEE
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 16:11:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 934673D0082
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Feb 2024 16:11:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0FC473CF17E
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 16:11:21 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2102F603EBF
 for <ltp@lists.linux.it>; Thu, 22 Feb 2024 16:11:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44D1D1F76E;
 Thu, 22 Feb 2024 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708614679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BsuTu9wznyEfIwQHlrZ7LKw0lLGmK+nJQTZ9mTPNlk=;
 b=laFpqovCEvfsemivesxwV8jlSlg7Y6MNyigAftIg+HTln9h9q8UFrgw3N2TbYIovyzLp4T
 1F+jZYqlg8FiBalqvL6gKhplHVLyj/8XuYXBWgOBxLnMhVBFnMI9q/I4wKH6c7ex/m+u8v
 u8H2swK/6gxkNubXrCKnMkiHhM3Di/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708614679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BsuTu9wznyEfIwQHlrZ7LKw0lLGmK+nJQTZ9mTPNlk=;
 b=wsbBcKldu+Prt3S/hMumYlJhzWsSWi9JPTo4tf6uppzsWQwo1oQDTm1TMo2uJdhTY2VGGn
 NtTlJvkNho1LmaBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1708614677; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BsuTu9wznyEfIwQHlrZ7LKw0lLGmK+nJQTZ9mTPNlk=;
 b=AUw4g6BtO/pEfV75z/34HK5W42QRSiQ3cOIutVejvhOljpemp12RGdTaBBFb6Jj+DfNDzE
 5yUhv8CWiKrmiD+/F7DTgh99ueIuNbuyhQTtlFZYuMdQ2TDlBT740XVmKOqB7SR8aD/VP4
 mo2nmesskIlAnNFPUyqgJZ+TNLdZKWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1708614677;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BsuTu9wznyEfIwQHlrZ7LKw0lLGmK+nJQTZ9mTPNlk=;
 b=B6BP/xonGGH1HrGaDGQeqbV+R5hK8iNbCueLa4nf7Rf9t7iSARzgI5BebQybAJu6/UuVPg
 q/xRye5Dx7+cs1Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33F8413A8C;
 Thu, 22 Feb 2024 15:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AH7FCxVk12UiUwAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Thu, 22 Feb 2024 15:11:17 +0000
Date: Thu, 22 Feb 2024 16:10:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <Zddj0sT0wPvE5bhN@yuki>
References: <20240222150036.30594-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240222150036.30594-1-andrea.cervesato@suse.de>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.75 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-2.15)[95.93%]
X-Spam-Level: 
X-Spam-Score: -1.75
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2] Add more testcases in mkdir03
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
>  #define TST_ENOTDIR_DIR	"tst_enotdir/tst"
> @@ -41,6 +45,9 @@ static struct tcase {
>  	{NULL, EFAULT},
>  	{long_dir, ENAMETOOLONG},
>  	{TST_EEXIST, EEXIST},
> +	{TST_FOLDER, EEXIST},
> +	{TST_PIPE, EEXIST},
> +	{TST_SYMLINK, EEXIST},
This stil misses:

	{"/dev/zero", EEXISTS},

>  	{TST_ENOENT, ENOENT},
>  	{TST_ENOTDIR_DIR, ENOTDIR},
>  	{loop_dir, ELOOP},

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
