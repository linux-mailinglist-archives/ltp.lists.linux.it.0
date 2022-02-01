Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 211924A5BA0
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Feb 2022 12:56:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7B733C984B
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Feb 2022 12:56:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F1EA3C9826
 for <ltp@lists.linux.it>; Tue,  1 Feb 2022 12:56:38 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F0FFD1000672
 for <ltp@lists.linux.it>; Tue,  1 Feb 2022 12:56:37 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 261011F3A5;
 Tue,  1 Feb 2022 11:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643716597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J9beOxuPS4sNmk+REFx0rBjErHp0ugCvo/CShIdz/PA=;
 b=vx5LjEzfQPQ4dfaBrTkR+LoFszTyr3XSJZHW6+3mI9YDa55WC2Ag6ErFyHp6CZeOl91rNy
 iaq/VVlNRurtM/qAXRKtv3dNTXwHEGykunyJcdAewWm0Jp6IfZtUdxHnA/16HNd+xYIzGW
 gTEgujpLKF0a60P/9uj7gO4AYCXScfo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643716597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J9beOxuPS4sNmk+REFx0rBjErHp0ugCvo/CShIdz/PA=;
 b=mDXbTc5re9Djm3QTrZyGUoAyyWUGhuHJHVrJJsPJXvnrR008HpLSMvWH+oWPDSIRXmlXWg
 wKsSzs4xBpmrMRAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0836413D67;
 Tue,  1 Feb 2022 11:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6b/IAPUf+WHDPwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 01 Feb 2022 11:56:37 +0000
Date: Tue, 1 Feb 2022 12:58:31 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YfkgZ8Ab6Jl8udbv@yuki>
References: <20220126164703.7177-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126164703.7177-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Fix tst_mkfs_ doc
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
> diff --git a/include/old/test.h b/include/old/test.h
> index 2ae7dba71f..87287a8e7e 100644
> --- a/include/old/test.h
> +++ b/include/old/test.h
> @@ -193,7 +193,8 @@ int self_exec(const char *argv0, const char *fmt, ...);
>   * @dev: path to a device
>   * @fs_type: filesystem type
>   * @fs_opts: NULL or NULL terminated array of mkfs options
> - * @extra_opt: extra mkfs option which is passed after the device name
> + * @extra_opts: NULL or NULL terminated array of extra mkfs options which is
                                                                             ^
									     are
> + * passed after the device name.
>   */
>  #define tst_mkfs(cleanup, dev, fs_type, fs_opts, extra_opts) \
>  	tst_mkfs_(__FILE__, __LINE__, cleanup, dev, fs_type, \
> diff --git a/include/tst_mkfs.h b/include/tst_mkfs.h
> index b89bf812f6..c2d777facd 100644
> --- a/include/tst_mkfs.h
> +++ b/include/tst_mkfs.h
> @@ -9,7 +9,8 @@
>   * @dev: path to a device
>   * @fs_type: filesystem type
>   * @fs_opts: NULL or NULL terminated array of extra mkfs options
> - * @extra_opts: NULL or NULL terminated array of extra mkfs options
> + * @extra_opts: NULL or NULL terminated array of extra mkfs options which is
                                                                             ^
									     are
> + * passed after the device name.
>   */
>  void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
>  	       const char *dev, const char *fs_type,

With the minor mistake fixed:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
