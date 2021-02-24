Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E83237BF
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 08:15:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5010B3C4E71
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 08:15:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 36C773C4E2F
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 08:15:30 +0100 (CET)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9DCC21000346
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 08:15:30 +0100 (CET)
Received: by mail-io1-xd34.google.com with SMTP id u20so992914iot.9
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8mnisfsMQh7DWxYjGik5XwdXMgnMbISx4g2kSATFAw=;
 b=f/1kPVJnrI4/oMXaLiD3A9nqwIOpFApFhCZdcN2wxDzkw8HEzjDoLmkzx8XgFnV9js
 0YMN0pgoymTdqi5YRZlfYZwF3TKw3UV13lyF4joleJDOfO4NQ0fYS0FVAY2+2aMURosv
 OYP5DuidoVYSZtae/Q4mLebQqJbXXje92qEC/QmoH89pKqEV3AkyCILpnVAxTVd/7M2E
 cQ6iczyLDhbfOc2hJtFB9dceJIbUC5gzKbn1SoCb7L5bH8+RobwPC8Abgn3/oBPIGksW
 1/BSCkkbYvCysPP41YneVVmZhEkxDAvYxu7banvcSt1WfDKVgY4DWa7LBdx91InG9gk/
 OB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8mnisfsMQh7DWxYjGik5XwdXMgnMbISx4g2kSATFAw=;
 b=Tfc2Ax2fDTdqjguEP3vXXt9ogAN11wPCIvMKSo0JqB1wYA9tIrpqvCPFQp/wz+8EBr
 NnSAkNLUl2Pm28rWNog00CoNa9Mv+JUQ2+bLA5k+2cLIJZMOOZVXGZbrYEOF0bEPNcqx
 CaM66F0wv5moj5puwPuXW0QC+H2K7V1zRI85P+G45Gz7NN21SnxD3I1u92e9flBJBNpd
 1BUckMMF9Ab51dVEjVC1kdvA1bwKlWUf6ZNAsDhOZdUbpeVREwGhH92m7oensqB3U4ff
 vtfgePxVYJav3Do7hNA0g5O+h6EJ3MyCyAtEeoQmJ8ZHjIR5+YAI3EOK8PdE+wibvShS
 QJTw==
X-Gm-Message-State: AOAM530rxX2NEcxdznSvujns0jnvXMLI/yQSeVGesshDtDLKBi+HQJhM
 gikce8hTv0LrboDBAcG07SNiUa+yZBGcly0dcvk=
X-Google-Smtp-Source: ABdhPJyF/smOB5Kba0djNj0xm/T8TE1j37Mud8M6KlacMU6jZr8rYUPvo66h860R47oVQnWzg/kASxLu8CyjwZ0tTlA=
X-Received: by 2002:a02:bb16:: with SMTP id y22mr31477148jan.123.1614150929172; 
 Tue, 23 Feb 2021 23:15:29 -0800 (PST)
MIME-Version: 1.0
References: <CAOQ4uxjGkm0Pn84UW6JKSK3mFkrPKykfkXDLL1V4YPSgAOXULA@mail.gmail.com>
 <20210218143635.24916-1-lhenriques@suse.de>
In-Reply-To: <20210218143635.24916-1-lhenriques@suse.de>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 24 Feb 2021 09:15:18 +0200
Message-ID: <CAOQ4uxjtap0jQat19h7g+6xvpMnqrwEihgN7pw11d57kkRVsaw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] vfs: fix copy_file_range regression in
 cross-fs copies
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Luis Henriques <lhenriques@suse.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Feb 18, 2021 at 4:35 PM Luis Henriques <lhenriques@suse.de> wrote:
>
> A regression has been reported by Nicolas Boichat, found while using the
> copy_file_range syscall to copy a tracefs file.  Before commit
> 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") the
> kernel would return -EXDEV to userspace when trying to copy a file across
> different filesystems.  After this commit, the syscall doesn't fail anymore
> and instead returns zero (zero bytes copied), as this file's content is
> generated on-the-fly and thus reports a size of zero.
>
> This patch restores some cross-filesystem copy restrictions that existed
> prior to commit 5dae222a5ff0 ("vfs: allow copy_file_range to copy across
> devices").  Filesystems are still allowed to fall-back to the VFS
> generic_copy_file_range() implementation, but that has now to be done
> explicitly.
>

Petr,

Please note that the check for verify_cross_fs_copy_support() in LTP
tests can no longer be used to determine if copy_file_range() is post v5.3.
You will need to fix the tests to expect cross-fs failures (this change of
behavior is supposed to be backported to stable kernels as well).

I guess the copy_file_range() tests will need to use min_kver.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
