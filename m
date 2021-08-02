Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1243DD07F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 08:29:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07DA33C7982
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 08:29:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F9053C56CE
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 08:29:42 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7224C60069E
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 08:29:41 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 1E8F89FB8C;
 Mon,  2 Aug 2021 06:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1627885780; bh=HXNlNxNXBQv4nkjz7QanAk6CFtt5iMhrJOrSlfDj6PQ=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=FCgAA7A84q8cNg4qDlIxdZjBlXXj+4UxwQt6wAX0CKaP6VO6WThsHlfBY+kuZQ6nK
 bi0I6bpUmXLGwHeQrVmT2uOm2gDB8kFiIDgBXYlTlz45DHD9qV33+B/ZuBqaXNfD1V
 dHH39bx10xM96PxfVkEx7vpEfg5Z/qq/BGxXzqkY=
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
References: <20210730133155.31284-1-chrubis@suse.cz>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <d99456d3-c3d3-a180-7d0c-55bc3042e63c@jv-coder.de>
Date: Mon, 2 Aug 2021 08:29:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210730133155.31284-1-chrubis@suse.cz>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 7/30/2021 3:31 PM, Cyril Hrubis wrote:
> There is actually no reason for lower limit on the device size, and we
> can safely allow the tests to request smaller device than the default
> hardcoded in the library. The backing file is preallocated without
> actually writing to it as long as the underlying filesystem supports it
> so the speedup will be minimal if measurable but we will at least spare
> some space which needs to be reserved on the filesystem which is still a
> good thing.
>
> The test may end up with a device that is bigger than the requsted size
> in a case that a real device was passed to the LTP for the testrun.  So
> tests should be able to cope with that and that's also the reason why
> the turning knob is still called dev_min_size.
>
> Also currently we use the dev_min_size only to increase the device size
> for a few tests so this change is safe and cannot break anything.
>
> CC: Joerg Vehlow <lkml@jv-coder.de>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>   lib/tst_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index c91c6cd55..4ef802c41 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -300,7 +300,7 @@ const char *tst_acquire_device__(unsigned int size)
>   	unsigned int acq_dev_size;
>   	uint64_t ltp_dev_size;
>   
> -	acq_dev_size = MAX(size, DEV_SIZE_MB);
> +	acq_dev_size = size ? size : DEV_SIZE_MB;
>   
>   	dev = getenv("LTP_DEV");
>   
This is not enough. tst_acquire_device__ calls tst_acquire_loop_device, 
that again has MAX(size, DEV_SIZE_MB).
But it should be sage to substitute it for size ? size : DEV_SIZE_MB as 
well.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
