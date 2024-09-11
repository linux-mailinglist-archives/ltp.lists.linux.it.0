Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA9975455
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2024 15:46:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 343953C1D7F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2024 15:46:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 84C073C068A
 for <ltp@lists.linux.it>; Wed, 11 Sep 2024 15:46:14 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E056B200C20
 for <ltp@lists.linux.it>; Wed, 11 Sep 2024 15:46:13 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4ACE21F8B2;
 Wed, 11 Sep 2024 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1726062372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLNclQKaYSawNygZXPZyve4D4GsBNxH3mXqRfKhmlac=;
 b=Lxd6SJotGxuzK+h9fFFegLeAfJTK71yg8gFD4omCEMTAzl5rIf84QDQT4IFcDPj5NTRscZ
 /xqGWYvD8cQdCl+C5e1fwiVRthFmQFZibt+w+maJ3XGGrjcxRAXr3h6H3wotNbPIZVAyau
 lyTDZeVjV+o3+ZJ0fvKlwsEE9oF1Aig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1726062372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLNclQKaYSawNygZXPZyve4D4GsBNxH3mXqRfKhmlac=;
 b=T7LXQsxJbUmtl7vUxWet9c3WrLzicLFpUNgRUiQz2fWhXNL4M2YiS+Uiar1FjIoaRiFXMP
 50K2zXQvKmiMfLCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1726062372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLNclQKaYSawNygZXPZyve4D4GsBNxH3mXqRfKhmlac=;
 b=Lxd6SJotGxuzK+h9fFFegLeAfJTK71yg8gFD4omCEMTAzl5rIf84QDQT4IFcDPj5NTRscZ
 /xqGWYvD8cQdCl+C5e1fwiVRthFmQFZibt+w+maJ3XGGrjcxRAXr3h6H3wotNbPIZVAyau
 lyTDZeVjV+o3+ZJ0fvKlwsEE9oF1Aig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1726062372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QLNclQKaYSawNygZXPZyve4D4GsBNxH3mXqRfKhmlac=;
 b=T7LXQsxJbUmtl7vUxWet9c3WrLzicLFpUNgRUiQz2fWhXNL4M2YiS+Uiar1FjIoaRiFXMP
 50K2zXQvKmiMfLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CFE413A7C;
 Wed, 11 Sep 2024 13:46:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCwMDiSf4WZZSgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 11 Sep 2024 13:46:12 +0000
Date: Wed, 11 Sep 2024 15:44:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <ZuGe2gxREw2kKVfJ@yuki.lan>
References: <20240911-fcntl4_refactoring-v5-0-948401e7131c@suse.com>
 <20240911-fcntl4_refactoring-v5-1-948401e7131c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911-fcntl4_refactoring-v5-1-948401e7131c@suse.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Score: -8.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v5 1/2] Add silent macros for TST_EXP_EQ_*
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
> TST_EXP_EQ_LI_SILENT
> TST_EXP_EQ_LU_SILENT
> TST_EXP_EQ_SZ_SILENT
> TST_EXP_EQ_SSI_SILENT
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  include/tst_test_macros.h | 81 ++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 19 deletions(-)
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 7a443c803..4217700f3 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -344,29 +344,72 @@ const char *tst_errno_names(char *buf, const int *exp_errs, int exp_errs_cnt);
>         tst_res_(__FILE__, __LINE__, (EXPR) ? TPASS : TFAIL, "Expect: "       \
>                  TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, #EXPR), __VA_ARGS__));
>  
> -#define TST_EXP_EQ_(VAL_A, SVAL_A, VAL_B, SVAL_B, TYPE, PFS) do {\
> -	TYPE tst_tmp_a__ = VAL_A; \
> -	TYPE tst_tmp_b__ = VAL_B; \
> -	if (tst_tmp_a__ == tst_tmp_b__) { \
> -		tst_res_(__FILE__, __LINE__, TPASS, \
> -			SVAL_A " == " SVAL_B " (" PFS ")", tst_tmp_a__); \
> -	} else { \
> -		tst_res_(__FILE__, __LINE__, TFAIL, \
> -			SVAL_A " (" PFS ") != " SVAL_B " (" PFS ")", \
> -			tst_tmp_a__, tst_tmp_b__); \
> -	} \
> +#define TST_EXP_EQ_SILENT_(VAL_A, SVAL_A, VAL_B, SVAL_B, TYPE, PFS) do {       \
> +	TYPE tst_tmp_a__ = VAL_A;                                              \
> +	TYPE tst_tmp_b__ = VAL_B;                                              \
> +                                                                               \
> +	TST_PASS = 0;                                                          \
> +                                                                               \
> +	if (tst_tmp_a__ != tst_tmp_b__) {                                      \
> +		tst_res_(__FILE__, __LINE__, TFAIL,                            \
> +			SVAL_A " (" PFS ") != " SVAL_B " (" PFS ")",           \
> +			tst_tmp_a__, tst_tmp_b__);                             \
> +		break;                                                         \

No need for the break here now.

Otherwise: Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
