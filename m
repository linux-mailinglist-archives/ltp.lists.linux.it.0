Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E05FC82D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 17:18:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A15E23CAEB8
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 17:18:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49E723C9590
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 17:18:03 +0200 (CEST)
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9AE7C14001F0
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 17:18:02 +0200 (CEST)
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
 id B15FD11E8; Wed, 12 Oct 2022 17:17:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id AE99610D3;
 Wed, 12 Oct 2022 17:17:58 +0200 (CEST)
Date: Wed, 12 Oct 2022 17:17:58 +0200 (CEST)
From: Nikolaus Voss <nv@vosn.de>
To: Petr Vorel <pvorel@suse.cz>
In-Reply-To: <Y0bUjRsFJLXsAcgL@pevik>
Message-ID: <d2d2afa4-b031-3455-38dd-c099715319e4@vosn.de>
References: <20221006081709.92303897@mail.steuer-voss.de>
 <dc5e3e41cf1465ddc70cbac0d77c4f2deff0213f.camel@linux.ibm.com>
 <Y0bBxv0569P/a3kW@yuki> <Y0bUjRsFJLXsAcgL@pevik>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/keyctl/keyctl09.c: fix test encrypted key
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, ltp@lists.linux.it,
 Yael Tzur <yaelt@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 12 Oct 2022, Petr Vorel wrote:
> Hi all,
>
>> Hi!
>>>> This commit fixes the test for adding encrypted keys with unencrypted data.
>>>> Unencryted data must be provided hex-ascii encoding. Due to a kernel
>>>> bug, the unencypted data was not decoded to binary thus the length of
>>>> the key was only half the specified key size. This patch doubles the key
>>>> size and adds a test with a wrong key size to trigger a corresponding
>>>> error.
>
>>>> This patch must be used with the kernel fix
>>>> https://lore.kernel.org/lkml/20220919072317.E41421357@mail.steuer-voss.de
>
>>> Petr, please correct me if I'm wrong.  Changing an existing LTP test so
>>> that it only works on kernels with the kernel patch applied, doesn't
>>> sound right.  The test should emit a warning if the original "valid
>>> payload" successfully loads.
>
>> We also have a policy not to work around any kernel bugs. So if this
>> really fixes a kernel bug it's okay that the test will fail on older
>> kernels without this fix and the patch that fixes kernel should be added
>> as a tag to the test.
>
> @Nikolaus, FYI:
> https://github.com/linux-test-project/ltp/wiki/C-Test-API#138-test-tags
>
> But the patchset has not been even accepted by kernel maintainer - searching in
> the kernel thread, looking into
> https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git/
> and to the next tree.
> Or am I wrong and it has been accepted?
>
> Even once (if ever) the patch is accepted I agree with Mimi it'd be better to
> add new test than change existing old (better for diagnostic what exactly went
> wrong).

ok, thanks, I will change the test and repost when the kernel patch has 
been accepted!

Niko


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
