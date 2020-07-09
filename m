Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42985219BFF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:22:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06C953C296C
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 11:22:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EB5E53C0133
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 11:22:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4230E1A016FE
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 11:22:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41682AEAC;
 Thu,  9 Jul 2020 09:22:18 +0000 (UTC)
Date: Thu, 9 Jul 2020 11:22:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200709092238.GD2381@yuki.lan>
References: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runltp: let each test acquire/release device
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
> Problem with runltp creating and using single loop device for all tests
> is that if one test fails/gets stuck or fails to umount loop device
> for any reason, then all subsequent tests also fail, because
> they try to use mounted device.
> 
> Don't force same loop device on all tests (unless it is chosen via
> env. variable DEVICE) and let LTP library try to acquire and release
> first usable loop device for each test.
> 
> Fixes #703
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  runltp | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/runltp b/runltp
> index ec0811834862..94e290d6dbb9 100755
> --- a/runltp
> +++ b/runltp
> @@ -963,17 +963,7 @@ create_block()
>  
>  set_block_device()
>  {
> -    if [ -z "$DEVICE" ]; then
> -        create_block
> -        if [ $? -ne 0 ]; then
> -            echo "no block device was specified on commandline."
> -            echo "Block device could not be created using loopback device"
> -            echo "Tests which require block device are disabled."
> -            echo "You can specify it with option -b"
> -	else
> -            export LTP_DEV=$DEVICE
> -        fi
> -    else
> +    if [ -n "$DEVICE" ]; then
>          export LTP_DEV=$DEVICE
>      fi
>  }

Shouldn't we remove the create_block() function as well?

Other than that, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
