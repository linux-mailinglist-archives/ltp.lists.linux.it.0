Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E35165E9D0A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:11:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F4323CAE01
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Sep 2022 11:11:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C03B23C1C21
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:11:53 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 31566600847
 for <ltp@lists.linux.it>; Mon, 26 Sep 2022 11:11:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6EB2220F7;
 Mon, 26 Sep 2022 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664183511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRwzaWjwEwlcqwS12OWyVBE+4Qs7iQ5R4FACvdnd7D0=;
 b=TwDL+GvokghLkI+96QYfJBeGTBPaMFU8RR3B0XzRjplal1kZ83zKtV6A2qe4mR6E7yJKdS
 pnG/E98XkFPVqsNqnY/R6K34qHxzJ+rCvtugGaas6g8J4AjZm3/kuWcJLLKTY8caatZwhR
 4/VFChV17a1a77Lw5L81mBP8ruLnhX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664183511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yRwzaWjwEwlcqwS12OWyVBE+4Qs7iQ5R4FACvdnd7D0=;
 b=qgrhv/UYnvwa1fdq6EXHmTdzgX8NizwqAjKLRj3R3OSydBDdci5es+9tCDMCFDxgOsK3BX
 9ZaWTdGwCUpLkzDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B43F313486;
 Mon, 26 Sep 2022 09:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tBXcKtdsMWMsbQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 26 Sep 2022 09:11:51 +0000
Date: Mon, 26 Sep 2022 11:13:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YzFtSVl0FqzngbmW@yuki>
References: <20220922210931.23982-1-pvorel@suse.cz>
 <20220922210931.23982-4-pvorel@suse.cz> <Yy3QzoD5kRFdVzVR@yuki>
 <Yy3gmoOYDOTLxfwh@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy3gmoOYDOTLxfwh@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3 v2] tst_test.sh: Fix filesystem support
 detection
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
> Broken were actually all shell tests which did not use TST_SKIP_FILESYSTEMS:
> e.g. all tests in net_stress.ipsec_* did run whole filesystem check:
> 
> tst_supported_fs_types.c:93: TINFO: Kernel supports ext2
> tst_supported_fs_types.c:55: TINFO: mkfs.ext2 does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports ext3
> tst_supported_fs_types.c:55: TINFO: mkfs.ext3 does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports ext4
> tst_supported_fs_types.c:55: TINFO: mkfs.ext4 does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports xfs
> tst_supported_fs_types.c:55: TINFO: mkfs.xfs does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports btrfs
> tst_supported_fs_types.c:55: TINFO: mkfs.btrfs does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports vfat
> tst_supported_fs_types.c:55: TINFO: mkfs.vfat does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports exfat
> tst_supported_fs_types.c:55: TINFO: mkfs.exfat does exist
> tst_supported_fs_types.c:123: TINFO: FUSE does support ntfs
> tst_supported_fs_types.c:55: TINFO: mkfs.ntfs does exist
> tst_supported_fs_types.c:93: TINFO: Kernel supports tmpfs
> tst_supported_fs_types.c:42: TINFO: mkfs is not needed for tmpfs
> sctp_ipsec 1 TINFO: timeout per run is 0h 5m 0s
> sctp_ipsec 1 TINFO: IPsec[ah/transport]
> sctp_ipsec 1 TINFO: run server 'netstress -T sctp -S 10.0.0.1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.hC471AeJ9L'
> ...
> 
> instead checking just filesystem in TMPDIR due empty $TST_FS_TYPE (I should have
> quoted it).
> 
> + there are IMA tests had this + specific problem.

Ah right, so it did useless checks and printed out a lot of lines too.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
