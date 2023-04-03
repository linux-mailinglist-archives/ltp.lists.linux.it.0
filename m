Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA076D4E8E
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 19:01:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D68E3CCAB5
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Apr 2023 19:01:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A304B3C010A
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 19:01:16 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 532F41400759
 for <ltp@lists.linux.it>; Mon,  3 Apr 2023 19:01:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62E5C621FD;
 Mon,  3 Apr 2023 17:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD48DC433D2;
 Mon,  3 Apr 2023 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680541272;
 bh=xnW5hIXpTuROUFcKpo0ykx/YrJjS0qVEU72fS37dePA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=slmqfPysXJww2IbotFofyNskCUp9Eurk1OPhaHPKEoniQTKhPemii1LAUM0p3fwYe
 4Og5giv20zcTKc8L9GM8yxLJIQdgFi0T1VwSVoI0OJtcDR7dDGFVb2NmCGtk6uhTDX
 EoMMWPl38y+mMvcy1+h1YhgFfZPmr00BSTPbmtvb6/WP74Wm4SfWU/L1QvHpA3L5m+
 7N73KWCLc4hhwKQlzpnVGqpakkwYjJx3JiwByn3pjqZ7KJt20X493OqFduvvpQQHzT
 mCL7R2Mfakg7ijnR2plS8ge1OiYh5wxIXsweb/EuZNV0rIecwfiPw//C31EVl4vvnm
 5PwxTGxRyub1A==
Date: Mon, 3 Apr 2023 17:01:11 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <ZCsGV6/JecnAfRxL@gmail.com>
References: <7f06d661-cb57-cb8b-481b-cafafa92009b@fujitsu.com>
 <1680518676-2863-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1680518676-2863-2-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1680518676-2863-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/statx10: Add basic test for
 STATX_DIOALIGN on regular file
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

On Mon, Apr 03, 2023 at 06:44:34PM +0800, Yang Xu wrote:
> +static void verify_statx(void)
> +{
> +	struct statx buf;
> +
> +	memset(&buf, 0, sizeof(buf));
> +	TST_EXP_PASS(statx(AT_FDCWD, TESTFILE, 0, STATX_DIOALIGN, &buf),
> +		"statx(AT_FDCWD, %s, 0, STATX_DIOALIGN, &buf)", TESTFILE);
> +
> +	if (!(buf.stx_mask & STATX_DIOALIGN)) {
> +		tst_res(TCONF, "STATX_DIOALIGN is not supported until linux 6.1");
> +		return;
> +	}
> +
> +	if (buf.stx_dio_mem_align != 0)
> +		tst_res(TPASS, "stx_dio_mem_align:%u", buf.stx_dio_mem_align);
> +	else
> +		tst_res(TFAIL, "don't get stx_dio_mem_align on supported dio fs");
> +
> +	if (buf.stx_dio_offset_align != 0)
> +		tst_res(TPASS, "stx_dio_offset_align:%u", buf.stx_dio_offset_align);
> +	else
> +		tst_res(TFAIL, "don't get stx_dio_offset_align on supported dio fs");
> +}
> +
> +static void setup(void)
> +{
> +	if (strcmp(tst_device->fs_type, "xfs") && strcmp(tst_device->fs_type, "ext4"))
> +		tst_brk(TCONF, "This test only supports ext4 and xfs");
> +
> +	SAFE_FILE_PRINTF(TESTFILE, "AAAA");
> +	fd = open(TESTFILE, O_RDWR | O_DIRECT);
> +	if (fd == -1 && errno == EINVAL)
> +		tst_brk(TCONF, "The regular file is not on a filesystem that support DIO");
> +}

On ext4, files that use certain filesystem features (data journalling,
encryption, and verity) fall back to buffered I/O.  This test will fail when
passed such a file, as it assumes that DIO doesn't fall back to buffered I/O.

How is it guaranteed that such a file is not passed to this test?

- Eric

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
