Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FF9E039F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2024 14:36:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA2943DD3D0
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2024 14:36:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F74B3DD2F5
 for <ltp@lists.linux.it>; Mon,  2 Dec 2024 14:36:21 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CBB57140FBD3
 for <ltp@lists.linux.it>; Mon,  2 Dec 2024 14:36:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D21A421175;
 Mon,  2 Dec 2024 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733146579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2TdmFco01BeDwftSq3BLWXddYdaOwqRbhohesYHKds=;
 b=RZ8YeOCBbgtGm6+cfhAl9MZFTAFI+iU4Xvv65JEZ/hdVqrFwkJK3Ci/fK4DCn/x1YAK7S5
 TOfCxzUSOfooiMXD5TOJS0cODDvYczz6gU5sHJdtofzHcGYFFGT0WR9C9MpMdLsiyPVvKZ
 u6VqpG20GlIf8EeodgeVi0uwJZ0eYNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733146579;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2TdmFco01BeDwftSq3BLWXddYdaOwqRbhohesYHKds=;
 b=GUUmWvSLYCdj/As8FQkYIz0Txh7bGyI7t/8eKEeOtM5V6q4SwC/xGI442DyshuC5fyEDsJ
 RpxshSWiZvN9McAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1733146576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2TdmFco01BeDwftSq3BLWXddYdaOwqRbhohesYHKds=;
 b=tzwQcI8MyCz59DmBiZ0AlnZhbZAZOHHPzDM3bDLyZRzIxzE8+TSK7fI99Jwi56VG/xQdkn
 loXRbbB+9j4hJLJLk1bBTWfaXuz8GZdNtiDjHT54ChS04v8eEHBjdLUWSnbSPBY6efQog1
 lfx05xYqZK8ZczLirWls0spKDaTY1lU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1733146576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2TdmFco01BeDwftSq3BLWXddYdaOwqRbhohesYHKds=;
 b=Nb1efb/x5Iq0/+E/zxrJAmQ+i/9Y7RZprvL2fOdlHUSPOa04p/rqqw5wKpgd8lPZDTnWeM
 ATSOjuSo6X/SdLCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C0C9B139C2;
 Mon,  2 Dec 2024 13:36:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HJQALdC3TWfUDQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Mon, 02 Dec 2024 13:36:16 +0000
Date: Mon, 2 Dec 2024 14:36:31 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Zorro Lang <zlang@kernel.org>
Message-ID: <Z02337yqxrfeZxIn@yuki.lan>
References: <20241201093606.68993-1-zlang@kernel.org>
 <20241201093606.68993-2-zlang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241201093606.68993-2-zlang@kernel.org>
X-Spam-Score: -8.30
X-Spamd-Result: default: False [-8.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[99.99%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/3] ioctl_ficlone02.c: set all_filesystems to zero
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
Cc: linux-btrfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This test need to skip test known filesystems, but according to below
> code logic (in lib/tst_test.c):
> 
>   if (!tst_test->all_filesystems && tst_test->skip_filesystems) {
>         long fs_type = tst_fs_type(".");
>         const char *fs_name = tst_fs_type_name(fs_type);
> 
>         if (tst_fs_in_skiplist(fs_name, tst_test->skip_filesystems)) {
>             tst_brk(TCONF, "%s is not supported by the test",
>             fs_name);
>         }
>
>         tst_res(TINFO, "%s is supported by the test", fs_name);
>   }
> 
> if all_filesystems is 1, the skip_filesystems doesn't work. So set
> all_filesystems to 0.

The code to skip filesystems in the case of all filesystems is in the
run_tcase_per_fs() function:

static int run_tcases_per_fs(void)
{
        int ret = 0;
        unsigned int i;
        const char *const *filesystems = tst_get_supported_fs_types(tst_test->skip_filesystems);

The skip_filesystems array is passed to the tst_get_supporte_fs_types()
function which filters out them.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
